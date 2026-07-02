package funkin.graphics;


/**
* A `CameraFrontEnd` override that uses `FunkinCamera`!
*/
class FunkinCameraFrontEnd extends CameraFrontEnd
{
public override function reset(?newCamera:FlxCamera):Void
{
super.reset(newCamera ?? new FunkinCamera());
}
}
