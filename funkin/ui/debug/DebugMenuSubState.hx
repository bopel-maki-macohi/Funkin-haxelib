

class DebugMenuSubState extends MusicBeatSubState
{

/**
* Camera focus point
*/

override function create():Void
{








}

function onMenuChange(selected:TextMenuItem)
{
}

override function update(elapsed:Float):Void
{

{
}
}

function createItem(name:String, callback:Void->Void, fireInstantly = false):TextMenuItem
{
}

function openChartEditor():Void
{

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
}

function openStageEditor():Void
{
}

function openTestResultsScreen():Void
{
}

function openLogFolder()
{
}

function exitDebugMenu()
{
}
}
