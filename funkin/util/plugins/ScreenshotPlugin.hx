

/**
* Parameters for starting the `ScreenshotPlugin`.
*/
typedef ScreenshotPluginParams =
{
?region:Rectangle,

/**
* A Flixel plugin, which renders on top of the game, and provides the functionality
* and visual feedback for taking screenshots.
*/
class ScreenshotPlugin extends FlxBasic
{
/**
* Current `ScreenshotPlugin` instance
*/


static function get_instance():ScreenshotPlugin
{
{
_instance = new ScreenshotPlugin({
}
}

/**
* The folder where screenshots are saved
*/


/**
* A signal fired before the screenshot is taken.
*/

/**
* A signal fired after the screenshot is taken.
* @param bitmap The bitmap that was captured.
*/












public function new(params:ScreenshotPluginParams)
{









}

public override function update(elapsed:Float):Void
{
{
{
}
else
{
{
{
}
}
}
}

/**
* This looks scary, oh no I pressed the button but no screenshot because screenshotTakenFrame != 0!
* But if you're crazy enough to have a macro that bumps into this
* then you're probably also going to hit 100 screenshots real fast
*/
{
{
}
{
}
for (sprite in [flashSprite, previewSprite])
{
}
{
screenshotSpammedTimer = new FlxTimer().start(1, function(_)
{
{
}
}
else // Pressing the screenshot key more than once every second enables the screenshot spam mode and resets the timer
{
}
}
else if (screenshotTakenFrame > 1)
{
capture(); // After all these checks and waiting a frame, we finally try taking a screenshot
}
else if (screenshotTakenFrame > 0)
{
}
}

/**
* Initialize the screenshot plugin.
*/
public static function initialize():Void
{
}

/**
* @return `true` if the screenshot key is currently pressed.
*/
public function hasPressedScreenshot():Bool
{
}

function resizeBitmap(width:Int, height:Int):Void
{
}

/**
* Capture the game screen as a bitmap.
*/
public function capture():Void
{

{
{

}
else
{
}
{
}
}
else
{
{
}
}
}


/**
* Visual and audio feedback when a screenshot is taken.
*/
function showCaptureFeedback():Void
{

}


/**
* Show a fancy preview for the screenshot
*/
function showFancyPreview(shot:Bitmap):Void
{




{
}


{

{
}


FlxTween.cancelTweensOf(previewSprite); // Reset the tweens
new FlxTimer().start(PREVIEW_INITIAL_DELAY, function(_)
{
FlxTween.tween(previewSprite, {alpha: targetAlpha, y: 0}, PREVIEW_FADE_IN_DURATION, {
ease: FlxEase.quartOut,
onComplete: function(_)
{
new FlxTimer().start(PREVIEW_FADE_OUT_DELAY, function(_)
{
FlxTween.tween(previewSprite, {alpha: 0.0, y: 10}, PREVIEW_FADE_OUT_DURATION, {
ease: FlxEase.quartInOut,
onComplete: function(_)
{
{
}
else if (wasMouseHidden && !FlxG.mouse.visible)
{
}


}
}
}

/**
* This is a separate function, as running the previewsprite check
* in the other one would mean you can't open the folder when the preview's hidden, lol
* That, and it needs a mouse event as a parameter to work.
*/
function previewSpriteOpenScreenshotsFolder(e:MouseEvent):Void
{
}

function openScreenshotsFolder():Void
{
}

function onWindowClose(exitCode:Int):Void
{
}

function onWindowCrash(message:String):Void
{
}

static function getCurrentState():FlxState
{
{
}
}

static function getScreenshotPath():String
{
}

static function makeScreenshotPath():Void
{
}

/**
* Convert a Bitmap to a PNG ByteArray to save to a file.
*/
function encode(bitmap:Bitmap):ByteArray
{
}


/**
* Save the generated bitmap to a file.
* @param bitmap The bitmap to save.
* @param targetPath The name of the screenshot.
* @param screenShotNum Used for the delay save option, to space out the saving of the images.
* @param delaySave If true, the image gets saved with the screenShotNum as the delay.
*/
function saveScreenshot(bitmap:Bitmap, targetPath = "image", screenShotNum:Int = 0, delaySave:Bool = true):Void
{
{
}
else
{
{
}
}


{ // Save the images with a delay (a timer)
new FlxTimer().start(screenShotNum, function(_)
{

{
}
else
{
}
}
else // Save the screenshot immediately
{

{
}
else
{
}
}
}

function saveBufferedScreenshots(screenshots:Array<Bitmap>, screenshotNames:Array<String>):Void
{

asyncLoop = new FlxAsyncLoop(screenshots.length, () ->
{
{
}
{
showFancyPreview(screenshots[screenshots.length - 1]); // show the preview for the last screenshot
}
}

/**
* Similar to the above function, but cancels the tweens, undos the mouse
* and doesn't have the async loop because this is called before the state changes
*/
function saveUnsavedBufferedScreenshots():Void
{
{
for (sprite in [flashSprite, previewSprite])
{
}
}

{
}
else if (wasMouseHidden && !FlxG.mouse.visible)
{
}




for (i in 0...unsavedScreenshotBuffer.length)
{
}

}

function postStateSwitch():Void
{
}

override public function destroy():Void
{




for (parent in [flashSprite, previewSprite])
{
for (child in parent.__children)
{
}
}

}
}
