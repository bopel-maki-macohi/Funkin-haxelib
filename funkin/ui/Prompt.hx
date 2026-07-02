package funkin.ui;


/**
* Opens a yes/no dialog box as a substate over the current state.
*/
class Prompt extends flixel.FlxSubState
{
inline static var MARGIN = 100;



public function new(text:String, style:ButtonStyle = Ok)
{
this.style = style;
super(0x80000000);

buttons = new TextMenuList(Horizontal);

field = new AtlasText(text, AtlasFont.BOLD);
field.scrollFactor.set(0, 0);
}

override function create()
{
super.create();

field.y = MARGIN;
field.screenCenter(X);
add(field);

createButtons();
add(buttons);
}

public function createBg(width:Int, height:Int, color = 0xFF808080)
{
back = new FlxSprite();
back.makeGraphic(width, height, color, false, "prompt-bg");
back.screenCenter(XY);
add(back);
}

public function createBgFromMargin(margin = MARGIN, color = 0xFF808080)
{
createBg(Std.int(FlxG.width - margin * 2), Std.int(FlxG.height - margin * 2), color);
}

public function setButtons(style:ButtonStyle)
{
{
this.style = style;
createButtons();
}
}

function createButtons()
{
{
buttons.remove(buttons.members[0], true).destroy();
}

switch (style)
{
case Yes_No:
createButtonsHelper("yes", "no");
case Ok:
createButtonsHelper("ok");
case Custom(yes, no):
createButtonsHelper(yes, no);
case None:
buttons.exists = false;
};
}

function createButtonsHelper(yes:String, ?no:String)
{
buttons.exists = true;
{
else
});
yesButton.screenCenter(X);
yesButton.y = FlxG.height - yesButton.height - MARGIN;
yesButton.scrollFactor.set(0, 0);
{
yesButton.x = FlxG.width - yesButton.width - MARGIN;

noButton.x = MARGIN;
noButton.y = FlxG.height - noButton.height - MARGIN;
noButton.scrollFactor.set(0, 0);
}
}

public function setText(text:String)
{
field.text = text;
field.screenCenter(X);
}
}

enum ButtonStyle
{
Ok;
Yes_No;
Custom(yes:String, no:Null<String>); // Todo: more than 2
None;
}
