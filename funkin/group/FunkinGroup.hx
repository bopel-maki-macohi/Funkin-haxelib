

/**
* A FunkinGroup of FlxSprites.
*/

/**
* FlxSpriteGroup but better. Kinda like if `FlxNestedSprite` and `FlxSpriteGroup` were merged.
*/
class FunkinGroup<T:FlxSprite> extends FlxSprite
{
/**
* The children of this FunkinGroup.
*/

/**
* The size of this FunkinGroup. Read only.
*/

function get_size():Int
{
}

/**
* The length of this FunkinGroup. Read only.
*
* Alias to `size`.
*/

function get_length():Int
{
}

/**
* The max size of this FunkinGroup. 0 and below is infinite.
*/

function set_maxSize(value:Int):Int
{


{
for (child in 0...size)
{
}
}

}

/**
* The width of all the FunkinGroup's children's displays put together.
*
* Meant as a replacement of frameWidth.
*/

/**
* The height of all the FunkinGroup's children's displays put together.
*
* Meant as a replacement of frameHeight.
*/

/**
* If this is false, the FunkinGroup will update children normally. Otherwise,
* it will not (obviously).
*
* Useful for outside objects to modify this group's children. (Extending
* classes can just override updateChildren)
*
* `false` by default.
*/

/**
* Should this FunkinGroup treat itself more like one image (in scale terms).
*
* `true` by default.
*/

/**
* Should this FunkinGroup treat itself more like one image (in angle terms).
*
* `true` by default.
*/

override function get_width():Float
{

{

{

}

override function get_height():Float
{

{

{

}


function get_accurateWidth():Float
{

{

{

}

function get_accurateHeight():Float
{

{

{

}

/**
* Sets this FunkinGroup's `origin` to the center of its complete graphic.
*
* Replacement for `centerOrigin`.
*/
public function resetOrigin():Void
{

{

{

}

/**
* Constructor for FunkinGroup.
*
* @param x Starting X.
* @param y Starting Y.
* @param maxSize Starting max size.
* @param preciseScale Whether to treat the FunkinGroup like one image (with scale).
* @param preciseAngle Whether to treat the FunkinGroup like one image (with angle).
*/
public function new(?x:Float, ?y:Float, ?maxSize:Int, ?preciseScale:Bool, ?preciseAngle:Bool)
{



}

/**
* Gets the child at an index.
*
* @param index The position.
* @return The child or null.
*/
public inline function getChildAt(index:Int):Null<T>
{

}

/**
* Sets the child at an index.
*
* @param index The position.
* @param replacement A new child to replace the old one.
*/
public inline function setChildAt(index:Int, replacement:T):Void
{

}

override public function update(elapsed:Float):Void
{


for (child in children)
{
}
}

override public function draw():Void
{
for (child in children)
{
}
}

/**
* Updates the children here. Uses the child's local variables like `localX` and `localY` to update the child's position. Like `FlxNestedSprite`!
* Can be overriden by outside classes with `customChildUpdate`.
*/
public function updateChildren():Void
{

for (child in children)
{
{




{

}
else if (preciseAngle && !preciseScale)
{


}
else if (preciseAngle && preciseScale)
{


}



}
}
}

/**
* Adds a child to this FunkinGroup. Will also return said child for convenience.
* Can't add if `size` is at `maxSize`, instead returning null.
*
* @param child The child that the caller wants this FunkinGroup to add.
* @return The same child or null.
*/
public function add(child:T):Null<T>
{

}

/**
* Makes a child right in this FunkinGroup. Will also return said child for convenience.
* Can't create the child if `size` is at `maxSize`, instead returning null.
*
* @return The created child or null.
*/
public function make():Null<T>
{

}

/**
* Adds a child to this FunkinGroup at a given index. Will also return said child for convenience.
*
* @param child The child that the caller wants this FunkinGroup to add.
* @param index The position the caller wants the child to go in.
* @return The same child or null.
*/
public function insert(child:T, index:Int):Null<T>
{
}

/**
* Moves select children from another FunkinGroup into this one. Only works if both FunkinGroups contain the same type.
*
* @param grp The other group to take from.
* @param children The children to move.
*/
public function move(grp:FunkinGroup<T>, children:Array<T>):Void
{
for (child in children)
{
{
}
}
}

override public function destroy():Void
{
for (child in children)
{
}


}

/**
* Removes a child from the group, also returns it for convenience.
*
* @param child The child to remove.
* @return The removed child.
*/
public function remove(child:T):Null<T>
{

}

/**
* Applies a function to all children.
*
* @param func A function that modifies one child at a time.
*/
public function forEach(func:T->Void):Void
{
for (child in children)
{
{
}
}
}

/**
* Sorts the children of this FunkinGroup. Returns the sorted children
*
* @param func     The sorting function to use - you can use one of the premade ones in
*                 `FlxSort` or write your own using `FlxSort.byValues()` as a "backend".
* @param setGroup Whether to actually sort the children of this group,
*                 so the caller can grab a sorted list without this group
*                 actually sorting the children.
* @param order    A constant that defines the sort order.
*                 Possible values are `FlxSort.ASCENDING` (default) and `FlxSort.DESCENDING`.
* @return         The sorted children list.
*/
public inline function sort(func:(Int, T, T) -> Int, setGroup:Bool = true, order = FlxSort.ASCENDING):Null<Array<T>>
{
{
}
else
{
}
}

/**
* Refreshes the group, by redoing the render order of all children.
* It does this based on the `zIndex` of each child.
*/
public function refresh():Void
{
}

/**
* Get's the first alive child under this FunkinGroup. Returns null if it can't
* find squat.
*
* @return The alive child or null.
*/
public inline function getFirstAlive():Null<T>
{
for (child in children)
{
}

}

/**
* Get's the first dead child under this FunkinGroup. Returns null if it can't
* find squat.
* getFirstAlive's evil twin.
*
* @return The dead child or null.
*/
public inline function getFirstDead():Null<T>
{
for (child in children)
{
}

}

/**
* Counts the amount of alive children in this FunkinGroup.
*
* @return The alive child number or null.
*/
public inline function countLiving():Int
{

for (child in children)
{
}

}

/**
* Counts the amount of dead children in this FunkinGroup.
*
* @return The dead child number or null.
*/
public inline function countDead():Int
{

for (child in children)
{
}

}

/**
* Gets the first nonexistent child in the family and returns it.
* Good for recycling.
*
* @return The child or null.
*/
public inline function getFirstAvailable():Null<T>
{
for (child in children)
{
}

}

/**
* Gets the index of the first null child under this FunkinGroup.
* -1 means it failed
*
* @return The index.
*/
public inline function getFirstNull():Int
{
for (child in 0...size)
{
}

}

/**
* Gets the first existing child in the family and returns it.
* Good for recycling.
*
* @return The child or null.
*/
public inline function getFirstExisting():Null<T>
{
for (child in children)
{
}

}

/**
* Gets a random child from this FunkinGroup.
* @param startIndex Optional offset off the front of the array.
*                   Default value is `0`, or the beginning of the array.
* @param length Optional restriction on the number of values you want to randomly select from.
* @return A child or null.
*/
public inline function getRandom(startIndex:Int = 0, length:Int = 0):Null<T>
{


}

/**
* Brings a child back from the graveyard.
*
* @param child The child to revive.
*/
public function reviveChild(child:T):Void
{
}

/**
* Kills all the children and then itself.
* Revive this group via `revive()`.
*/
override public function kill():Void
{
for (child in children)
{
}

}

/**
* Revives all the children and then itself.
*/
override public function revive():Void
{
for (child in children)
{
}

}

override public function clone():FunkinGroup<T>
{

for (child in children)
{
}

}


/**
* This functionality isn't supported in `FunkinGroup`.
* @return this group
*/
override public function makeGraphic(Width:Int, Height:Int, Color:Int = FlxColor.WHITE, Unique:Bool = false, ?Key:String):FlxSprite
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
* @return this group
*/
override public function loadGraphicFromSprite(Sprite:FlxSprite):FlxSprite
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
* @return this group
*/
override public function loadGraphic(Graphic:flixel.system.FlxAssets.FlxGraphicAsset, Animated:Bool = false, Width:Int = 0, Height:Int = 0,
Unique:Bool = false, ?Key:String):FlxSprite
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
* @return this group
*/
override public function loadRotatedGraphic(Graphic:flixel.system.FlxAssets.FlxGraphicAsset, Rotations:Int = 16, Frame:Int = -1, AntiAliasing:Bool = false,
AutoBuffer:Bool = false, ?Key:String):FlxSprite
{
}

override function set_pixels(Value:openfl.display.BitmapData):openfl.display.BitmapData
{
}

override function set_frame(Value:flixel.graphics.frames.FlxFrame):flixel.graphics.frames.FlxFrame
{
}

override function get_pixels():openfl.display.BitmapData
{
}

/**
* Internal function to update the current animation frame.
*
* @param	RunOnCpp	Whether the frame should also be recalculated if we're on a non-flash target
*/
override inline function calcFrame(RunOnCpp:Bool = false):Void
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
*/
override inline function resetHelpers():Void
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
*/
override public inline function stamp(Brush:FlxSprite, X:Int = 0, Y:Int = 0):Void
{
}

override function set_frames(Frames:flixel.graphics.frames.FlxFramesCollection):flixel.graphics.frames.FlxFramesCollection
{
}

/**
* This functionality isn't supported in `FunkinGroup`.
*/
override inline function updateColorTransform():Void
{
}
}
