package funkin.play.event;


class SongEventHelper
{

public static function generateEaseGraphsBitmaps():Void
{
for (ease in easeDirList)
for (dir in easeDirs)
{
{
}
}
{
}
k = "linear";
{
}
}

static function getEaseFunc(base:String, dir:String):Dynamic
{
}

public static function getEaseBitmap(key:String):BitmapData
{
}

static function getEaseRange(func:Dynamic, samples:Int):{min:Float, max:Float}
{


for (i in 0...samples)
{

{
min = raw;
max = raw;
hasValue = true;
}
else
{
}
}

}

static function getEaseY(raw:Float, size:Int, range:{min:Float, max:Float}):Int
{

v = (raw - range.min) / span;

v = if (v < 0) 0 else if (v > 1) 1 else v;
}

static function createBitmapFromFunc(func:Dynamic, key:String, thickness:Int = 2):BitmapData
{
try
{

bd.fillRect(new openfl.geom.Rectangle(0, y1 - half, size, thickness), 0xFF404040);
bd.fillRect(new openfl.geom.Rectangle(0, y0 - half, size, thickness), 0xFF404040);

for (i in 0...size)
{
{
{
for (xx in (i - half)...(i + half + 1))
}
else
{
for (xx in (i - half)...(i + half + 1))
}
lastY = y;
}
}
}
catch (e:Dynamic)
{
}
}

public static function createSpriteFromKey(key:String, displayW:Int, displayH:Int):FlxSprite
{
spr.loadGraphic(gfx);
{
spr.scale.set(sx, sy);
}
spr.updateHitbox();
spr.antialiasing = false;
}

public static function getOrCreateEaseDotSprites(key:String, frameCount:Int = 30, dotRadius:Int = 3, dotWidth:Int = 16):Array<FlxSprite>
{
for (f in 0...frameCount)
{
try
{
raw = if (easeFunc != null) easeFunc(t) else 0.0;
}
catch (e:Dynamic)
{
raw = FlxEase.linear(t);
}
for (dx in -dotRadius...dotRadius + 1)
for (dy in -dotRadius...dotRadius + 1)
{
}
spr.loadGraphic(gfx);
sprites.push(spr);
}
easeDotCache.set(key, sprites);
}

static function resolveEaseFuncForKey(key:String):Dynamic
{
for (dir in easeDirs)
{
{
}
}
}
}
