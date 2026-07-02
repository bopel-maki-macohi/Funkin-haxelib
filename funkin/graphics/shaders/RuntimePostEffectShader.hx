

class RuntimePostEffectShader extends FlxRuntimeShader
{
', true)
screenCoord = vec2(
openfl_TextureCoord.x > 0.0 ? 1.0 : 0.0,
openfl_TextureCoord.y > 0.0 ? 1.0 : 0.0
')




vec2 screenToWorld(vec2 screenCoord) {
}

vec2 worldToScreen(vec2 worldCoord) {
}

vec2 screenToFrame(vec2 screenCoord) {


(clampedX - left) / (width),
(clampedY - top) / (height)
}

vec2 bitmapCoordScale() {
}

vec2 screenToBitmap(vec2 screenCoord) {
}

vec4 sampleBitmapScreen(vec2 screenCoord) {
}

vec4 sampleBitmapWorld(vec2 worldCoord) {
}
', true)
public function new(fragmentSource:String = null, glVersion:String = null)
{
}

public function updateViewInfo(screenWidth:Float, screenHeight:Float, camera:FlxCamera):Void
{
}

public function updateFrameInfo(frame:FlxFrame)
{
}

override function __createGLProgram(vertexSource:String, fragmentSource:String):GLProgram
{
try
{
}
catch (error)
{
Log.warn(error); // prevent the app from dying immediately
}
}
}
