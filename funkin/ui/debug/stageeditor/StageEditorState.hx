package funkin.ui.debug.stageeditor;


/**
* Da Stage Editor woo!!
* made by Kolo NEVER FORGET
*/
class StageEditorState extends UIState
{
public static final BACKUPS_PATH:String = "./backups/stages/";
public static final LIGHT_MODE_COLORS:Array<FlxColor> = [0xFFE7E6E6, 0xFFF8F8F8];
public static final DARK_MODE_COLORS:Array<FlxColor> = [0xFF181919, 0xFF202020];

public static final DEFAULT_POSITIONS:Map<CharacterType,
Array<Float>> = [CharacterType.BF => [989.5, 885], CharacterType.GF => [751.5, 787], CharacterType.DAD => [335, 885]];

public static final DEFAULT_CAMERA_OFFSETS:Map<CharacterType,
Array<Float>> = [CharacterType.BF => [-100, -100], CharacterType.GF => [0, 0], CharacterType.DAD => [150, -100]];

public static final MAX_Z_INDEX:Int = 10000;
public static final CHARACTER_COLORS:Array<FlxColor> = [FlxColor.RED, FlxColor.PURPLE, FlxColor.CYAN]; // FCUK IVE TURNED INTO AN AMERICAN
public static final TIME_BEFORE_ANIM_STOP:Float = 3.0;












function set_selectedSprite(value:StageEditorObject)
{
selectedSprite?.selectedShader.setAmount(0);
this.selectedSprite = value;
infoSelection = value?.name ?? "None";
updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
updateDialog(StageEditorDialogType.OBJECT_ANIMS);
updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);

{
}

selectedSprite?.selectedShader.setAmount(1);

}


function set_selectedChar(value:BaseCharacter)
{
this.selectedChar = value;
infoSelection = Std.string(value?.characterType) ?? "None";
updateDialog(StageEditorDialogType.CHARACTER);
}


function get_isCursorOverHaxeUI():Bool
{
}






function set_saved(value:Bool):Bool
{
saved = value;

updateWindowTitle();

{
autoSaveTimer.cancel();
}

{
autoSaveTimer.start(Constants.AUTOSAVE_TIMER_DELAY_SEC, function(tmr:FlxTimer)
{
saveBackup();
});
}

}

function set_currentFile(value:String):String
{
currentFile = value;

updateWindowTitle();


reloadRecentFiles();

}




function get_gf() return charGroups[CharacterType.GF].getFirst(StageDataHandler.checkForCharacter);

function get_bf() return charGroups[CharacterType.BF].getFirst(StageDataHandler.checkForCharacter);

function get_dad() return charGroups[CharacterType.DAD].getFirst(StageDataHandler.checkForCharacter);







function get_allowInput()
{
}



function set_showChars(value:Bool):Bool
{
this.showChars = value;

for (cooldude in getCharacters())
{
cooldude.visible = showChars;
}

}

/**
* The params which were passed in when the Stage Editor was initialized.
*/

public function new(?params:StageEditorParams)
{
super();
this.params = params;
}

override public function create():Void
{
WindowManager.instance.reset();
instance = this;
WindowUtil.setWindowTitle("Friday Night Funkin\' Stage Editor");

AssetDataHandler.init(this);

camGame = new FunkinCamera();
camHUD = new FlxCamera();
camHUD.bgColor.alpha = 0;


persistentUpdate = false;

bg = FlxGridOverlay.create(10, 10);
bg.scrollFactor.set();
add(bg);

updateBGColors();

super.create();
root.scrollFactor.set();
root.cameras = [camHUD];
root.width = FlxG.width;
root.height = FlxG.height;

menubar.height = 35;
WindowManager.instance.container = root;
Screen.instance.addComponent(root);



gf?.updateHitbox();
dad?.updateHitbox();
bf?.updateHitbox();

charGroups = [CharacterType.BF => new FlxTypedGroup<BaseCharacter>(1), CharacterType.GF => new FlxTypedGroup<BaseCharacter>(1), CharacterType.DAD => new FlxTypedGroup<BaseCharacter>(1)];

{
gf.x = charPos[CharacterType.GF][0] - gf.characterOrigin.x + gf.globalOffsets[0];
gf.y = charPos[CharacterType.GF][1] - gf.characterOrigin.y + gf.globalOffsets[1];
}
{
dad.x = charPos[CharacterType.DAD][0] - dad.characterOrigin.x + dad.globalOffsets[0];
dad.y = charPos[CharacterType.DAD][1] - dad.characterOrigin.y + dad.globalOffsets[1];
}
{
bf.x = charPos[CharacterType.BF][0] - bf.characterOrigin.x + bf.globalOffsets[0];
bf.y = charPos[CharacterType.BF][1] - bf.characterOrigin.y + bf.globalOffsets[1];
}

selectedChar = bf;

charGroups[CharacterType.GF].add(gf);
charGroups[CharacterType.DAD].add(dad);
charGroups[CharacterType.BF].add(bf);

add(charGroups[CharacterType.GF]);
add(charGroups[CharacterType.DAD]);
add(charGroups[CharacterType.BF]);

camFields = new FlxTypedGroup<FlxSprite>();
camFields.visible = false;
camFields.zIndex = MAX_Z_INDEX + CHARACTER_COLORS.length + 1;

for (i in 0...CHARACTER_COLORS.length)
{
floorLine.screenCenter(X);



pointer.alpha = floorLine.alpha = field.alpha = 0.35;
pointer.ID = floorLine.ID = field.ID = i;
pointer.visible = floorLine.visible = false;
pointer.zIndex = floorLine.zIndex = MAX_Z_INDEX + 1 + i;

add(floorLine);
add(pointer);

floorLines.push(floorLine);
posCircles.push(pointer);

camFields.add(field);
}

camMarker = new FlxSprite().loadGraphic(FlxGraphic.fromClass(GraphicCursorCross));
camMarker.setGraphicSize(80, 80);
camMarker.updateHitbox();
camMarker.zIndex = MAX_Z_INDEX + CHARACTER_COLORS.length + 2;
camMarker.antialiasing = false;

updateMarkerPos();

add(camFields);
add(camMarker);

nameTxt = new FlxText(0, 0, 0, "", 24);
nameTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
nameTxt.cameras = [camHUD];
add(nameTxt);

camFollow = new FlxObject(0, 0, 2, 2);
camFollow.screenCenter();
add(camFollow);

camGame.follow(camFollow);

addUI();

findObjDialog = new FindObjDialog(this, selectedSprite == null ? "" : selectedSprite.name);

{


{
objNameDialog = new NewObjDialog(this, data);
objNameDialog.bitmapName = new haxe.io.Path(path).file;
objNameDialog.showDialog();

objNameDialog.onDialogClosed = function(_)
{
objNameDialog = null;
}

}
});

{

{
currentFile = "";
this.loadFromDataRaw(stageData);
}
else
{
notifyChange("Problem Loading the Stage", "The Stage File could not be loaded.", true);
onMenuItemClick("new stage");
}
}
else if (params?.fnfsTargetPath != null)
{

{
currentFile = params.fnfsTargetPath;
this.unpackShitFromZip(bytes);
}
else
{
notifyChange("Problem Loading the Stage", "The Stage File could not be loaded.", true);
onMenuItemClick("new stage");
}
}
else
{
onMenuItemClick("new stage");
welcomeDialog.closable = false;

{
FileUtil.createDirIfNotExists(BACKUPS_PATH);

{
|| !files[files.length - 1].startsWith("stage-editor-"))
{
files.pop();
}
}


for (file in files)
{
filestats.push(sys.FileSystem.stat(haxe.io.Path.join([BACKUPS_PATH, file])));
}

for (index in 0...filestats.length)
{
{
latestFileIndex = index;
latestBackupPath = files[index];
}
}

}
}

WindowUtil.windowExit.add(windowClose);
CrashHandler.errorSignal.add(autosavePerCrash);
CrashHandler.criticalErrorSignal.add(autosavePerCrash);

Save.instance.stageEditorHasBackup.value = false;

Cursor.show();
FunkinSound.playMusic('chartEditorLoop', {
startingVolume: 0.0
});
}


override public function beatHit()
{
{
{
for (char in getCharacters())
char?.dance(true);
}

for (asset in spriteArray)
{
}

}

}

override public function update(elapsed:Float):Void
{
{
resetWindowTitle();

WindowUtil.windowExit.remove(windowClose);
CrashHandler.errorSignal.remove(autosavePerCrash);
CrashHandler.criticalErrorSignal.remove(autosavePerCrash);

Cursor.hide();
}

updateBGSize();
conductorInUse.update();

super.update(elapsed);


menubarMenuFile.disabled = menubarMenuEdit.disabled = bottomBarModeText.disabled = menubarMenuWindow.disabled = testingMode;

{
for (char in getCharacters())
{
char.shader = null;
}

findObjDialog.hideDialog(DialogButton.CANCEL);

camGame.follow(camFollow, LOCKON, 0.04);


else if (curTestChar < 0) curTestChar = getCharacters().length - 1;

bottomBarSelectText.text = (text == 'null') ? 'None' : text;

{
camFollow.x = char.cameraFocusPoint.x + charCamOffsets.get(char.characterType)[0];
camFollow.y = char.cameraFocusPoint.y + charCamOffsets.get(char.characterType)[1];
}

onMenuItemClick("test stage");

}

nameTxt.text = "";
bottomBarModeText.text = (moveMode == "assets" ? "Objects" : "Characters");

camGame.follow(camFollow);

&& !isCursorOverHaxeUI) // include the floating poing error thing
{
camGame.zoom += FlxG.mouse.wheel / 10;
updateBGSize();
}


{
{
}


{
camFollow.screenCenter();
}

{
else if (FlxG.keys.pressed.S) camFollow.velocity.y = 90 * (2 / FlxG.camera.zoom);
else
camFollow.velocity.y = 0;

else if (FlxG.keys.pressed.D) camFollow.velocity.x = 90 * (2 / FlxG.camera.zoom);
else
camFollow.velocity.x = 0;
}
else
{
camFollow.velocity.set();
}
}
else
{
camFollow.velocity.set();
}


{
&& (!FlxG.mouse.overlaps(selectedSprite) || (FlxG.mouse.overlaps(selectedSprite) && pressingControl()))
&& FlxG.mouse.justPressed
&& !isCursorOverHaxeUI)
{
selectedSprite = null;
}

{
for (spr in spriteArray)
{
{

{
selectedSprite = spr;
}
}
}
}
else if (nameTxt.visible) nameTxt.visible = false;

{
saved = false;
updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);

{
this.createAndPushAction(OBJECT_MOVED);

moveOffset = [FlxG.mouse.getWorldPosition().x - selectedSprite.x, FlxG.mouse.getWorldPosition().y - selectedSprite.y];
}

selectedSprite.x = (Math.floor(posBros.x) - Math.floor(posBros.x) % moveStep);
selectedSprite.y = (Math.floor(posBros.y) - Math.floor(posBros.y) % moveStep);
}

{
{
saved = false;
this.createAndPushAction(OBJECT_ROTATED);
}

}

arrowMovement(selectedSprite);

for (char in getCharacters())
{
char.shader = null;
}
}
else
{
{
for (char in getCharacters())
{

{

{
selectedChar = char;
}
}
}
}
else if (nameTxt.visible) nameTxt.visible = false;

{
saved = false;
updateDialog(StageEditorDialogType.CHARACTER);

{
this.createAndPushAction(CHARACTER_MOVED);

moveOffset = [FlxG.mouse.getWorldPosition().x - selectedChar.x, FlxG.mouse.getWorldPosition().y - selectedChar.y];
}


selectedChar.x = Math.floor(posBros.x) - Math.floor(posBros.x) % moveStep;
selectedChar.y = Math.floor(posBros.y) - Math.floor(posBros.y) % moveStep;
}

arrowMovement(selectedChar);
updateMarkerPos();
}
bottomBarSelectText.text = infoSelection;

nameTxt.x = FlxG.mouse.getViewPosition(camHUD).x;
nameTxt.y = FlxG.mouse.getViewPosition(camHUD).y - nameTxt.height;

camMarker.visible = moveMode == "chars";

for (item in sprDependant)
item.disabled = (moveMode != "assets" || selectedSprite == null);

menubarItemPaste.disabled = copiedSprite == null;
menubarItemFindObj.disabled = !(moveMode == "assets");


menubarItemUndo.disabled = undoArray.length == 0;
menubarItemRedo.disabled = redoArray.length == 0;
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
saveBackup(true);
}
}

function windowClose(exitCode:Int)
{

{
saveBackup(true);
}
}

public function updateRecentFiles()
{
files.remove(currentFile);
files.unshift(currentFile);

files.pop();

Save.instance.stageEditorPreviousFiles.value = files;
Save.system.flush();
}

public function updateMarkerPos()
{
for (i in 0...getCharacters().length)
{

charPos.set(type, [char.feetPosition.x - char.globalOffsets[0], char.feetPosition.y - char.globalOffsets[1]]);

floorLines[i].y = charPos.get(type)[1] - floorLines[i].height / 2;

posCircles[i].y = charPos.get(type)[1] - posCircles[i].height / 2;
posCircles[i].x = charPos.get(type)[0] - posCircles[i].width / 2;

camFields.members[i].scale.set(1 / stageZoom, 1 / stageZoom);
camFields.members[i].updateHitbox();

camFields.members[i].x = char.cameraFocusPoint.x + charCamOffsets.get(type)[0] - camFields.members[i].width / 2;
camFields.members[i].y = char.cameraFocusPoint.y + charCamOffsets.get(type)[1] - camFields.members[i].height / 2;

{
camMarker.x = camFields.members[i].getMidpoint().x - camMarker.width / 2;
camMarker.y = camFields.members[i].getMidpoint().y - camMarker.height / 2;
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
saved = false;
moveUndoed = true;
this.createAndPushAction(moveMode == "assets" ? OBJECT_MOVED : CHARACTER_MOVED);
}

&& moveUndoed)
{
moveUndoed = false;
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
sortAssets();
spriteArray = [];

for (thing in members)
{
}

findObjDialog.updateIndicator();
}

public function sortAssets()
{
sort(funkin.util.SortUtil.byZIndex, flixel.util.FlxSort.ASCENDING);
}

public function updateDialog(type:StageEditorDialogType)
{

dialogs[type].refresh();
}

public function toggleDialog(type:StageEditorDialogType, show:Bool = true)
{

dialogs[type].toggle(show);
}

public function updateWindowTitle()
{

else
defaultTitle += " - " + currentFile;


WindowUtil.setWindowTitle(defaultTitle);
}

function resetWindowTitle():Void
{
WindowUtil.setWindowTitle('Friday Night Funkin\'');
}

function updateBGColors():Void
{

bg.kill();
remove(bg);
bg.destroy();

bg = FlxGridOverlay.create(10, 10, -1, -1, true, colArray[0], colArray[1]);
bg.scrollFactor.set();
members.insert(index, bg);
}

function updateBGSize():Void
{
bg.scale.set(1 / FlxG.camera.zoom, 1 / FlxG.camera.zoom);
bg.updateHitbox();
bg.screenCenter();
}


function addUI():Void
{
menubarItemNewStage.onClick = function(_) onMenuItemClick("new stage");
menubarItemOpenStage.onClick = function(_) onMenuItemClick("open stage");
menubarItemSaveStage.onClick = function(_) onMenuItemClick("save stage");
menubarItemSaveStageAs.onClick = function(_) onMenuItemClick("save stage as");
menubarItemClearAssets.onClick = function(_) onMenuItemClick("clear assets");
menubarItemExit.onClick = function(_) onMenuItemClick("exit");
menubarItemUndo.onClick = function(_) onMenuItemClick("undo");
menubarItemRedo.onClick = function(_) onMenuItemClick("redo");
menubarItemCopy.onClick = function(_) onMenuItemClick("copy object");
menubarItemCut.onClick = function(_) onMenuItemClick("cut object");
menubarItemPaste.onClick = function(_) onMenuItemClick("paste object");
menubarItemDelete.onClick = function(_) onMenuItemClick("delete object");
menubarItemNewObj.onClick = function(_) onMenuItemClick("new object");
menubarItemFindObj.onClick = function(_) onMenuItemClick("find object");
menubarItemSelectNone.onClick = function(_) onMenuItemClick("select none");
menubarButtonText.onClick = function(_) onMenuItemClick("test stage");
menubarItemUserGuide.onClick = function(_) onMenuItemClick("user guide");
menubarItemGoToBackupsFolder.onClick = function(_) onMenuItemClick("open folder");
menubarItemAbout.onClick = function(_) onMenuItemClick("about");

bottomBarModeText.onClick = function(_) onMenuItemClick("switch mode");
bottomBarModeText.onRightClick = function(_) onMenuItemClick("switch mode");

function switchFocus(rightClick:Bool = false) if (testingMode)
{
(rightClick) ? curTestChar-- : curTestChar++;
}
else
{
{
(rightClick) ? index-- : index++;

else if (index < 0) index = chars.length - 1;

selectedChar = chars[index];
}
else
{

(rightClick) ? index-- : index++;

else if (index < 0) index = spriteArray.length - 1;

selectedSprite = spriteArray[index];
}
}

bottomBarSelectText.onClick = function(_) switchFocus();
bottomBarSelectText.onRightClick = function(_) switchFocus(true);

bottomBarMoveStepText.text = stepOptions.contains(Save.instance.stageEditorMoveStep.value) ? Save.instance.stageEditorMoveStep.value : "1px";

{
id += change;

else if (id < 0) id = 0;

bottomBarMoveStepText.text = Save.instance.stageEditorMoveStep.value = stepOptions[id];
moveStep = shit;

updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
updateDialog(StageEditorDialogType.CHARACTER);
updateDialog(StageEditorDialogType.STAGE);
}

bottomBarMoveStepText.onClick = function(_) changeStep(1);
bottomBarMoveStepText.onRightClick = function(_) changeStep(-1);

changeStep(); // update

bottomBarAngleStepText.text = (angleOptions.contains(Save.instance.stageEditorAngleStep.value) ? Save.instance.stageEditorAngleStep.value : 5) + "°";

{
id += change;

else if (id < 0) id = 0;

Save.instance.stageEditorAngleStep.value = angleOptions[id];
bottomBarAngleStepText.text = (angleOptions.contains(Save.instance.stageEditorAngleStep.value) ? Save.instance.stageEditorAngleStep.value : 5) + "°";

updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
}

bottomBarAngleStepText.onClick = function(_) changeAngle(1);
bottomBarAngleStepText.onRightClick = function(_) changeAngle(-1);

changeAngle(); // update

dialogs.set(StageEditorDialogType.OBJECT_GRAPHIC, new StageEditorObjectGraphicToolbox(this));
dialogs.set(StageEditorDialogType.OBJECT_ANIMS, new StageEditorObjectAnimsToolbox(this));
dialogs.set(StageEditorDialogType.OBJECT_PROPERTIES, new StageEditorObjectPropertiesToolbox(this));
dialogs.set(StageEditorDialogType.CHARACTER, new StageEditorCharacterToolbox(this));
dialogs.set(StageEditorDialogType.STAGE, new StageEditorStageToolbox(this));

menubarItemWindowObjectGraphic.onChange = function(_) toggleDialog(StageEditorDialogType.OBJECT_GRAPHIC, menubarItemWindowObjectGraphic.selected);
menubarItemWindowObjectAnims.onChange = function(_) toggleDialog(StageEditorDialogType.OBJECT_ANIMS, menubarItemWindowObjectAnims.selected);
menubarItemWindowObjectProps.onChange = function(_) toggleDialog(StageEditorDialogType.OBJECT_PROPERTIES, menubarItemWindowObjectProps.selected);
menubarItemWindowCharacter.onChange = function(_) toggleDialog(StageEditorDialogType.CHARACTER, menubarItemWindowCharacter.selected);
menubarItemWindowStage.onChange = function(_) toggleDialog(StageEditorDialogType.STAGE, menubarItemWindowStage.selected);

menubarItemThemeLight.onClick = function(_)
{
Save.instance.stageEditorTheme.value = StageEditorTheme.Light;
updateBGColors();
}

menubarItemThemeDark.onClick = function(_)
{
Save.instance.stageEditorTheme.value = StageEditorTheme.Dark;
updateBGColors();
}

menubarItemThemeDark.selected = Save.instance.stageEditorTheme.value == StageEditorTheme.Dark;
menubarItemThemeLight.selected = Save.instance.stageEditorTheme.value == StageEditorTheme.Light;

menubarItemViewChars.onChange = function(_) showChars = menubarItemViewChars.selected;
menubarItemViewNameText.onChange = function(_) nameTxt.visible = menubarItemViewNameText.selected;
menubarItemViewNameText.selected = true; // TODO: Remove this when this haxeUI bug is fixed (it starts as false in the code)?
menubarItemViewCamBounds.onChange = function(_) camFields.visible = menubarItemViewCamBounds.selected;

menubarItemViewFloorLines.onChange = function(_)
{
for (awesome in floorLines)
awesome.visible = menubarItemViewFloorLines.selected;
}

menubarItemViewPosMarkers.onChange = function(_)
{
for (coolbeans in posCircles)
coolbeans.visible = menubarItemViewPosMarkers.selected;
}

sprDependant = [menubarItemCopy, menubarItemCut, menubarItemDelete, menubarItemSelectNone];
reloadRecentFiles();
}

function reloadRecentFiles():Void
{
for (a in menubarItemOpenRecent.childComponents)
menubarItemOpenRecent.removeComponent(a);

for (file in Save.instance.stageEditorPreviousFiles.value)
{
item.text = filePath.file + "." + filePath.ext;
item.disabled = !FileUtil.fileExists(file);

{
currentFile = file;

this.unpackShitFromZip(FileUtil.readBytesFromPath(file));

reloadRecentFiles();
}

item.onClick = function(_)
{
{
Dialogs.messageBox("Opening a new Stage will reset all your progress for this Stage.\n\nAre you sure you want to proceed?", "Open Stage",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
{
saved = true;
load(file);
}
});
}
else
{
load(file);
}
}

menubarItemOpenRecent.addComponent(item);
}
}


public function onMenuItemClick(item:String):Void
{
switch (item.toLowerCase())
{
case "undo" | "redo":
this.performLastAction(item.toLowerCase() == "redo");

case "save stage as":

{
notifyChange("Stage Save", "Problem Saving a Stage. Please try again later.", true);
}

FileUtil.saveFile(bytes, [FileUtil.FILE_FILTER_FNFS], function(path:String)
{
saved = true;
currentFile = path;
}, null, stageName + "." + FileUtil.FILE_EXTENSION_INFO_FNFS.extension);

case "save stage":
{
onMenuItemClick("save stage as"); // ah I love coding shortcuts
}


{
notifyChange("Stage Save", "Problem Saving a Stage. Please try again later.", true);
}

FileUtil.writeBytesToPath(currentFile, bytes, Force); // mhm

saved = true;

reloadRecentFiles();

case "open stage":
{
Dialogs.messageBox("Opening a new Stage will reset all your progress for this Stage.\n\nAre you sure you want to proceed?", "Open Stage",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
{
saved = true;
onMenuItemClick("open stage"); // ough
}
});

}

FileUtil.browseForBinaryFile("Open Stage Data", [FileUtil.FILE_EXTENSION_INFO_FNFS], function(_)
{

clearAssets();

currentFile = _.fullPath;
this.unpackShitFromZip(FileUtil.readBytesFromPath(currentFile));

reloadRecentFiles();
}, function()
{
});

case "exit":
{
{
exitConfirmDialog = Dialogs.messageBox("You are about to leave the editor without saving.\n\nAre you sure? ", "Leave Editor",
MessageBoxType.TYPE_YESNO, true, function(btn:DialogButton)
{
exitConfirmDialog = null;
{
saveBackup();
onMenuItemClick("exit");
}
});
}

}

resetWindowTitle();

WindowUtil.windowExit.remove(windowClose);
CrashHandler.errorSignal.remove(autosavePerCrash);
CrashHandler.criticalErrorSignal.remove(autosavePerCrash);

Cursor.hide();

case "switch mode":
moveMode = (moveMode == "assets" ? "chars" : "assets");

infoSelection = (moveMode == "chars") ? (Std.string(selectedChar?.characterType) ?? "None") : (moveMode == "assets") ? (selectedSprite?.name ?? "None") : "Wut";

selectedSprite?.selectedShader.setAmount((moveMode == "assets" ? 1 : 0));

case "switch focus":
{
curTestChar++;
}
else
{
{
index++;

selectedChar = chars[index];
}
else
{

index++;


selectedSprite = spriteArray[index];
}
}

case "new object":
findObjDialog.hideDialog(DialogButton.CANCEL);


objNameDialog = new NewObjDialog(this);
objNameDialog.showDialog();

objNameDialog.onDialogClosed = function(_)
{
objNameDialog = null;
}

case "find object":
findObjDialog.hideDialog(DialogButton.CANCEL);
findObjDialog = new FindObjDialog(this, selectedSprite == null ? "" : selectedSprite.name);
findObjDialog.showDialog(false);

case "select none":
{
selectedSprite = null;
}

case "about":
aboutDialog = new AboutDialog();
aboutDialog.showDialog();

case "user guide":
userGuideDialog = new UserGuideDialog();
userGuideDialog.showDialog();

userGuideDialog.onDialogClosed = function(_)
{
userGuideDialog = null;
}

case "open folder":
FileUtil.openFolder(absoluteBackupsPath);

case "test stage":

camFollow.velocity.set();

for (a in spriteArray)
{
a.active = true;
a.isDebugged = testingMode;
}

{
menubarItemWindowObjectGraphic.selected = menubarItemWindowObjectAnims.selected = menubarItemWindowObjectProps.selected = menubarItemWindowCharacter.selected = menubarItemWindowStage.selected = false;
}
nameTxt.exists = testingMode;
menubarButtonText.selected = !testingMode;

selectedSprite?.selectedShader.setAmount((testingMode ? (moveMode == "assets" ? 1 : 0) : 0));
testingMode = !testingMode;

case "clear assets":
Dialogs.messageBox("This will destroy all Objects in this Stage.\n\nAre you sure? This cannot be undone.", "Clear Assets", MessageBoxType.TYPE_YESNO,
true, function(btn:DialogButton)
{
{
clearAssets();
saved = false;

updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
updateDialog(StageEditorDialogType.OBJECT_ANIMS);
updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
}
});

case "center on screen":
{
selectedSprite.screenCenter();
updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
saved = false;
}

{
selectedChar.screenCenter();
updateDialog(StageEditorDialogType.CHARACTER);
saved = false;
}

case "delete object":

this.createAndPushAction(OBJECT_DELETED);

spriteArray.remove(selectedSprite);

selectedSprite.kill();
remove(selectedSprite, true);
selectedSprite.destroy();
selectedSprite = null;
updateArray();

case "copy object":

copiedSprite = selectedSprite.toData(true);

case "paste object":

saved = false;


{
i++;

spr.name += " (" + i + ")";
}

add(spr);
selectedSprite = spr;
updateArray();

case "cut object": // rofl
onMenuItemClick("copy object");
onMenuItemClick("delete object"); // already changes the saved var

case "new stage":

welcomeDialog = new WelcomeDialog(this);
welcomeDialog.showDialog();
welcomeDialog.closable = true;
welcomeDialog.onDialogClosed = function(_)
{
updateWindowTitle();
welcomeDialog = null;

updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
updateDialog(StageEditorDialogType.OBJECT_ANIMS);
updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
updateDialog(StageEditorDialogType.CHARACTER);
updateDialog(StageEditorDialogType.STAGE);
}
}
}

function saveBackup(isClose:Bool = false)
{
FileUtil.createDirIfNotExists(BACKUPS_PATH);


FileUtil.writeBytesToPath(path, data);

{
saved = true;

notifyChange("Auto-Save", "A Backup of this Stage has been made.");
}

Save.instance.stageEditorHasBackup.value = true;
Save.system.flush();
}

public function clearAssets()
{
selectedSprite = null;

{
spr.kill();
remove(spr, true);
spr.destroy();
spr = null;
}

undoArray = [];
redoArray = [];
updateArray();
removeUnusedBitmaps();
}

public function removeUnusedBitmaps()
{

for (asset in spriteArray)
{

usedBitmaps.push(data.assetPath);
}

for (name => bit in bitmaps)
{
bitmaps.remove(name);
}
}

public function addBitmap(newBitmap:BitmapData, ?name:String):String
{
for (name => bitmap in bitmaps)
{
}

{
bitmaps.set(name, newBitmap);
}

id++;

bitmaps.set("image" + id, newBitmap);
}

override function destroy():Void
{
super.destroy();

funkin.play.GameOverSubState.reset();
funkin.play.PauseSubState.reset();
funkin.play.Countdown.reset();
}

public function notifyChange(change:String, notif:String, isError:Bool = false)
{
NotificationManager.instance.addNotification({
title: change,
body: notif,
type: isError ? NotificationType.Error : NotificationType.Info
});
}

public function createURLDialog(onComplete:lime.utils.Bytes->Void = null, onFail:String->Void = null)
{
loadUrlDialog = new LoadFromUrlDialog(onComplete, onFail);
loadUrlDialog.onDialogClosed = function(_)
{
loadUrlDialog = null;
}

loadUrlDialog.showDialog();
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
STAGE;

/**
* The Character Options Dialog.
*/
CHARACTER;

/**
* The Object Graphic Options Dialog.
*/
OBJECT_GRAPHIC;

/**
* The Object Animations Options Dialog.
*/
OBJECT_ANIMS;

/**
* The Object Properties Options Dialog.
*/
OBJECT_PROPERTIES;
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
};
