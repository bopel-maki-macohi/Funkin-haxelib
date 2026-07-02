package funkin.ui.options;


class ModMenu extends Page<OptionsState.OptionsMenuPageName>
{


public function new():Void
{
super();

grpMods = new FlxTypedGroup<ModMenuItem>();
add(grpMods);

refreshModList();
}

override function update(elapsed:Float)
{

selections();



{
grpMods.members[curSelected - 1] = grpMods.members[curSelected];
grpMods.members[curSelected] = oldOne;
selections(-1);
}

{
grpMods.members[curSelected + 1] = grpMods.members[curSelected];
grpMods.members[curSelected] = oldOne;
selections(1);
}

super.update(elapsed);
}

function selections(change:Int = 0):Void
{
curSelected += change;


for (txt in 0...grpMods.length)
{
{
grpMods.members[txt].color = FlxColor.YELLOW;
}
else
grpMods.members[txt].color = FlxColor.WHITE;
}

organizeByY();
}

function refreshModList():Void
{
{
grpMods.remove(grpMods.members[0], true);
}

detectedMods = PolymodHandler.getAllMods();


for (index in 0...detectedMods.length)
{
txt.text = modName;
grpMods.add(txt);
}
}

function organizeByY():Void
{
for (i in 0...grpMods.length)
{
grpMods.members[i].y = 10 + (40 * i);
}
}
}

class ModMenuItem extends FlxText
{

public function new(x:Float, y:Float, w:Float, str:String, size:Int)
{
super(x, y, w, str, size);
}

override function update(elapsed:Float)
{
else
alpha = 0.5;

super.update(elapsed);
}
}
