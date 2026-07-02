package funkin.ui.transition.preload;


using StringTools;

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
super(Constants.PRELOADER_MIN_STAGE_TIME);

}

override function create():Void
{
super.create();

Lib.current.stage.color = Constants.COLOR_PRELOADER_BG;

this._width = Lib.current.stage.stageWidth;
this._height = Lib.current.stage.stageHeight;


ratio = normalizedWidth / BASE_WIDTH;
ratio = 1.0; // Desktop is always 1:1 scale

progressBarPieces = [];

progressLines = new openfl.display.Sprite();
progressLines.graphics.lineStyle(2, Constants.COLOR_PRELOADER_BAR);
progressLines.graphics.drawRect(-2, 0, this._width + 4, 30);
progressLines.y = this._height * 0.67;
addChild(progressLines);

for (i in 0...PIECES_COUNT)
{
piece.graphics.beginFill(Constants.COLOR_PRELOADER_BAR);
piece.graphics.drawRoundRect(0, 0, pieceWidth - pieceGap, BAR_HEIGHT, 4, 4);
piece.graphics.endFill();

piece.x = i * (piece.width + pieceGap);
piece.y = progressLines.y + 8;
addChild(piece);
progressBarPieces.push(piece);
}


progressLeftTextFormat.align = TextFormatAlign.LEFT;
progressRightTextFormat.align = TextFormatAlign.RIGHT;

progressLeftText = makeText(BAR_PADDING * ratio, progressLines.y, 'Downloading assets...', Constants.COLOR_PRELOADER_BAR);
progressLeftText.defaultTextFormat = progressLeftTextFormat;
progressLeftText.width = this._width - BAR_PADDING * 2;
addChild(progressLeftText);
progressLeftText.y -= (progressLeftText.textHeight / ratio) * 2.5;


progressRightText = makeText(BAR_PADDING, this._height - BAR_PADDING - BAR_HEIGHT - 16 - 4, '0%', Constants.COLOR_PRELOADER_BAR);
progressRightText.defaultTextFormat = progressRightTextFormat;
addChild(progressRightText);

rTextGroup = new Sprite();
rTextGroup.graphics.beginFill(Constants.COLOR_PRELOADER_BAR, 1);
rTextGroup.graphics.drawRoundRect(0, 40, 64, 20, 5, 5);
rTextGroup.graphics.drawRoundRect(70, 40, 58, 20, 5, 5);
rTextGroup.graphics.endFill();
rTextGroup.graphics.beginFill(Constants.COLOR_PRELOADER_BAR, 0.1);
rTextGroup.graphics.drawRoundRect(0, 40, 128, 20, 5, 5);
rTextGroup.graphics.endFill();
rTextGroup.x = this._width * 0.64;
rTextGroup.y = progressLeftText.y;
addChild(rTextGroup);

dspText = makeText(10, 33, 'DSP', 0x000000);
dspText.width = this._width;
dspText.height = 30;
rTextGroup.addChild(dspText);

fnfText = makeText(78, 33, 'FNF', 0x000000);
fnfText.width = this._width;
fnfText.height = 30;
rTextGroup.addChild(fnfText);

enhancedText = makeText(-100, 40, 'ENHANCED', Constants.COLOR_PRELOADER_BAR);
enhancedText.width = this._width;
enhancedText.height = 100;
rTextGroup.addChild(enhancedText);

stereoText = makeText(0, 0, 'STEREO', Constants.COLOR_PRELOADER_BAR);
stereoText.width = this._width;
stereoText.height = 100;
rTextGroup.addChild(stereoText);


vfdBitmap = new Bitmap(new BitmapData(this._width, this._height, true, 0xFFFFFFFF));
addChild(vfdBitmap);

vfdShader = new VFDOverlay();
vfdBitmap.shader = vfdShader;

touchHereToPlay = createBitmap(TouchHereToPlayImage, function(bmp:Bitmap)
{
bmp.scaleX = bmp.scaleY = ratio * 0.5;
bmp.x = (this._width - bmp.width) / 2;
bmp.y = (this._height - bmp.height) / 2;
});
touchHereToPlay.alpha = 0.0;

touchHereSprite = new Sprite();
touchHereSprite.buttonMode = false;
touchHereSprite.addChild(touchHereToPlay);
addChild(touchHereSprite);
}

function makeText(txtX:Float, txtY:Float, txt:String, color:Int):TextField
{
text.selectable = false;
text.width = this._width - BAR_PADDING * 2;
text.x = txtX;
text.y = txtY;
text.text = txt;
text.textColor = color;
}


override function update(percent:Float):Void
{

vfdShader.update(elapsed * 100);

downloadingAssetsPercent = percent;
updateGraphics(loadPercent, elapsed);

lastElapsed = elapsed;
}

function updateState(percent:Float, elapsed:Float):Float
{
switch (currentState)
{
case FunkinPreloaderState.NotStarted:


case FunkinPreloaderState.DownloadingAssets:
|| (elapsed > Constants.PRELOADER_MIN_STAGE_TIME
&& downloadingAssetsComplete)) currentState = FunkinPreloaderState.PreloadingPlayAssets;


case FunkinPreloaderState.PreloadingPlayAssets:
{
preloadingPlayAssetsStartTime = elapsed;
preloadingPlayAssetsPercent = 0.0;


/*

future.onProgress((loaded:Int, total:Int) -> {
preloadingPlayAssetsPercent = loaded / total;
});
future.onComplete((library:lime.utils.AssetLibrary) -> {
});
*/

preloadingPlayAssetsPercent = 1.0;
preloadingPlayAssetsComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.InitializingScripts;
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
initializingScriptsPercent = 0.0;

/*

future.onProgress((loaded:Int, total:Int) -> {
initializingScriptsPercent = loaded / total;
});
future.onComplete((result:Array<String>) -> {
});
*/

initializingScriptsPercent = 1.0;
currentState = FunkinPreloaderState.CachingGraphics;
}


case CachingGraphics:
{
cachingGraphicsPercent = 0.0;
cachingGraphicsStartTime = elapsed;

/*

future.onProgress((loaded:Int, total:Int) -> {
cachingGraphicsPercent = loaded / total;
});
future.onComplete((_result) -> {
});
*/

cachingGraphicsPercent = 1.0;
cachingGraphicsComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.CachingAudio;
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
currentState = FunkinPreloaderState.CachingAudio;
}
else
{
}
}

case CachingAudio:
{
cachingAudioPercent = 0.0;
cachingAudioStartTime = elapsed;


/*

future.onProgress((loaded:Int, total:Int) -> {
cachingAudioPercent = loaded / total;
});
future.onComplete((_result) -> {
});
*/

cachingAudioPercent = 1.0;
cachingAudioComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.CachingData;
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
currentState = FunkinPreloaderState.CachingData;
}
else
{
}
}

case CachingData:
{
cachingDataPercent = 0.0;
cachingDataStartTime = elapsed;




/*
future.onProgress((loaded:Int, total:Int) -> {
cachingDataPercent = loaded / total;
});
future.onComplete((_result) -> {
});
*/
cachingDataPercent = 1.0;
cachingDataComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.ParsingSpritesheets;
}
else
{
else
}
}
else
{
{
currentState = FunkinPreloaderState.ParsingSpritesheets;
}
}


case ParsingSpritesheets:
{
parsingSpritesheetsPercent = 0.0;
parsingSpritesheetsStartTime = elapsed;


/*
future.onProgress((loaded:Int, total:Int) -> {
parsingSpritesheetsPercent = loaded / total;
});
future.onComplete((_result) -> {
});
*/
parsingSpritesheetsPercent = 1.0;
parsingSpritesheetsComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.ParsingStages;
}
else
{
else
}
}
else
{
{
currentState = FunkinPreloaderState.ParsingStages;
}
}


case ParsingStages:
{
parsingStagesPercent = 0.0;
parsingStagesStartTime = elapsed;

/*

future.onProgress((loaded:Int, total:Int) -> {
parsingStagesPercent = loaded / total;
});

future.onComplete((_result) -> {
});
*/

parsingStagesPercent = 1.0;
parsingStagesComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.ParsingCharacters;
}
else
{
else
}
}
else
{
{
currentState = FunkinPreloaderState.ParsingCharacters;
}
}


case ParsingCharacters:
{
parsingCharactersPercent = 0.0;
parsingCharactersStartTime = elapsed;

/*

future.onProgress((loaded:Int, total:Int) -> {
parsingCharactersPercent = loaded / total;
});

future.onComplete((_result) -> {
});
*/

parsingCharactersPercent = 1.0;
parsingCharactersComplete = true;
}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.ParsingSongs;
}
else
{
else
}
}
else
{
{
currentState = FunkinPreloaderState.ParsingSongs;
}
}


case ParsingSongs:
{
parsingSongsPercent = 0.0;
parsingSongsStartTime = elapsed;

/*

future.onProgress((loaded:Int, total:Int) -> {
parsingSongsPercent = loaded / total;
});

future.onComplete((_result) -> {
});
*/

parsingSongsPercent = 1.0;
parsingSongsComplete = true;

}
else if (Constants.PRELOADER_MIN_STAGE_TIME > 0)
{
{
currentState = FunkinPreloaderState.Complete;
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
currentState = FunkinPreloaderState.Complete;
}
else
{
}
}
case FunkinPreloaderState.Complete:
{
completeTime = elapsed;
}

case FunkinPreloaderState.TouchHereToPlay:
{
completeTime = elapsed;
}

{
touchHereSprite.buttonMode = true;
touchHereToPlay.alpha = 1.0;
removeChild(vfdBitmap);

addEventListener(MouseEvent.CLICK, onTouchHereToPlay);
touchHereSprite.addEventListener(MouseEvent.MOUSE_OVER, overTouchHereToPlay);
touchHereSprite.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownTouchHereToPlay);
touchHereSprite.addEventListener(MouseEvent.MOUSE_OUT, outTouchHereToPlay);
}


default:
}

}

function overTouchHereToPlay(e:MouseEvent):Void
{
scaleAndCenter(touchHereToPlay, ratio * 1.1 * 0.5);
}

function outTouchHereToPlay(e:MouseEvent):Void
{
scaleAndCenter(touchHereToPlay, ratio * 0.5);
}

function mouseDownTouchHereToPlay(e:MouseEvent):Void
{
touchHereToPlay.y += 10;
}

function onTouchHereToPlay(e:MouseEvent):Void
{
scaleAndCenter(touchHereToPlay, ratio * 0.5);

removeEventListener(MouseEvent.CLICK, onTouchHereToPlay);
touchHereSprite.removeEventListener(MouseEvent.MOUSE_OVER, overTouchHereToPlay);
touchHereSprite.removeEventListener(MouseEvent.MOUSE_OUT, outTouchHereToPlay);
touchHereSprite.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownTouchHereToPlay);

immediatelyStartGame();
}

function scaleAndCenter(bmp:Bitmap, scale:Float)
{
bmp.scaleX = bmp.scaleY = scale;
bmp.x = (this._width - bmp.width) / 2;
bmp.y = (this._height - bmp.height) / 2;
}

public static final TOTAL_STEPS:Int = 11;

function updateGraphics(percent:Float, elapsed:Float):Void
{
{
{
currentState = FunkinPreloaderState.TouchHereToPlay;
immediatelyStartGame();
}
}
else
{

for (i => piece in progressBarPieces)
piece.alpha = i <= piecesToRender ? 0.9 : 0.1;
}

for (_ in 0...ellipsisCount)
ellipsis += '.';

updateProgressLeftText(currentState.getProgressLeftText(TOTAL_STEPS, ellipsis));

progressRightText.text = '$percentage%';

{
}

super.update(percent);
}

function updateProgressLeftText(text:Null<String>):Void
{

else if (progressLeftText.text != text)
{
progressLeftText.defaultTextFormat = new TextFormat("DS-Digital", 32, Constants.COLOR_PRELOADER_BAR, true);
progressLeftText.defaultTextFormat.align = TextFormatAlign.LEFT;
progressLeftText.text = text;

dspText.defaultTextFormat = new TextFormat("Quantico", 20, 0x000000, false);
dspText.text = 'DSP'; // fukin dum....
dspText.textColor = 0x000000;

fnfText.defaultTextFormat = new TextFormat("Quantico", 20, 0x000000, false);
fnfText.text = 'FNF';
fnfText.textColor = 0x000000;

enhancedText.defaultTextFormat = new TextFormat("Inconsolata Black", 16, Constants.COLOR_PRELOADER_BAR, false);
enhancedText.text = 'ENHANCED';
enhancedText.textColor = Constants.COLOR_PRELOADER_BAR;

stereoText.defaultTextFormat = new TextFormat("Inconsolata Bold", 36, Constants.COLOR_PRELOADER_BAR, false);
stereoText.text = 'NATURAL STEREO';
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
_loaded = true;
}

/**
* Fade out the VFD display pieces.
* @param	elapsed Elapsed time since the preloader started.
* @return	Elapsed time since the preloader pieces started fading out.
*/
function renderDisplayFadeOut(elapsed:Float):Float
{

progressLeftText.alpha = alphaToFade;
progressRightText.alpha = alphaToFade;
rTextGroup.alpha = alphaToFade;
progressLines.alpha = alphaToFade;

for (piece in progressBarPieces)
piece.alpha = alphaToFade;

}

override function destroy():Void
{
super.destroy();
}

override function onLoaded():Void
{
super.onLoaded();
_loaded = false;
downloadingAssetsComplete = true;
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
steps = steps ?? FunkinPreloader.TOTAL_STEPS;
suffix = suffix ?? '';
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
