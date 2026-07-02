package funkin.graphics.shaders;


class MosaicEffect extends FlxRuntimeShader
{

public function new()
{
super(Assets.getText(Paths.frag('mosaic')));
setBlockSize(1.0, 1.0);
}

public function setBlockSize(w:Float, h:Float)
{
blockSize.set(w, h);
setFloatArray("uBlocksize", [w, h]);
}
}
