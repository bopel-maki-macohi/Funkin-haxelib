package funkin.graphics.shaders;


class PuddleShader extends FlxRuntimeShader
{
public function new()
{
super(Assets.getText(Paths.frag('puddle')));
}
}
