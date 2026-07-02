package funkin.ui.options;


class SaveDataMenu extends Page<OptionsState.OptionsMenuPageName>
{

public function new()
{
super();

add(items = new TextMenuList());

createItem("CLEAR SAVE DATA", openSaveDataPrompt);

{
createItem("LOAD FROM NG", function()
{
openConfirmPrompt("This will overwrite
\nALL your save data.
\nAre you sure?", "Overwrite",
() -> Save.loadFromNewgrounds(() -> FlxG.switchState(() -> new funkin.InitState())));
});

createItem("SAVE TO NG", function()
{
openConfirmPrompt("This will overwrite
\nALL save data saved
\non NG. Are you sure?", "Overwrite", function()
{
Save.saveToNewgrounds();
});
});

createItem("CLEAR NG SAVE DATA", function()
{
openConfirmPrompt("This will delete
\nALL save data saved
\non NG. Are you sure?", "Delete", function()
{
funkin.api.newgrounds.NGSaveSlot.instance.clear();
});
});
}

createItem("EXIT", exit);
}

function createItem(name:String, callback:Void->Void, fireInstantly = false)
{
item.fireInstantly = fireInstantly;
item.screenCenter(X);
}

override function update(elapsed:Float)
{
enabled = (prompt == null);
super.update(elapsed);
}

override function set_enabled(value:Bool)
{
items.enabled = value;
}


function openConfirmPrompt(text:String, yesText:String, onYes:Void->Void, ?groupToOpenOn:Null<flixel.group.FlxGroup>):Void
{

prompt = new Prompt(text, Custom(yesText, "Cancel"));
prompt.create();
prompt.createBgFromMargin(100, 0xFFFAFD6D);
prompt.back.scrollFactor.set(0, 0);

prompt.onYes = function()
{
onYes();

{
prompt.close();
prompt.destroy();
prompt = null;
}
};

prompt.onNo = function()
{
prompt.close();
prompt.destroy();
prompt = null;
}
}

public function openSaveDataPrompt()
{
openConfirmPrompt("This will delete
\nALL your save data.
\nAre you sure?
", "Delete", function()
{
Save.clearData();

});
}

/**
* True if this page has multiple options, excluding the exit option.
* If false, there's no reason to ever show this page.
*/
public function hasMultipleOptions():Bool
{
}
}
