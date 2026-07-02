

class RetroCameraFade
{
public static function fadeWhite(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, V * 255,
0, 1, 0, 0, V * 255,
0, 0, 1, 0, V * 255,
0, 0, 0, 1,       0
}

public static function fadeFromWhite(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

1, 0, 0, 0, 1.0 * 255,
0, 1, 0, 0, 1.0 * 255,
0, 0, 1, 0, 1.0 * 255,
0, 0, 0, 1,         0

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, V * 255,
0, 1, 0, 0, V * 255,
0, 0, 1, 0, V * 255,
0, 0, 0, 1,       0
}

public static function fadeToBlack(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, -V * 255,
0, 1, 0, 0, -V * 255,
0, 0, 1, 0, -V * 255,
0, 0, 0, 1,        0
}

public static function fadeBlack(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

1, 0, 0, 0, -1.0 * 255,
0, 1, 0, 0, -1.0 * 255,
0, 0, 1, 0, -1.0 * 255,
0, 0, 0, 1,          0

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, -V * 255,
0, 1, 0, 0, -V * 255,
0, 0, 1, 0, -V * 255,
0, 0, 0, 1,        0
}
}
