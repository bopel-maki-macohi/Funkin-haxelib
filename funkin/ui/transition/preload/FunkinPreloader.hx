


class TouchHereToPlayImage extends BitmapData
{
}

/**
* This preloader displays a VFD-esque display while the game downloads assets.
*/
class FunkinPreloader extends FlxBasePreloader
{
/**
* The width at the base resolution.
* Scaled up/down appropriately as needed.
*/

/**
* Margin at the sides and bottom, around the loading bar.
*/



/**
* Display takes this long (in seconds) to fade in.
*/














/**
* The timestamp when the other steps completed and the `Finishing up` step started.
*/




public function new()
{

}

override function create():Void
{




ratio = 1.0; // Desktop is always 1:1 scale



for (i in 0...PIECES_COUNT)
{

}














touchHereToPlay = createBitmap(TouchHereToPlayImage, function(bmp:Bitmap)
{

}

function makeText(txtX:Float, txtY:Float, txt:String, color:Int):TextField
{
}


override function update(percent:Float):Void
{



}

function updateState(percent:Float, elapsed:Float):Float
{
switch (currentState)
{
case FunkinPreloaderState.NotStarted:


case FunkinPreloaderState.DownloadingAssets:
|| (elapsed > Constants.PRELOADER_MIN_STAGE_TIME


case FunkinPreloaderState.PreloadingPlayAssets:
{


/*

future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((library:lime.utils.AssetLibrary) -> {
*/

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
else
}
}
else
{
}


case FunkinPreloaderState.InitializingScripts:
{

/*

future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((result:Array<String>) -> {
*/

}


case CachingGraphics:
{

/*

future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((_result) -> {
*/

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
{
}
else
{
}
}
}
else
{
{
}
else
{
}
}

case CachingAudio:
{


/*

future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((_result) -> {
*/

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
{
}
else
{
}
}
}
else
{
{
}
else
{
}
}

case CachingData:
{




/*
future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((_result) -> {
*/
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
else
}
}
else
{
{
}
}


case ParsingSpritesheets:
{


/*
future.onProgress((loaded:Int, total:Int) -> {
future.onComplete((_result) -> {
*/
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
else
}
}
else
{
{
}
}


case ParsingStages:
{

/*

future.onProgress((loaded:Int, total:Int) -> {

future.onComplete((_result) -> {
*/

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
else
}
}
else
{
{
}
}


case ParsingCharacters:
{

/*

future.onProgress((loaded:Int, total:Int) -> {

future.onComplete((_result) -> {
*/

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
else
}
}
else
{
{
}
}


case ParsingSongs:
{

/*

future.onProgress((loaded:Int, total:Int) -> {

future.onComplete((_result) -> {
*/


}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
}
else
{
{
}
else
{
}
}
}
else
{
{
}
else
{
}
}
case FunkinPreloaderState.Complete:
{
}

case FunkinPreloaderState.TouchHereToPlay:
{
}

{

}


default:
}

}

function overTouchHereToPlay(e:MouseEvent):Void
{
}

function outTouchHereToPlay(e:MouseEvent):Void
{
}

function mouseDownTouchHereToPlay(e:MouseEvent):Void
{
}

function onTouchHereToPlay(e:MouseEvent):Void
{


}

function scaleAndCenter(bmp:Bitmap, scale:Float)
{
}


function updateGraphics(percent:Float, elapsed:Float):Void
{
{
{
}
}
else
{

for (i => piece in progressBarPieces)
}

for (_ in 0...ellipsisCount)



{
}

}

function updateProgressLeftText(text:Null<String>):Void
{

else if (progressLeftText.text != text)
{

dspText.text = 'DSP'; // fukin dum....



}
}

/**
* Whether or not we are in flipped landscape device rotation,
* generally for mobile to accomodate the device notch!
* @return Bool
*/
function isLandscapeFlipped():Bool
{
}

function immediatelyStartGame():Void
{
}

/**
* Fade out the VFD display pieces.
* @param	elapsed Elapsed time since the preloader started.
* @return	Elapsed time since the preloader pieces started fading out.
*/
function renderDisplayFadeOut(elapsed:Float):Float
{


for (piece in progressBarPieces)

}

override function destroy():Void
{
}

override function onLoaded():Void
{
}
}

enum abstract FunkinPreloaderState(String) to String
{
/**
* The state before downloading has begun.
* Moves to either `DownloadingAssets` or `CachingGraphics` based on platform.
*/

/**
* Downloading assets.
* On HTML5, Lime will do this for us, before calling `onLoaded`.
* On Native, this step will be completed immediately, and we'll go straight to `CachingGraphics`.
*/

/**
* Preloading play assets.
* Loads the `manifest.json` for the `gameplay` library.
* If we make the base preloader do this, it will download all the assets as well,
* so we have to do it ourselves.
*/

/**
* Loading FireTongue, loading Polymod, parsing and instantiating module scripts.
*/

/**
* Loading all graphics from the `core` library to the cache.
*/

/**
* Loading all audio from the `core` library to the cache.
*/

/**
* Loading all data files from the `core` library to the cache.
*/

/**
* Parsing all XML files from the `core` library into FlxFramesCollections and caching them.
*/

/**
* Parsing stage data and scripts.
*/

/**
* Parsing character data and scripts.
*/

/**
* Parsing song data and scripts.
*/

/**
* Finishing up.
*/

/**
* Touch Here to Play is displayed.
*/

/**
* Formats the status text for progress bar display.
* @param steps The total number of steps. Defaults to `FunkinPreloader.TOTAL_STEPS`.
* @param suffix What to append to the end of the text, usually those dynamic ellipsis. Defaults to an empty string.
* @return String 'Loading \n0/$steps $suffix' for example
*/
public function getProgressLeftText(?steps:Int, ?suffix:String):String
{
switch (this)
{
case NotStarted:
case DownloadingAssets:
case PreloadingPlayAssets:
case InitializingScripts:
case CachingGraphics:
case CachingAudio:
case CachingData:
case ParsingSpritesheets:
case ParsingStages:
case ParsingCharacters:
case ParsingSongs:
case Complete:
case TouchHereToPlay:
default:
}
}
}
