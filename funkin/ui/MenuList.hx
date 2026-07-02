

class MenuTypedList<T:MenuListItem> extends FlxTypedGroup<T>
{


/** Called when a new item is highlighted */

/** Called when an item is accepted */

/** The navigation control scheme to use */

/** Set to false to disable nav control */

/**  */


/** Set to true, internally to disable controls, without affecting vars like `enabled` */


/** touchBuddy over here helps with the touch input! Because overlap for touch does not account for the graphic, only the hitbox.
* And, `FlxG.pixelPerfectOverlap` uses two FlxSprites, so we can't use the `FlxTouch` object */


/** Only used in Options, basically acts the same as OptionsState's `currentName`, it's the current name of the current page in OptionsState.
* Why is it needed? Because touch control's a bitch. Thats why. */


public function new(navControls:NavControls = Vertical, ?wrapMode:WrapMode)
{

else
{
this.wrapMode = switch (navControls)
{
}
}


}

public function addItem(name:String, item:T):T
{

}

public function resetItem(oldName:String, newName:String, ?callback:Void->Void):Null<T>
{

}

override function update(elapsed:Float)
{

}

inline function updateControls():Void
{




newIndex = switch (navControls)
{


{
}

{
{
}
}
else if (TouchUtil.pressed)
{
for (i in 0...members.length)
{



{

{
}
else
{
}

{
{

}
else
{

}
}
else
{
}

}
}
}

{
}
{
}


}

function navAxis(index:Int, size:Int, prev:Bool, next:Bool, allowWrap:Bool):Int
{

{
}
else
{
}

}

/**
* Controls navigation on a linear list of items such as Vertical.
* @param prev
* @param next
* @param allowWrap
*/
inline function navList(prev:Bool, next:Bool, allowWrap:Bool)
{
}

/**
* Controls navigation on a grid
* @param latSize   The size of the fixed axis of the grid, or the "lateral axis"
* @param latPrev   Whether the 'prev' key is pressed along the fixed-lengthed axis. eg: "left" in Column mode
* @param latNext   Whether the 'next' key is pressed along the fixed-lengthed axis. eg: "right" in Column mode
* @param prev      Whether the 'prev' key is pressed along the variable-lengthed axis. eg: "up" in Column mode
* @param next      Whether the 'next' key is pressed along the variable-lengthed axis. eg: "down" in Column mode
* @param allowWrap unused
*/
function navGrid(latSize:Int, latPrev:Bool, latNext:Bool, latAllowWrap:Bool, prev:Bool, next:Bool, allowWrap:Bool):Int
{


}

public function accept():Void
{



else
{
FlxFlicker.flicker(menuItem, 1, 0.06, true, false, function(_)
{
}
}

public function cancelAccept():Void
{
}

/**
* Selects an item in the list. If the item is not available, it will select the next available item.
* @param index The index of the item to select.
*/
public function selectItem(index:Int):Void
{

{
{
}
else if (index > selectedIndex)
{
}
}


}

public function has(name:String):Bool
{
}

public function getItem(name:String):Null<T>
{
}

override function destroy():Void
{
}

inline function get_selectedItem():T
{
}
}

class MenuListItem extends FlxSprite
{

/**
* Set to true for things like opening URLs otherwise, it may it get blocked.
*/



public function new(x = 0.0, y = 0.0, name:String, callback, available:Bool = true)
{

}

function setData(name:String, ?callback:Void->Void, available:Bool):Void
{


}

/**
* Calls setData and resets/redraws the state of the item
* @param name      the label.
* @param callback  Unchanged if null.
*/
public function setItem(name:String, ?callback:Void->Void):Void
{

else
}

public function idle():Void
{
}

public function select():Void
{
}
}

class MenuTypedItem<T:FlxSprite> extends MenuListItem
{

public function new(x = 0.0, y = 0.0, label:T, name:String, callback, available:Bool = true)
{
}

/**
* Use this when you only want to show the label
*/
public function setEmptyBackground()
{
}

function set_label(value:Null<T>):Null<T>
{
{
}
}

override function update(elapsed:Float)
{
}

override function draw()
{
{
}
}

override function set_alpha(value:Float):Float
{


}

override function set_x(value:Float):Float
{


}

override function set_y(Value:Float):Float
{


}
}

enum NavControls
{
}

enum WrapMode
{
}
