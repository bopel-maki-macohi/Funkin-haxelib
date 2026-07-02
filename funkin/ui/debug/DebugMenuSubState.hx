package funkin.ui.debug;


class DebugMenuSubState extends MusicBeatSubState
{

/**
* Camera focus point
*/

override function create():Void
{
FlxTransitionableState.skipNextTransIn = true;
super.create();

bgColor = 0x00000000;

camFocusPoint = new FlxObject(0, 0);
add(camFocusPoint);


menuBG.color = 0xFF4CAF50;
menuBG.setGraphicSize(Std.int(menuBG.width * 1.1 * FullScreenScaleMode.wideScale.x));
menuBG.updateHitbox();
menuBG.screenCenter();
menuBG.scrollFactor.set(0, 0);
add(menuBG);

items = new TextMenuList();
items.onChange.add(onMenuChange);
add(items);

FlxTransitionableState.skipNextTransIn = true;

createItem("CHART EDITOR", openChartEditor);
createItem("ANIMATION EDITOR", openAnimationEditor);
createItem("STAGE EDITOR", openStageEditor);
createItem("RESULTS SCREEN DEBUG", openTestResultsScreen);
createItem("OPEN CRASH LOG FOLDER", openLogFolder);
onMenuChange(items.members[0]);

haxe.ui.Toolkit.styleSheet.clear("user");
}

function onMenuChange(selected:TextMenuItem)
{
camFocusPoint.setPosition(selected.x + selected.width / 2, selected.y + selected.height / 2);
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{
FunkinSound.playOnce(Paths.sound('cancelMenu'));
exitDebugMenu();
}
}

function createItem(name:String, callback:Void->Void, fireInstantly = false):TextMenuItem
{
item.fireInstantly = fireInstantly;
item.screenCenter(X);
}

function openChartEditor():Void
{
FlxTransitionableState.skipNextTransIn = true;

}

function openCharSelect():Void
{
}

function openAnimationEditor():Void
{
}

function testStickers():Void
{
openSubState(new funkin.ui.transition.stickers.StickerSubState({
}));
}

function openStageEditor():Void
{
}

function openTestResultsScreen():Void
{
}

function openLogFolder()
{
FileUtil.openFolder(CrashHandler.LOG_FOLDER);
}

function exitDebugMenu()
{
this.close();
}
}
