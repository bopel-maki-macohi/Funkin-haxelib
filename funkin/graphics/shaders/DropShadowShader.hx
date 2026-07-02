

/**
* A shader that aims to *mostly recreate how Adobe Animate/Flash handles drop shadows, but its main use here is for rim lighting.
*
* Has options for color, angle, distance, and a threshold to not cast the shadow on parts like outlines.
* Can also be supplied a secondary mask which can then have an alternate threshold, for when sprites have too many conflicting colors
* for the drop shadow to look right (e.g. the tankmen on GF's speakers).
*
* Also has an Adjust Color shader in here so they can work together when needed.
*/
class DropShadowShader extends FlxShader
{
/**
* The color of the drop shadow.
*/

/**
* The angle of the drop shadow.
*
* for reference, depending on the angle, the affected side will be:
* 0 = RIGHT
* 90 = UP
* 180 = LEFT
* 270 = DOWN
*/

/**
* The distance or size of the drop shadow, in pixels,
* relative to the texture itself... NOT the camera.
*/

/**
* The strength of the drop shadow.
* Effectively just an alpha multiplier.
*/

/**
* The brightness threshold for the drop shadow.
* Anything below this number will NOT be affected by the drop shadow shader.
* A value of 0 effectively means theres no threshold, and vice versa.
*/

/**
* The amount of antialias samples per-pixel,
* used to smooth out any hard edges the brightness thresholding creates.
* Defaults to 2, and 0 will remove any smoothing.
*/

/**
* Whether the shader should try and use the alternate mask.
* False by default.
*/

/**
* The image for the alternate mask.
* At the moment, it uses the blue channel to specify what is or isnt going to use the alternate threshold.
* (its kinda sloppy rn i need to make it work a little nicer)
* TODO: maybe have a sort of "threshold intensity texture" as well? where higher/lower values indicate threshold strength..
*/

/**
* An alternate brightness threshold for the drop shadow.
* Anything below this number will NOT be affected by the drop shadow shader,
* but ONLY when the pixel is within the mask.
*/

/**
* The FunkinSprite that the shader should get the frame data from.
* Needed to keep the drop shadow shader in the correct bounds and rotation.
*/

/**
* The hue component of the Adjust Color part of the shader.
*/

/**
* The saturation component of the Adjust Color part of the shader.
*/

/**
* The brightness component of the Adjust Color part of the shader.
*/

/**
* The contrast component of the Adjust Color part of the shader.
*/

/**
* Sets all 4 adjust color values.
* @param b The brightness value
* @param h The hue value
* @param c The contrast value
* @param s The saturation value
*/
public function setAdjustColor(b:Float, h:Float, c:Float, s:Float):Void
{
}

function set_baseHue(val:Float):Float
{
}

function set_baseSaturation(val:Float):Float
{
}

function set_baseBrightness(val:Float):Float
{
}

function set_baseContrast(val:Float):Float
{
}

function set_threshold(val:Float):Float
{
}

function set_antialiasAmt(val:Float):Float
{
}

function set_color(col:FlxColor):FlxColor
{

}

function set_angle(val:Float):Float
{
}

function set_distance(val:Float):Float
{
}

function set_strength(val:Float):Float
{
}

function set_attachedSprite(spr:FunkinSprite):FunkinSprite
{

{
}

}

/**
* Loads an image for the mask.
* While you *could* directly set the value of the mask, this function works for both HTML5 and native targets.
*
* @param path The path to the image to load
*/
public function loadAltMask(path:String):Void
{
}

/**
* Should be called on the animation.callback of the attached sprite.
* TODO: figure out why the reference to the attachedSprite breaks on web??
*
* @param name The name of the animation
* @param frameNum The current frame number
* @param frameIndex The current frame index
*/
public function onAttachedFrame(name:String, frameNum:Int, frameIndex:Int):Void
{
}

/**
* Updates the frame bounds and angle offset of the sprite for the shader
* @param frame The frame to retrieve the information from
*/
public function updateFrameInfo(frame:FlxFrame):Void
{

}

function set_altMaskImage(_bitmapData:BitmapData):BitmapData
{

}

function set_maskThreshold(val:Float):Float
{
}

function set_useAltMask(val:Bool):Bool
{
}












vec3 applyHueRotate(vec3 aColor, float aHue){


}

vec3 applySaturation(vec3 aColor, float value){
}

vec3 applyContrast(vec3 aColor, float value){
value = (((0.00852259 * pow(e, 4.76454 * (value - 1.0))) * 1.01) - 0.0086078159) * 10.0; //Just roll with it...
}
}

vec3 applyHSBCEffect(vec3 color){

//Brightness

//Hue

//Contrast

//Saturation

}

vec2 hash22(vec2 p) {
}

float intensityPass(vec2 fragCoord, float curThreshold, bool useMask) {

}

}



}

float antialias(vec2 fragCoord, float curThreshold, bool useMask) {
}

const int MAX_AA = 8; // This should be large enough for most uses


for (int i = 0; i < MAX_AA * MAX_AA; i++) {
int y = i - (MAX_AA * int(i/MAX_AA)); // poor mans modulus

}

}

}

vec3 createDropShadow(vec3 col, float curThreshold, bool useMask) {



vec2 checkedPixel = vec2(openfl_TextureCoordv.x + (dist * cos(ang + angOffset) * imageRatio.x),


}


}

void main()
{




}

')
public function new()
{





}
}
