

class CharSelectCursors extends FlxTypedSpriteContainer<FunkinSprite>
{
/**
* The main cursor sprite for this class.
*/



public function new()
{







cursorConfirmed.animation.addByPrefix("idle", "cursor ACCEPTED instance 1", 24, true);

cursorDenied.animation.addByPrefix("idle", "cursor DENIED instance 1", 24, false);

}

public function confirm():Void
{

}

public function resetDeny():Void
{
}

public function deny():Void
{
cursorDenied.animation.onFinish.add((_) ->
{
}

public function unconfirm():Void
{
}

/**
* Snaps the cursors to the given position.
* @param intendedPosition The position to snap to as a `FlxPoint`.
*/
public function snapToLocation(intendedPosition:FlxPoint):Void
{




}

/**
* Lerps the cursors to the given position.
* @param intendedPosition The position to lerp to as a `FlxPoint`.
*/
public function lerpToLocation(intendedPosition:FlxPoint):Void
{




}
}
