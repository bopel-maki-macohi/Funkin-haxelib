package funkin.effects;


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
];
camera.filters = [new ColorMatrixFilter(matrix)];
steps++;
}, stepsTotal + 1);
}

public static function fadeFromWhite(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

1, 0, 0, 0, 1.0 * 255,
0, 1, 0, 0, 1.0 * 255,
0, 0, 1, 0, 1.0 * 255,
0, 0, 0, 1,         0
];
camera.filters = [new ColorMatrixFilter(matrixDerp)];

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, V * 255,
0, 1, 0, 0, V * 255,
0, 0, 1, 0, V * 255,
0, 0, 0, 1,       0
];
camera.filters = [new ColorMatrixFilter(matrix)];
steps--;
}, camSteps);
}

public static function fadeToBlack(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, -V * 255,
0, 1, 0, 0, -V * 255,
0, 0, 1, 0, -V * 255,
0, 0, 0, 1,        0
];
camera.filters = [new ColorMatrixFilter(matrix)];
steps++;
}, camSteps);
}

public static function fadeBlack(camera:FlxCamera, camSteps:Int = 5, time:Float = 1):Void
{

1, 0, 0, 0, -1.0 * 255,
0, 1, 0, 0, -1.0 * 255,
0, 0, 1, 0, -1.0 * 255,
0, 0, 0, 1,          0
];
camera.filters = [new ColorMatrixFilter(matrixDerp)];

new FlxTimer().start(time / stepsTotal, _ ->
{

1, 0, 0, 0, -V * 255,
0, 1, 0, 0, -V * 255,
0, 0, 1, 0, -V * 255,
0, 0, 0, 1,        0
];
camera.filters = [new ColorMatrixFilter(matrix)];
steps--;
}, camSteps + 1);
}
}
