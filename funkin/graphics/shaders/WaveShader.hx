package funkin.graphics.shaders;


@:nullSafety
class WaveShader extends FlxShader
{
  @:glFragmentSource('
        #pragma header

        void main()
        {
            vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

            gl_FragColor = color;
        }

    ')
  public function new()
  {
    super();
  }
}
