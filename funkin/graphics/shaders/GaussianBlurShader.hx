package funkin.graphics.shaders;


/**
* Note... not actually gaussian!
*/
class GaussianBlurShader extends FlxRuntimeShader
{

public function new(amount:Float = 1.0)
{
super(Assets.getText(Paths.frag("gaussianBlur")));
setAmount(amount);
}

public function setAmount(value:Float):Void
{
this.amount = value;
this.setFloat("_amount", amount);
}
}
