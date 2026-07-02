package funkin.graphics.framebuffer;


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
this.parent = parent;
}

/**
* Apply filters to the current frame.
* The result will be contained in the `graphic` variable.
*/
public function applyFilters():Void
{
parent.filtered = false;


FilterRenderer.expandFilterBounds(bounds, parent.filters);
parent.filterOffsets = [bounds.x * parent.scale.x, bounds.y * parent.scale.x];



{
graphic = FlxGraphic.fromBitmapData(bitmap, false, null, false);
}
else
{
graphic.bitmap = bitmap;
graphic.imageFrame.frame.frame.set(0, 0, bitmap.width, bitmap.height);
}


for (filter in parent.filters)
{
{
}
}


_applyFilters(graphic.bitmap, textureBitmap, parent.filters, filterBmp1, filterBmp2, bounds);


bounds.put();
parent.filtered = true;
}

function _applyFilters(target:BitmapData, bmp:BitmapData, filters:Array<BitmapFilter>, target1:Null<BitmapData>, target2:Null<BitmapData>,
bounds:FlxRect):Void
{


renderer.__setBlendMode(NORMAL);
renderer.__worldAlpha = 1;
{
renderer.__worldTransform = new openfl.geom.Matrix();
renderer.__worldColorTransform = new openfl.geom.ColorTransform();
}
renderer.__worldTransform.identity();
renderer.__worldColorTransform.__identity();
bmp.__renderTransform.identity();
bmp.__renderTransform.translate(-bounds.x, -bounds.y);
renderer.setShader(renderer.__defaultShader);
renderer.__setRenderTarget(bitmap);
renderer.__scissorRect(null);
renderer.__renderFilterPass(bmp, renderer.__defaultDisplayShader, true);
for (filter in filters)
{
bitmap = FilterRenderer.__renderGpuFilter(filter, bitmap, bitmap2, bitmap3);
}
}

function getBitmap(width:Int, height:Int):BitmapData
{
{
bitmaps.push(bitmap);
}
bitmap.__fillRect(bitmap.rect, 0, true);
bitmapPool.set(id, bitmaps);
}

function putBitmap(bitmap:BitmapData):Void
{
bitmapPool.set(id, bitmaps);
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
bitmap.dispose();
}
}
}
}
