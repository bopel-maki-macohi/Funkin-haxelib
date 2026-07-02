

class BitmapUtil
{
public static function createResultsBar():BitmapData
{


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



}
}
