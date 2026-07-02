package funkin.graphics.shaders;


class RuntimePostEffectShader extends FlxRuntimeShader
{
', true)
screenCoord = vec2(
openfl_TextureCoord.x > 0.0 ? 1.0 : 0.0,
openfl_TextureCoord.y > 0.0 ? 1.0 : 0.0
);
')

uniform vec2 uScreenResolution;

uniform vec4 uCameraBounds;

uniform vec4 uFrameBounds;

vec2 screenToWorld(vec2 screenCoord) {
float left = uCameraBounds.x;
float top = uCameraBounds.y;
float right = uCameraBounds.z;
float bottom = uCameraBounds.w;
vec2 scale = vec2(right - left, bottom - top);
vec2 offset = vec2(left, top);
}

vec2 worldToScreen(vec2 worldCoord) {
float left = uCameraBounds.x;
float top = uCameraBounds.y;
float right = uCameraBounds.z;
float bottom = uCameraBounds.w;
vec2 scale = vec2(right - left, bottom - top);
vec2 offset = vec2(left, top);
}

vec2 screenToFrame(vec2 screenCoord) {
float left = uFrameBounds.x;
float top = uFrameBounds.y;
float right = uFrameBounds.z;
float bottom = uFrameBounds.w;
float width = right - left;
float height = bottom - top;

float clampedX = clamp(screenCoord.x, left, right);
float clampedY = clamp(screenCoord.y, top, bottom);

(clampedX - left) / (width),
(clampedY - top) / (height)
);
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
super(fragmentSource, null, glVersion);
uScreenResolution.value = [FlxG.width, FlxG.height];
uCameraBounds.value = [0, 0, FlxG.width, FlxG.height];
uFrameBounds.value = [0, 0, FlxG.width, FlxG.height];
}

public function updateViewInfo(screenWidth:Float, screenHeight:Float, camera:FlxCamera):Void
{
uScreenResolution.value = [screenWidth, screenHeight];
uCameraBounds.value = [camera.viewLeft, camera.viewTop, camera.viewRight, camera.viewBottom];
}

public function updateFrameInfo(frame:FlxFrame)
{
uFrameBounds.value = [frame.uv.left, frame.uv.top, frame.uv.right, frame.uv.bottom];
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
