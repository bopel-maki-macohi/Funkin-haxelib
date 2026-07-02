

/*
A shader that takes in various values for certain "lights" in the "sserafim" stage and uses those
to tint a sprite based on that context.
Used on the characters and stage for the LE SERRAFIM collab.

(Kinda sucks having specific shaders for certain parts of the game but this one is sooo specific
that i dont really have a choice... : P)
*/
class SserafimShader extends FlxShader
{
/*
The current amount of "darkness" the stage has.
Tints the sprite color further to black from 0-1.
(this is treated differently when isCharacter is true)
*/

/*
The color of the pulse light behind the truck.
*/

/*
The strength/opacity of the light behind the truck.
*/

/*
The strength/opacity of the lights on the truck.
*/

/*
Whether this shader is for the characters or not.
This will change how dramatic the light effect is.
*/

/*
The hue component of the Adjust Color part of the shader.
*/

/*
The saturation component of the Adjust Color part of the shader.
*/

/*
The brightness component of the Adjust Color part of the shader.
*/

/*
The contrast component of the Adjust Color part of the shader.
*/

/*
Sets all 4 adjust color values.
*/
public function setAdjustColor(b:Float, h:Float, c:Float, s:Float)
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

function set_darkenAmount(val:Float):Float
{
}

function set_pulseLightColor(col:FlxColor):FlxColor
{

}

function set_pulseLightStrength(val:Float):Float
{
}

function set_truckLightStrength(val:Float):Float
{
}

function set_isCharacter(val:Bool):Bool
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


vec3 hue2rgb(float hue){
abs(hue*6.-3.)-1.,
2.-abs(hue*6.-2.),
2.-abs(hue*6.-4.)
}

vec3 rgb2hsl(vec3 c){
float cMin=min(min(c.r,c.g),c.b),
cMax=max(max(c.r,c.g),c.b),
hsl.y=delta/(cMax+cMin); //Saturation.
}else{
hsl.y=delta/(2.-cMax-cMin); //Saturation.
}
float deltaR=(((cMax-c.r)/6.)+(delta/2.))/delta,
deltaG=(((cMax-c.g)/6.)+(delta/2.))/delta,
//Hue.
}else if(c.g==cMax){
}else{ //if(c.b==cMax){
}
}
}

vec3 hsl2rgb(vec3 hsl){
}else{
}else{
}
}
}


void main()
{









}else{


}


}


')
public function new(char:Bool = false)
{


}
}
