

/**
* A helper for rendering filters on `FunkinSprite` instances.
*/
class FunkinFilterRenderer implements IFlxDestroyable
{
/**
* Graphic containing the current frame with filters.
*/


public function new(parent:FunkinSprite)
{
}

/**
* Apply filters to the current frame.
* The result will be contained in the `graphic` variable.
*/
public function applyFilters():Void
{





{
}
else
{
}


for (filter in parent.filters)
{
{
}
}




}

function _applyFilters(target:BitmapData, bmp:BitmapData, filters:Array<BitmapFilter>, target1:Null<BitmapData>, target2:Null<BitmapData>,
bounds:FlxRect):Void
{


{
}
for (filter in filters)
{
}
}

function getBitmap(width:Int, height:Int):BitmapData
{
{
}
}

function putBitmap(bitmap:BitmapData):Void
{
}

/**
* Clean up memory.
*/
public function destroy():Void
{
for (bitmaps in bitmapPool.iterator())
{
for (bitmap in bitmaps)
{
}
}
}
}
