package funkin.util.plugins;


/**
* Parameters for starting the `ScreenshotPlugin`.
*/
typedef ScreenshotPluginParams =
{
?region:Rectangle,
};

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
});
}
}

/**
* The folder where screenshots are saved
*/
public static final SCREENSHOT_FOLDER:String = 'screenshots';


/**
* A signal fired before the screenshot is taken.
*/

/**
* A signal fired after the screenshot is taken.
* @param bitmap The bitmap that was captured.
*/












public function new(params:ScreenshotPluginParams)
{
super();

lastWidth = FlxG.width;
lastHeight = FlxG.height;

flashSprite = new Sprite();
flashSprite.mouseEnabled = false;
flashSprite.alpha = 0;
flashBitmap = new Bitmap(new BitmapData(lastWidth, lastHeight, true, Preferences.flashingLights ? FlxColor.WHITE : FlxColor.TRANSPARENT));
flashSprite.addChild(flashBitmap);

previewSprite = new Sprite();
previewSprite.alpha = 0;

outlineBitmap = new Bitmap(new BitmapData(Std.int(lastWidth / 5) + 10, Std.int(lastHeight / 5) + 10, true, 0xFFFFFFFF));
outlineBitmap.x = 5;
outlineBitmap.y = 5;
previewSprite.addChild(outlineBitmap);

shotPreviewBitmap = new Bitmap();
shotPreviewBitmap.scaleX /= 5;
shotPreviewBitmap.scaleY /= 5;

previewSprite.addChild(shotPreviewBitmap);

region = params.region ?? null;

onPreScreenshot = new FlxTypedSignal<Void->Void>();
onPostScreenshot = new FlxTypedSignal<Bitmap->Void>();
WindowUtil.windowExit.add(onWindowClose);

CrashHandler.errorSignal.add(onWindowCrash);
CrashHandler.criticalErrorSignal.add(onWindowCrash);
}

public override function update(elapsed:Float):Void
{
{
{
asyncLoop.start();
}
else
{
{
{
screenshotBuffer = [];
screenshotNameBuffer = [];
}
asyncLoop.kill();
asyncLoop.destroy();
asyncLoop = null;
}
}
}
super.update(elapsed);

/**
* This looks scary, oh no I pressed the button but no screenshot because screenshotTakenFrame != 0!
* But if you're crazy enough to have a macro that bumps into this
* then you're probably also going to hit 100 screenshots real fast
*/
{
{
openScreenshotsFolder();
}
{
wasMouseHidden = true;
Cursor.hide();
}
for (sprite in [flashSprite, previewSprite])
{
FlxTween.cancelTweensOf(sprite);
sprite.alpha = 0;
}
{
screenshotSpammedTimer = new FlxTimer().start(1, function(_)
{
screenshotBeingSpammed = false;
{
wasMouseHidden = false;
Cursor.show();
}
});
}
else // Pressing the screenshot key more than once every second enables the screenshot spam mode and resets the timer
{
screenshotBeingSpammed = true;
screenshotSpammedTimer.reset(1);
}
screenshotTakenFrame++;
}
else if (screenshotTakenFrame > 1)
{
screenshotTakenFrame = 0;
capture(); // After all these checks and waiting a frame, we finally try taking a screenshot
}
else if (screenshotTakenFrame > 0)
{
screenshotTakenFrame++;
}
}

/**
* Initialize the screenshot plugin.
*/
public static function initialize():Void
{
}));
}

/**
* @return `true` if the screenshot key is currently pressed.
*/
public function hasPressedScreenshot():Bool
{
}

function resizeBitmap(width:Int, height:Int):Void
{
lastWidth = width;
lastHeight = height;
flashBitmap.bitmapData = new BitmapData(lastWidth, lastHeight, true, Preferences.flashingLights ? FlxColor.WHITE : FlxColor.TRANSPARENT);
outlineBitmap.bitmapData = new BitmapData(Std.int(lastWidth / 5) + 10, Std.int(lastHeight / 5) + 10, true, 0xFFFFFFFF);
}

/**
* Capture the game screen as a bitmap.
*/
public function capture():Void
{
onPreScreenshot.dispatch();

{
{
screenshotBuffer.push(shot);
screenshotNameBuffer.push('screenshot-${DateUtil.generateTimestamp()}');

unsavedScreenshotBuffer.push(shot);
unsavedScreenshotNameBuffer.push('screenshot-${DateUtil.generateTimestamp()}');
}
else
{
noSavingScreenshots = true;
throw "You've tried taking more than 100 screenshots at a time. Give the game a funkin break! Jeez. If you wanted those screenshots, well too bad!";
}
showCaptureFeedback();
{
wasMouseHidden = false;
Cursor.show();
}
}
else
{
saveScreenshot(shot, 'screenshot-${DateUtil.generateTimestamp()}', 1, false);
showCaptureFeedback();
{
wasMouseHidden = false;
Cursor.show();
}
}
onPostScreenshot.dispatch(shot);
}


/**
* Visual and audio feedback when a screenshot is taken.
*/
function showCaptureFeedback():Void
{
flashSprite.alpha = 1;
FlxTween.tween(flashSprite, {alpha: 0}, 0.15);

FunkinSound.playOnce(Paths.sound('screenshot'), 1.0);
}


/**
* Show a fancy preview for the screenshot
*/
function showFancyPreview(shot:Bitmap):Void
{
shotPreviewBitmap.bitmapData = shot.bitmapData;
shotPreviewBitmap.x = outlineBitmap.x + 5;
shotPreviewBitmap.y = outlineBitmap.y + 5;

shotPreviewBitmap.width = outlineBitmap.width - 10;
shotPreviewBitmap.height = outlineBitmap.height - 10;



{
wasMouseShown = true;
Cursor.show();
}


{
targetAlpha = 0.6;
};

{
targetAlpha = 1;
}

previewSprite.buttonMode = true;
previewSprite.addEventListener(MouseEvent.MOUSE_DOWN, previewSpriteOpenScreenshotsFolder);
previewSprite.addEventListener(MouseEvent.MOUSE_MOVE, onHover);
previewSprite.addEventListener(MouseEvent.MOUSE_OUT, onHoverOut);

FlxTween.cancelTweensOf(previewSprite); // Reset the tweens
previewSprite.alpha = 0.0;
previewSprite.y -= 10;
new FlxTimer().start(PREVIEW_INITIAL_DELAY, function(_)
{
changingAlpha = true;
FlxTween.tween(previewSprite, {alpha: targetAlpha, y: 0}, PREVIEW_FADE_IN_DURATION, {
ease: FlxEase.quartOut,
onComplete: function(_)
{
changingAlpha = false;
new FlxTimer().start(PREVIEW_FADE_OUT_DELAY, function(_)
{
changingAlpha = true;
FlxTween.tween(previewSprite, {alpha: 0.0, y: 10}, PREVIEW_FADE_OUT_DURATION, {
ease: FlxEase.quartInOut,
onComplete: function(_)
{
{
wasMouseShown = false;
Cursor.hide();
}
else if (wasMouseHidden && !FlxG.mouse.visible)
{
wasMouseHidden = false;
Cursor.show();
}

previewSprite.removeEventListener(MouseEvent.MOUSE_DOWN, previewSpriteOpenScreenshotsFolder);
previewSprite.removeEventListener(MouseEvent.MOUSE_OVER, onHover);
previewSprite.removeEventListener(MouseEvent.MOUSE_OUT, onHoverOut);

}
});
});
}
});
});
}

/**
* This is a separate function, as running the previewsprite check
* in the other one would mean you can't open the folder when the preview's hidden, lol
* That, and it needs a mouse event as a parameter to work.
*/
function previewSpriteOpenScreenshotsFolder(e:MouseEvent):Void
{
openScreenshotsFolder();
}

function openScreenshotsFolder():Void
{
FileUtil.openFolder(SCREENSHOT_FOLDER);
}

function onWindowClose(exitCode:Int):Void
{
saveUnsavedBufferedScreenshots();
}

function onWindowCrash(message:String):Void
{
saveUnsavedBufferedScreenshots();
}

static function getCurrentState():FlxState
{
{
state = state.subState;
}
}

static function getScreenshotPath():String
{
}

static function makeScreenshotPath():Void
{
FileUtil.createDirIfNotExists(SCREENSHOT_FOLDER);
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
makeScreenshotPath();
{
previousScreenshotName = targetPath;
targetPath = getScreenshotPath() + targetPath + '.png';
previousScreenshotCopyNum = 2;
}
else
{
{
previousScreenshotCopyNum++;
newTargetPath = targetPath + ' (${previousScreenshotCopyNum})';
}
previousScreenshotName = newTargetPath;
targetPath = getScreenshotPath() + newTargetPath + '.png';
}


{ // Save the images with a delay (a timer)
new FlxTimer().start(screenShotNum, function(_)
{

{
previousScreenshotName = null;
unsavedScreenshotBuffer.shift();
unsavedScreenshotNameBuffer.shift();
}
else
{
FileUtil.writeBytesToPath(targetPath, pngData);
unsavedScreenshotBuffer.shift();
unsavedScreenshotNameBuffer.shift();
}
});
}
else // Save the screenshot immediately
{

{
previousScreenshotName = null;
}
else
{
FileUtil.writeBytesToPath(targetPath, pngData);
}
}
}

function saveBufferedScreenshots(screenshots:Array<Bitmap>, screenshotNames:Array<String>):Void
{

asyncLoop = new FlxAsyncLoop(screenshots.length, () ->
{
{
saveScreenshot(screenshots[i], screenshotNames[i], i);
}
i++;
}, 1);
getCurrentState().add(asyncLoop);
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
stateChanging = true;
{
for (sprite in [flashSprite, previewSprite])
{
FlxTween.cancelTweensOf(sprite);
sprite.alpha = 0;
}
}

{
wasMouseShown = false;
Cursor.hide();
}
else if (wasMouseHidden && !FlxG.mouse.visible)
{
wasMouseHidden = false;
Cursor.show();
}




for (i in 0...unsavedScreenshotBuffer.length)
{
}

unsavedScreenshotBuffer = [];
unsavedScreenshotNameBuffer = [];
}

function postStateSwitch():Void
{
stateChanging = false;
screenshotBeingSpammed = false;
}

override public function destroy():Void
{


WindowUtil.windowExit.remove(onWindowClose);
CrashHandler.errorSignal.remove(onWindowCrash);
CrashHandler.criticalErrorSignal.remove(onWindowCrash);

super.destroy();

for (parent in [flashSprite, previewSprite])
{
for (child in parent.__children)
{
parent.removeChild(child);
}
}

}
}
