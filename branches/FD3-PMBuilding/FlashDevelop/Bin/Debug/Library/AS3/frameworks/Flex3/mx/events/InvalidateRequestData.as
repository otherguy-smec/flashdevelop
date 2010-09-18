﻿package mx.events
{
	/**
	 *  The InvalidateRequestData class defines constants for the values 
	 */
	public class InvalidateRequestData
	{
		/**
		 *  Bit to indicate the request handler should invalidate
		 */
		public static const PROPERTIES : uint = 0x0002;
		/**
		 *  Bit to indicate the request handler should invalidate
		 */
		public static const SIZE : uint = 0x0004;
		/**
		 *  Bit to indicate the request handler should invalidate
		 */
		public static const DISPLAY_LIST : uint = 0x0001;

	}
}