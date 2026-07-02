package funkin.graphics.shaders;


class RuntimeCustomBlendShader extends RuntimePostEffectShader
{

function set_sourceSwag(value:BitmapData):BitmapData
{
this.setBitmapData("sourceSwag", value);
}


function set_backgroundSwag(value:BitmapData):BitmapData
{
this.setBitmapData("backgroundSwag", value);
}


function set_blendSwag(value:BlendMode):BlendMode
{
this.setInt("blendMode", cast value);
}

public function new()
{
super(Assets.getText("assets/shaders/customBlend.frag"));
}
}
