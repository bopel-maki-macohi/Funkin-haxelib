package funkin.ui.options.items;


/**
* Preference item that allows the player to pick a value from an enum (list of values)
*/
class EnumPreferenceItem<T> extends TextMenuItem
{
function controls():Controls
{
}




public function new(x:Float, y:Float, name:String, map:Map<String, T>, defaultKey:String, ?callback:String->T->Void)
{
super(x, y, name, function()
{
callback(this.currentKey, value);
});

updateHitbox();

this.map = map;
this.currentKey = defaultKey;
this.onChangeCallback = callback;

for (key in map.keys())
{

this.keys.push(key);
i += 1;
}

lefthandText = new AtlasText(x + 15, y, formatted(defaultKey), AtlasFont.DEFAULT);

this.fireInstantly = true;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{



currentKey = keys[index];
{
onChangeCallback(currentKey, value);
}
}

lefthandText.text = formatted(currentKey);
}

function formatted(key:String):String
{
}
}
