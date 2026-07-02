package funkin.graphics.shaders;


class BlendModesShader extends FlxRuntimeShader
{

public function new()
{
super(Assets.getText(Paths.frag('blendModes')));
}

public function setCamera(cameraData:BitmapData):Void
{
this.cameraData = cameraData;

this.setBitmapData('camera', this.cameraData);
}
}
