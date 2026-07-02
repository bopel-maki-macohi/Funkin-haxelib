

class SaveDataMenu extends Page<OptionsState.OptionsMenuPageName>
{

public function new()
{



{
createItem("LOAD FROM NG", function()
{
openConfirmPrompt("This will overwrite
\nALL your save data.
\nAre you sure?", "Overwrite",

createItem("SAVE TO NG", function()
{
openConfirmPrompt("This will overwrite
\nALL save data saved
\non NG. Are you sure?", "Overwrite", function()
{

createItem("CLEAR NG SAVE DATA", function()
{
openConfirmPrompt("This will delete
\nALL save data saved
\non NG. Are you sure?", "Delete", function()
{
funkin.api.newgrounds.NGSaveSlot.instance.clear();
}

}

function createItem(name:String, callback:Void->Void, fireInstantly = false)
{
}

override function update(elapsed:Float)
{
}

override function set_enabled(value:Bool)
{
}


function openConfirmPrompt(text:String, yesText:String, onYes:Void->Void, ?groupToOpenOn:Null<flixel.group.FlxGroup>):Void
{


prompt.onYes = function()
{

{
}

prompt.onNo = function()
{
}
}

public function openSaveDataPrompt()
{
openConfirmPrompt("This will delete
\nALL your save data.
\nAre you sure?
", "Delete", function()
{

}

/**
* True if this page has multiple options, excluding the exit option.
* If false, there's no reason to ever show this page.
*/
public function hasMultipleOptions():Bool
{
}
}
