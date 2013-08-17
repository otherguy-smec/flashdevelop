﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Sockets;
using System.ComponentModel;
using System.Threading;

namespace FlashDebugger.Debugger.HxCpp.Server
{
	/// <summary>
	/// Created from accepted Socket, 
	/// </summary>
	class Session
	{
		private Socket socket;
		private BackgroundWorker readWorker;
		private Dictionary<int, Message> responseQ;
		private Queue<Message> eventQ;
		int nextCmdId = 1;

		public Session(Socket socket)
		{
			this.socket = socket;
			responseQ = new Dictionary<int, Message>();
			eventQ = new Queue<Message>();
		}

		public void Bind()
		{
			try
			{
				socket.ReceiveTimeout = 5000;
				PluginCore.Managers.TraceManager.AddAsync("Sending ServerID", -1);
				Protocol.WriteServerIdentification(socket);
				PluginCore.Managers.TraceManager.AddAsync("Reading ClientID", -1);
				Protocol.ReadClientIdentification(socket);
				PluginCore.Managers.TraceManager.AddAsync("Read ClientID", -1);
				readWorker = new BackgroundWorker();
				readWorker.DoWork += new DoWorkEventHandler(readWorker_DoWork);
				readWorker.RunWorkerAsync();

				// TEST
				// do files change? can we just load them once?
				//Protocol.WriteCommand(socket, Command.Files());
			}
			catch (Exception e)
			{
				PluginCore.Managers.TraceManager.AddAsync("Bind e " + e.ToString(), -1);
			}
		}

		public void Unbind()
		{
			PluginCore.Managers.TraceManager.AddAsync("Unbind", -1);
			socket.Close();
		}


		public Message Request(Command cmd)
		{
			int cmdId = Interlocked.Increment(ref nextCmdId);
			
			Protocol.WriteCommand(socket, Command.CommandId(cmdId, cmd));

			// wait w/ timeout
			int timeout = 5000;
			int period = 500;
			while (timeout > 0)
			{
				lock (responseQ)
				{
					if (responseQ.ContainsKey(cmdId))
					{
						Message res = responseQ[cmdId];
						responseQ.Remove(cmdId);
						return res;
					}
				}
				try
				{
					System.Threading.Thread.Sleep(period);
				}
				catch (System.Threading.ThreadInterruptedException) { }
				timeout -= period;
			}
			throw new Exception("No reponse in time");
		}

		public int GetEventCount()
		{
			lock (eventQ)
			{
				return eventQ.Count; // what about null?
			}
		}

		public Message GetNextEvent()
		{
			lock (eventQ)
			{
				return eventQ.Dequeue();
			}
		}

		public bool Connected
		{
			get { return socket.Connected; }
		}


		void readWorker_DoWork(object sender, DoWorkEventArgs e)
		{
			PluginCore.Managers.TraceManager.AddAsync("DoWork", -1);
			socket.ReceiveTimeout = 0;

			while (socket.Connected)
			{
				try
				{
					HaxeEnum henum = Protocol.ReadMessage(socket);
					Message msg = Message.FromEnum(henum);
					// transalte HaxeEnum into a sane structure! get message id from it!
					if (msg is Message.MessageId)
					{
						lock (responseQ)
						{
							Message.MessageId msg_id = (Message.MessageId)msg;
							PluginCore.Managers.TraceManager.AddAsync("msg " + msg_id.id + ": " + msg_id.message.ToString(), -1);
							responseQ.Add(msg_id.id, msg_id.message);
						}
					}
					else
					{
						lock (eventQ)
						{
							PluginCore.Managers.TraceManager.AddAsync("evt " + msg.ToString(), -1);
							eventQ.Enqueue(msg);
						}
					}
				}
				catch (Exception exc)
				{
					// stop?
					PluginCore.Managers.TraceManager.AddAsync("DoWork exception " + exc.ToString(), -1);
					lock (eventQ)
					{
						// singnal end
						eventQ.Enqueue(null);
					}
					return;
				}
			}
			PluginCore.Managers.TraceManager.AddAsync("DoWork end", -1);
		}
	}
}
