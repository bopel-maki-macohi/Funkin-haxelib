

/**
* Preference item that allows the player to pick a value between min and max
*/
class NumberPreferenceItem extends TextMenuItem
{
function controls():Controls
{
}





/**
* @param min Minimum value (example: 0)
* @param max Maximum value (example: 100)
* @param step The value to increment/decrement by (example: 10)
* @param callback Will get called every time the user changes the setting; use this to apply/save the setting.
* @param valueFormatter Will get called every time the game needs to display the float value; use this to change how the displayed string looks
* @param dragStepMultiplier The multiplier for step value in case player does touch drag.
*/
public function new(x:Float, y:Float, name:String, defaultValue:Float, min:Float, max:Float, step:Float, precision:Int, ?callback:Float->Void,
?valueFormatter:Float->String, dragStepMultiplier:Float = 1):Void
{
super(x, y, name, function()
{



}

override function update(elapsed:Float):Void
{


{
}


{
}



{
}

{
{
}
else if (controls().UI_RIGHT #if FEATURE_TOUCH_CONTROLS || (TouchUtil.touch != null && TouchUtil.touch.deltaX >= dragThreshold) #end)
{
}
}

{

}
else if (shouldIncrease)
{

}
}

/** Turns the float into a string */
function formatted(value:Float):String
{
{
}
else
{
}
}

function toFixed(value:Float):Float
{
}
}
