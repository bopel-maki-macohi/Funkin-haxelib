package funkin.graphics.framebuffer;


/**
* `BitmapData` is kinda broken so I fixed it.
*/
class FixedBitmapData extends BitmapData
{
override function __drawGL(source:IBitmapDrawable, renderer:OpenGLRenderer):Void
{
{
renderer.__stage = object.stage;
}
super.__drawGL(source, renderer);
}

/**
* Creates a `FixedBitmapData` with the given dimensions.
* @param width The width of the bitmap
* @param height The height of the bitmap
* @param useGPU Whether or not this bitmap should use a hardware texture
* @return The newly created `FixedBitmapData`
*/
public static function create(width:Int, height:Int, useGPU:Bool = true):FixedBitmapData
{
{
}

}

/**
* Creates a `FixedBitmapData` from a hardware texture.
* @param texture The texture
* @return The newly created `FixedBitmapData`
*/
public static function fromTexture(texture:TextureBase):FixedBitmapData
{
bitmapData.readable = false;
bitmapData.__texture = texture;
bitmapData.__textureContext = texture.__textureContext;

bitmapData.image = null;

}

static function _createTexture(width:Int, height:Int):TextureBase
{
width = width < 1 ? 1 : width;
height = height < 1 ? 1 : height;

}
}
