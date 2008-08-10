
class MyPreloader extends Preloader
{
	// register our Preloader class to be created instead of the base Preloader class
	static var registered:Boolean = Preloader.register(MyPreloader);
	
	// called when the movie begins loading
	function onInit()
	{
		_root.createTextField("debug_txt", 0, 10, 10, 100, 20);
		_root.debug_txt.setNewTextFormat(new TextFormat("_sans"));
	}
	
	// called periodically as the movie loads
	function onStatus(status:PreloadStatus)
	{
		_root.debug_txt.text = Math.round(100 * status.bytesLoaded / status.bytesTotal) + "%";
	}
	
	// called after the movie is finished loading (always after onStatus)
	function onComplete()
	{
		_root.debug_txt.removeTextField();
	}
}
