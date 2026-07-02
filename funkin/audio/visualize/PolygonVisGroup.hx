package funkin.audio.visualize;


class PolygonVisGroup extends FlxTypedGroup<PolygonSpectogram>
{

public function new()
{
super();
playerVis = new PolygonSpectogram();
opponentVis = new PolygonSpectogram();
}

/**
* Adds the player's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addPlayerVis(visSnd:FlxSound):Void
{
super.add(vis);
playerVis = vis;
}

/**
* Adds the opponent's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addOpponentVis(visSnd:FlxSound):Void
{
super.add(vis);
opponentVis = vis;
}

/**
* Adds the instrument's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addInstVis(visSnd:FlxSound):Void
{
super.add(vis);
instVis = vis;
}

public function clearPlayerVis():Void
{
{
remove(playerVis);
playerVis.destroy();
playerVis = null;
}
}

public function clearOpponentVis():Void
{
{
remove(opponentVis);
opponentVis.destroy();
opponentVis = null;
}
}

public function clearInstVis():Void
{
{
remove(instVis);
instVis.destroy();
instVis = null;
}
}

public function clearAllVis():Void
{
clearPlayerVis();
clearOpponentVis();
clearInstVis();
}

/**
* Overrides the add function to add a visualizer to the group.
* @param vis The visualizer to add.
* @return The added visualizer.
*/
public override function add(vis:PolygonSpectogram):PolygonSpectogram
{
}

public override function destroy():Void
{
{
playerVis.destroy();
}
{
opponentVis.destroy();
}
super.destroy();
}
}
