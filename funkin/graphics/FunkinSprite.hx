


typedef AtlasSpriteSettings =
{
/**
* If true, the texture atlas will behave as if it was exported as an SWF file.
* Notably, this allows MovieClip symbols to play.
*/

/**
* If true, filters and masks will be cached when the atlas is loaded, instead of during runtime.
*/

/**
* The filter quality.
* Available values are: HIGH, MEDIUM, LOW, and RUDY.
*
* If you're making an atlas sprite in HScript, you pass an Int instead:
*
* HIGH - 0
* MEDIUM - 1
* LOW - 2
* RUDY - 3
*/

/**
* Optional, an array of spritemaps for the atlas to load.
*/

/**
* Optional, string of the metadata.json contents.
*/

/**
* Optional, force the cache to use a specific key to index the texture atlas.
*/

/**
* If true, the texture atlas will use a new slot in the cache.
*/

/**
* Optional callback for when a symbol is created.
*/

/**
* Whether to apply the stage matrix, if it was exported from a symbol instance.
* Also positions the Texture Atlas as it displays in Animate.
* Turning this on is only recommended if you prepositioned the character in Animate.
* For other cases, it should be turned off to act similarly to a normal FlxSprite.
*/

/**
* If enabled, the sprite will render as one texture instead of rendering multiple limbs.
* This is useful for stuff like changing alpha, and shaders that require the whole sprite.
*
* Only enable this if your sprite either:
* - Changes alpha to something other than 1.0
* - Has a shader or blend mode
*/
}

/**
* An FlxSprite with additional functionality.
* - A more efficient method for creating solid color sprites.
* - TODO: Better cache handling for textures.
*/
class FunkinSprite extends FlxAnimate
{
/**
* The filters array to be applied to the sprite.
*/

/**
* @param x Starting X position
* @param y Starting Y position
* @param path The asset path for the graphic
* @param atlasSettings The optional settings for the texture atlas
*/
public function new(?x:Float = 0, ?y:Float = 0, ?path:String, ?atlasSettings:AtlasSpriteSettings)
{


{

switch (ext)
{
case 'png':

case '':

{
}
else
{
}


default:
}
}
}

override function initVars():Void
{


}

/**
* Create a new FunkinSprite with a static texture.
* @param x The starting X position.
* @param y The starting Y position.
* @param key The key of the texture to load.
* @return The new FunkinSprite.
*/
public static function create(x:Float = 0.0, y:Float = 0.0, key:String):FunkinSprite
{
}

/**
* Create a new FunkinSprite with a Sparrow atlas animated texture.
* @param x The starting X position.
* @param y The starting Y position.
* @param key The key of the texture to load.
* @return The new FunkinSprite.
*/
public static function createSparrow(x:Float = 0.0, y:Float = 0.0, key:String):FunkinSprite
{
}

/**
* Create a new FunkinSprite with a Packer atlas animated texture.
* @param x The starting X position.
* @param y The starting Y position.
* @param key The key of the texture to load.
* @return The new FunkinSprite.
*/
public static function createPacker(x:Float = 0.0, y:Float = 0.0, key:String):FunkinSprite
{
}

/**
* Create a new FunkinSprite with an Adobe Animate texture atlas.
* @param x The starting X position.
* @param y The starting Y position.
* @param key The key of the texture to load.
* @return The new FunkinSprite.
*/
public static function createTextureAtlas(x:Float = 0.0, y:Float = 0.0, key:String, ?assetLibrary:Null<String>, ?settings:AtlasSpriteSettings):FunkinSprite
{
}

/**
* Load a static image as the sprite's texture.
* @param key The key of the texture to load.
* @return This sprite, for chaining.
*/
public function loadTexture(key:String):FunkinSprite
{

{
}

{
}


}

public function loadTextureAsync(key:String, fade:Bool = false):Void
{
{
}

openfl.Assets.loadBitmapData(key)
.onComplete(function(bitmapData:openfl.display.BitmapData)
{

{
}
})
.onError(function(error:Dynamic)
{
{
}
})
.onProgress(function(progress:Int, total:Int)
{
}

/**
* Apply an OpenFL `BitmapData` to this sprite.
* @param input The OpenFL `BitmapData` to apply
* @return This sprite, for chaining
*/
public function loadBitmapData(input:BitmapData, cache:Bool = true):FunkinSprite
{
{
}
else
{
}

}

/**
* Apply an OpenFL `TextureBase` to this sprite.
* @param input The OpenFL `TextureBase` to apply
* @return This sprite, for chaining
*/
public function loadTextureBase(input:TextureBase):Null<FunkinSprite>
{
{
}

}

/**
* Loads an Adobe Animate texture atlas as the sprite's texture.
* @param key The key of the texture to load.
* @param settings Additional settings for loading the atlas.
* @return This sprite, for chaining.
*/
public function loadTextureAtlas(key:Null<String>, ?assetLibrary:Null<String>, ?settings:AtlasSpriteSettings):FunkinSprite
{
{
}

{
}



}

/**
* Load an animated texture (Sparrow atlas spritesheet) as the sprite's texture.
* @param key The key of the texture to load.
* @return This sprite, for chaining.
*/
public function loadSparrow(key:String):FunkinSprite
{


}

/**
* Load an animated texture (Packer atlas spritesheet) as the sprite's texture.
* @param key The key of the texture to load.
* @return This sprite, for chaining.
*/
public function loadPacker(key:String):FunkinSprite
{


}

/**
* @param id The animation ID to check.
* @return Whether the animation is dynamic (has multiple frames). `false` for static, one-frame animations.
*/
public function isAnimationDynamic(id:String):Bool
{
}

/**
* Whether or not this sprite has an animation with the given ID.
* @param id The ID of the animation to check.
*/
public function hasAnimation(id:String):Bool
{
{
}
else if (this.anim.hasAnimateAtlas && !animationList.contains(id))
{
}

}

/**
* Adds an animation if it doesn't exist.
* @param id The animation ID to check.
*/
function addAnimationIfMissing(id:String):Bool
{

{
}
else if (symbols.contains(id))
{
}

}

/**
* Gets every frame on every symbol that starts with the given keyword.
* @param keyword The keyword to search for.
* @return An array of frames.
*/
public function getFramesWithKeyword(keyword:String):Array<animate.internal.Frame>
{
{
}


for (symbol in this.library.dictionary.keys())
{

{
}
}

for (symbolItem in symbolItems)
{
symbolItem.timeline.forEachLayer((layer) ->
{
layer.forEachFrame((frame) ->
{
}

}

/**
* Gets the current animation ID.
*/
public function getCurrentAnimation():String
{
}

/**
* Whether or not the current animation is finished.
*/
public function isAnimationFinished():Bool
{
}

/**
* Acts similarly to `makeGraphic`, but with improved memory usage,
* at the expense of not being able to paint onto the resulting sprite.
*
* @param width The target width of the sprite.
* @param height The target height of the sprite.
* @param color The color to fill the sprite with.
* @return This sprite, for chaining.
*/
public function makeSolidColor(width:Int, height:Int, color:FlxColor = FlxColor.WHITE):FunkinSprite
{

}

/**
* @return A list of all the animations this sprite has available.
*/
public function listAnimations():Array<String>
{

}

/**
* TEXTURE ATLAS-EXCLUSIVE FUNCTIONS
* These functions only work if the sprite's texture is an Adobe Animate texture atlas.
* Calling these functions on non-texture atlases will do nothing.
*/
/**
* Gets a list of frame labels from the default timeline.
*/
public function getFrameLabelList():Array<String>
{
{
}


for (layer in mainTimeline.layers)
{
for (frame in layer.frames)
{
{
}
}
}

}

/**
* Gets a frame label by its name.
* @param name The name of the frame label to retrieve.
* @return The frame label, or null if it doesn't exist.
*/
public function getFrameLabel(name:String, ?timeline:animate.internal.Timeline):Null<animate.internal.Frame>
{
{
}

for (layer in (timeline ?? this.timeline).layers)
{
for (frame in layer.frames)
{
{
}
}
}

}

/**
* Returns the default symbol in the atlas.
*/
public function getDefaultSymbol():String
{
{
}

}

/**
* Replaces the graphic of a symbol in the atlas.
* @param symbol The symbol to replace.
* @param graphic The new graphic to use.
* @param adjustScale Whether to adjust the scale of new frame to match the old one.
*/
public function replaceSymbolGraphic(symbol:String, ?graphic:Null<FlxGraphicAsset>, ?adjustScale:Bool = true):Void
{
{
}


for (element in elements)
{

}
}

/**
* Returns the first element of a symbol in the atlas.
* @param symbol The symbol to get elements from.
* @return The first element of the symbol. WARNING: Can be null.
*/
public function getFirstElement(symbol:String):Null<Element>
{
{
}

}

/**
* Returns the elements of a symbol in the atlas.
* @param symbol The symbol to get elements from.
*/
public function getSymbolElements(symbol:String):Array<Element>
{
{
}


{
}


{
}

}

/**
* Scales an element by a certain multiplier.
* @param element The element to scale.
* @param scale The scale multiplier.
* @param positionOffset The offset to apply to `tx` and `ty` after scaling.
* (Or in other words, the position of the element.)
*/
public function scaleElement(element:Element, scale:Float, positionOffset:Float = 0, scaleEverything:Bool = false):Void
{
{
}


{
}




}

/**
* Gets the default settings for a texture atlas sprite.
* @return The default settings for a texture atlas sprite.
*/
public function getDefaultAtlasSettings():AtlasSpriteSettings
{
swfMode: false,
cacheOnLoad: false,
filterQuality: MEDIUM,
spritemaps: null,
metadataJson: null,
cacheKey: null,
uniqueInCache: false,
onSymbolCreate: null,
applyStageMatrix: false,
useRenderTexture: false
}

/**
* Ensure scale is applied when cloning a sprite.R
* The default `clone()` method acts kinda weird TBH.
* @return A clone of this sprite.
*/
public override function clone():FunkinSprite
{

}

override function getBoundingBox(camera:FlxCamera):FlxRect
{


{
}

}

override function preparePixelPerfectMatrix(matrix:FlxMatrix)
{
}


override function checkRenderTexture():Bool
{

}

function set_filters(value:Null<Array<BitmapFilter>>):Null<Array<BitmapFilter>>
{
}

override public function draw():Void
{
for (filter in filters ?? [])
{
}

}

override function drawFrameComplex(frame:FlxFrame, camera:FlxCamera):Void
{


{

{
_renderTexture.drawToCamera((camera, mat) ->
{


}

{
}
else
{
}
}
else
{
}
}

override function drawAnimate(camera:FlxCamera):Void
{





{

{
_renderTexture.drawToCamera((camera, matrix) ->
{

}

{
}
else
{
}
}
else
{
}
}

public override function destroy():Void
{
}
}
