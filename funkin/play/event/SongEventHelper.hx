

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
}
else
{
}
}

}

static function getEaseY(raw:Float, size:Int, range:{min:Float, max:Float}):Int
{


}

static function createBitmapFromFunc(func:Dynamic, key:String, thickness:Int = 2):BitmapData
{
try
{


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
}
}
}
catch (e:Dynamic)
{
}
}

public static function createSpriteFromKey(key:String, displayW:Int, displayH:Int):FlxSprite
{
{
}
}

public static function getOrCreateEaseDotSprites(key:String, frameCount:Int = 30, dotRadius:Int = 3, dotWidth:Int = 16):Array<FlxSprite>
{
for (f in 0...frameCount)
{
try
{
}
catch (e:Dynamic)
{
}
for (dx in -dotRadius...dotRadius + 1)
for (dy in -dotRadius...dotRadius + 1)
{
}
}
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
