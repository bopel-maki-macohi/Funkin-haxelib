package funkin.util;


class BitmapUtil
{
public static function createResultsBar():BitmapData
{

matrix.rotate(-3.8 * Math.PI / 180);
matrix.translate(-15, 0);
rect.width -= 15;

bitmap.draw(mainBitmap, matrix, rect, true);
}

/**
* Scales the bitmap at a specific position.
* @param bitmap The original bitmap to scale.
* @param scale The desired scale for the bitmap part (X Scale only).
* @param scalePosition The position of where it should scale the bitmap, If null it'll use the middle of the bitmap.
* @return A new BitmapData scaled at the specified position.
*/
public static function scalePart(bitmap:BitmapData, scale:Float, ?scalePosition:Float):BitmapData
{

matrix.scale(scale, 1);
rect.width = scaledPartWidth;

rect.x = scalePosition;

}

/**
* Scales the bitmap by adding a specific width at a specific position.
* @param bitmap The original bitmap to modify.
* @param additionalWidth The desired additional width to add to the bitmap.
* @param scalePosition The position of where it should scale the bitmap, If null it'll use the middle of the bitmap.
* @return A new BitmapData scaled at the specified position.
*/
public static function scalePartByWidth(bitmap:BitmapData, additionalWidth:Float, ?scalePosition:Float):BitmapData
{

matrix.scale(scale, 1);
rect.width = scaledPartWidth;

rect.x = scalePosition;

}
}
