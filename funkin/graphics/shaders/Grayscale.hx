package funkin.graphics.shaders;


class Grayscale extends FlxRuntimeShader
{

public function new(amount:Float = 1)
{
super(Assets.getText(Paths.frag("grayscale")));
setAmount(amount);
}

public function setAmount(value:Float):Void
{
amount = value;
this.setFloat("_amount", amount);
}
}
