

class PolygonVisGroup extends FlxTypedGroup<PolygonSpectogram>
{

public function new()
{
}

/**
* Adds the player's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addPlayerVis(visSnd:FlxSound):Void
{
}

/**
* Adds the opponent's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addOpponentVis(visSnd:FlxSound):Void
{
}

/**
* Adds the instrument's visualizer to the group.
* @param visSnd The visualizer to add.
*/
public function addInstVis(visSnd:FlxSound):Void
{
}

public function clearPlayerVis():Void
{
{
}
}

public function clearOpponentVis():Void
{
{
}
}

public function clearInstVis():Void
{
{
}
}

public function clearAllVis():Void
{
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
}
{
}
}
}
