package funkin.ui.options.items;


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
callback(this.currentValue);
});
lefthandText = new AtlasText(x + 15, y, formatted(defaultValue), AtlasFont.DEFAULT);

updateHitbox();

this.currentValue = defaultValue;
this.min = min;
this.max = max;
this.step = step;
this.precision = precision;
this.onChangeCallback = callback;
this.valueFormatter = valueFormatter;
this.dragStepMultiplier = dragStepMultiplier;

this.fireInstantly = true;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);
lefthandText.text = formatted(currentValue);


holdDelayTimer -= elapsed;
{
changeRateTimer -= elapsed;
}


{
holdDelayTimer = HOLD_DELAY;
changeRateTimer = 0.0;
}



{
valueChangeMultiplier = dragStepMultiplier;
}

{
{
shouldDecrease = true;
changeRateTimer = CHANGE_RATE;
}
else if (controls().UI_RIGHT #if FEATURE_TOUCH_CONTROLS || (TouchUtil.touch != null && TouchUtil.touch.deltaX >= dragThreshold) #end)
{
shouldIncrease = true;
changeRateTimer = CHANGE_RATE;
}
}

{
currentValue = (currentValue - step * valueChangeMultiplier).clamp(min, max);

}
else if (shouldIncrease)
{
currentValue = (currentValue + step * valueChangeMultiplier).clamp(min, max);

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
