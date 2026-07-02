

/**
* Opens a yes/no dialog box as a substate over the current state.
*/
class Prompt extends flixel.FlxSubState
{



public function new(text:String, style:ButtonStyle = Ok)
{


}

override function create()
{


}

public function createBg(width:Int, height:Int, color = 0xFF808080)
{
}

public function createBgFromMargin(margin = MARGIN, color = 0xFF808080)
{
}

public function setButtons(style:ButtonStyle)
{
{
}
}

function createButtons()
{
{
}

switch (style)
{
case Yes_No:
case Ok:
case Custom(yes, no):
case None:
}

function createButtonsHelper(yes:String, ?no:String)
{
{
else
{

}
}

public function setText(text:String)
{
}
}

enum ButtonStyle
{
Custom(yes:String, no:Null<String>); // Todo: more than 2
}
