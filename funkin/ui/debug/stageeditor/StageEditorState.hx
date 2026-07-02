

/**
* Da Stage Editor woo!!
* made by Kolo NEVER FORGET
*/
class StageEditorState extends UIState
{

public static final DEFAULT_POSITIONS:Map<CharacterType,

public static final DEFAULT_CAMERA_OFFSETS:Map<CharacterType,

public static final CHARACTER_COLORS:Array<FlxColor> = [FlxColor.RED, FlxColor.PURPLE, FlxColor.CYAN]; // FCUK IVE TURNED INTO AN AMERICAN












function set_selectedSprite(value:StageEditorObject)
{

{
}


}


function set_selectedChar(value:BaseCharacter)
{
}


function get_isCursorOverHaxeUI():Bool
{
}






function set_saved(value:Bool):Bool
{


{
}

{
autoSaveTimer.start(Constants.AUTOSAVE_TIMER_DELAY_SEC, function(tmr:FlxTimer)
{
}

}

function set_currentFile(value:String):String
{




}













function get_allowInput()
{
}



function set_showChars(value:Bool):Bool
{

for (cooldude in getCharacters())
{
}

}

/**
* The params which were passed in when the Stage Editor was initialized.
*/

public function new(?params:StageEditorParams)
{
}

override public function create():Void
{
WindowManager.instance.reset();
instance = this;








WindowManager.instance.container = root;
Screen.instance.addComponent(root);





{
}
{
}
{
}





for (i in 0...CHARACTER_COLORS.length)
{






}









{


{

objNameDialog.onDialogClosed = function(_)
{
}

}

{

{
}
else
{
}
}
else if (params?.fnfsTargetPath != null)
{

{
}
else
{
}
}
else
{

{

{
|| !files[files.length - 1].startsWith("stage-editor-"))
{
}
}


for (file in files)
{
}

for (index in 0...filestats.length)
{
{
}
}

}
}


Save.instance.stageEditorHasBackup.value = false;

FunkinSound.playMusic('chartEditorLoop', {
startingVolume: 0.0
}


override public function beatHit()
{
{
{
for (char in getCharacters())
}

for (asset in spriteArray)
{
}

}

}

override public function update(elapsed:Float):Void
{
{


}





{
for (char in getCharacters())
{
}






{
}


}



&& !isCursorOverHaxeUI) // include the floating poing error thing
{
}


{
{
}


{
}

{
else

else
}
else
{
}
}
else
{
}


{
&& (!FlxG.mouse.overlaps(selectedSprite) || (FlxG.mouse.overlaps(selectedSprite) && pressingControl()))
&& FlxG.mouse.justPressed
&& !isCursorOverHaxeUI)
{
}

{
for (spr in spriteArray)
{
{

{
}
}
}
}

{

{

}

}

{
{
}

}


for (char in getCharacters())
{
}
}
else
{
{
for (char in getCharacters())
{

{

{
}
}
}
}

{

{

}


}

}



for (item in sprDependant)



}

/**
* Small helper for MacOS, "WINDOWS" is keycode 15, which maps to "COMMAND" on Mac, which is more often used than "CONTROL"
* Everywhere else, it just returns `FlxG.keys.pressed.CONTROL`
* @return Bool
*/
function pressingControl():Bool
{
}

public function getCharacters()
{
}

function autosavePerCrash(message:String)
{

{
}
}

function windowClose(exitCode:Int)
{

{
}
}

public function updateRecentFiles()
{


Save.instance.stageEditorPreviousFiles.value = files;
}

public function updateMarkerPos()
{
for (i in 0...getCharacters().length)
{






{
}
}
}

function checkCharOverlaps(char:BaseCharacter)
{

}


function arrowMovement(obj:FlxSprite)
{

{
&& !moveUndoed)
{
}

&& moveUndoed)
{
}

{
}
else
{
}
}
}

public function updateArray()
{

for (thing in members)
{
}

}

public function sortAssets()
{
}

public function updateDialog(type:StageEditorDialogType)
{

}

public function toggleDialog(type:StageEditorDialogType, show:Bool = true)
{

}

public function updateWindowTitle()
{

else


}

function resetWindowTitle():Void
{
}

function updateBGColors():Void
{


}

function updateBGSize():Void
{
}


function addUI():Void
{


function switchFocus(rightClick:Bool = false) if (testingMode)
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


bottomBarMoveStepText.text = stepOptions.contains(Save.instance.stageEditorMoveStep.value) ? Save.instance.stageEditorMoveStep.value : "1px";

{


bottomBarMoveStepText.text = Save.instance.stageEditorMoveStep.value = stepOptions[id];

}


changeStep(); // update

bottomBarAngleStepText.text = (angleOptions.contains(Save.instance.stageEditorAngleStep.value) ? Save.instance.stageEditorAngleStep.value : 5) + "°";

{


Save.instance.stageEditorAngleStep.value = angleOptions[id];
bottomBarAngleStepText.text = (angleOptions.contains(Save.instance.stageEditorAngleStep.value) ? Save.instance.stageEditorAngleStep.value : 5) + "°";

}


changeAngle(); // update



menubarItemThemeLight.onClick = function(_)
{
Save.instance.stageEditorTheme.value = StageEditorTheme.Light;
}

menubarItemThemeDark.onClick = function(_)
{
Save.instance.stageEditorTheme.value = StageEditorTheme.Dark;
}

menubarItemThemeDark.selected = Save.instance.stageEditorTheme.value == StageEditorTheme.Dark;
menubarItemThemeLight.selected = Save.instance.stageEditorTheme.value == StageEditorTheme.Light;

menubarItemViewNameText.selected = true; // TODO: Remove this when this haxeUI bug is fixed (it starts as false in the code)?

menubarItemViewFloorLines.onChange = function(_)
{
for (awesome in floorLines)
}

menubarItemViewPosMarkers.onChange = function(_)
{
for (coolbeans in posCircles)
}

}

function reloadRecentFiles():Void
{
for (a in menubarItemOpenRecent.childComponents)

for (file in Save.instance.stageEditorPreviousFiles.value)
{

{


}

item.onClick = function(_)
{
{
Dialogs.messageBox("Opening a new Stage will reset all your progress for this Stage.\n\nAre you sure you want to proceed?", "Open Stage",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
{
}
}
else
{
}
}

}
}


public function onMenuItemClick(item:String):Void
{
switch (item.toLowerCase())
{
case "undo" | "redo":

case "save stage as":

{
}

FileUtil.saveFile(bytes, [FileUtil.FILE_FILTER_FNFS], function(path:String)
{

case "save stage":
{
onMenuItemClick("save stage as"); // ah I love coding shortcuts
}


{
}

FileUtil.writeBytesToPath(currentFile, bytes, Force); // mhm



case "open stage":
{
Dialogs.messageBox("Opening a new Stage will reset all your progress for this Stage.\n\nAre you sure you want to proceed?", "Open Stage",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
{
onMenuItemClick("open stage"); // ough
}

}

FileUtil.browseForBinaryFile("Open Stage Data", [FileUtil.FILE_EXTENSION_INFO_FNFS], function(_)
{



}, function()
{

case "exit":
{
{
exitConfirmDialog = Dialogs.messageBox("You are about to leave the editor without saving.\n\nAre you sure? ", "Leave Editor",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
{
}
}

}




case "switch mode":



case "switch focus":
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

case "new object":



objNameDialog.onDialogClosed = function(_)
{
}

case "find object":

case "select none":
{
}

case "about":

case "user guide":

userGuideDialog.onDialogClosed = function(_)
{
}

case "open folder":

case "test stage":


for (a in spriteArray)
{
}

{
}


case "clear assets":
Dialogs.messageBox("This will destroy all Objects in this Stage.\n\nAre you sure? This cannot be undone.", "Clear Assets", MessageBoxType.TYPE_YESNO,
true, function(btn:DialogButton)
{
{

}

case "center on screen":
{
}

{
}

case "delete object":




case "copy object":


case "paste object":



{

}


case "cut object": // rofl
onMenuItemClick("delete object"); // already changes the saved var

case "new stage":

welcomeDialog.onDialogClosed = function(_)
{

}
}
}

function saveBackup(isClose:Bool = false)
{



{

}

Save.instance.stageEditorHasBackup.value = true;
}

public function clearAssets()
{

{
}

}

public function removeUnusedBitmaps()
{

for (asset in spriteArray)
{

}

for (name => bit in bitmaps)
{
}
}

public function addBitmap(newBitmap:BitmapData, ?name:String):String
{
for (name => bitmap in bitmaps)
{
}

{
}


}

override function destroy():Void
{

}

public function notifyChange(change:String, notif:String, isError:Bool = false)
{
NotificationManager.instance.addNotification({
title: change,
body: notif,
type: isError ? NotificationType.Error : NotificationType.Info
}

public function createURLDialog(onComplete:lime.utils.Bytes->Void = null, onFail:String->Void = null)
{
loadUrlDialog.onDialogClosed = function(_)
{
}

}
}

/**
* Available themes for the stage editor state.
*/
enum abstract StageEditorTheme(String)
{
/**
* The default theme for the stage editor.
*/

/**
* A theme which introduces stage colors.
*/
}

enum StageEditorDialogType
{
/**
* The Stage Options Dialog.
*/

/**
* The Character Options Dialog.
*/

/**
* The Object Graphic Options Dialog.
*/

/**
* The Object Animations Options Dialog.
*/

/**
* The Object Properties Options Dialog.
*/
}

typedef StageEditorParams =
{
/**
* If non-null, load this stage immediately instead of the welcome screen.
*/

/**
* If non-null, load this stage immediately instead of the welcome screen.
*/
/**
* If non-null, load this character as Boyfriend.
*/

/**
* If non-null, load this character as Girlfriend.
*/

/**
* If non-null, load this character as Dad.
*/
