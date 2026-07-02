package funkin.graphics.shaders;

import openfl.Assets;

@:nullSafety
class PuddleShader extends FlxRuntimeShader
{
  public function new()
  {
    super(Assets.getText(Paths.frag('puddle')));
  }
}
