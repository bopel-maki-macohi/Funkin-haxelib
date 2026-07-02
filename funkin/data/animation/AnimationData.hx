
class AnimationDataUtil
{
public static function toNamed(data:UnnamedAnimationData, name:String = ""):AnimationData
{
name: name,
prefix: data.prefix,
assetPath: data.assetPath,
offsets: data.offsets,
looped: data.looped,
flipX: data.flipX,
flipY: data.flipY,
frameRate: data.frameRate,
frameIndices: data.frameIndices
}

/**
* @param data
* @param name (adds index to name)
* @return Array<AnimationData>
*/
public static function toNamedArray(data:Array<UnnamedAnimationData>, name:String = ""):Array<AnimationData>
{
}

public static function toUnnamed(data:AnimationData):UnnamedAnimationData
{
prefix: data.prefix,
assetPath: data.assetPath,
offsets: data.offsets,
looped: data.looped,
flipX: data.flipX,
flipY: data.flipY,
frameRate: data.frameRate,
frameIndices: data.frameIndices
}

public static function toUnnamedArray(data:Array<AnimationData>):Array<UnnamedAnimationData>
{
}
}

/**
* A data structure representing an animation in a spritesheet.
* This is a generic data structure used by characters, stage props, and more!
* BE CAREFUL when changing it.
*/
typedef AnimationData =
{
> UnnamedAnimationData,

/**
* The name for the animation.
* for example, characters need animations with names `idle`, `singDOWN`, `singUPmiss`, etc.
*/
}

/**
* A data structure representing an animation in a spritesheet.
* This animation doesn't specify a name, that's presumably specified by the parent data structure.
*/
typedef UnnamedAnimationData =
{
/**
* The prefix for the frames of the animation as defined by the XML file.
* This will may or may not differ from the `name` of the animation,
* depending on how your animator organized their FLA or whatever.
*
* NOTE: For Sparrow animations, this is not optional, but for Packer animations it is.
*/

/**
* Optionally specify an asset path to use for this specific animation.
* ONLY for use by MultiSparrow and MultiAnimateAtlas characters.
* @default The assetPath of the parent sprite
*/

/**
* Offset the character's position by this amount when playing this animation.
* @default [0, 0]
*/

/**
* Whether the animation should loop when it finishes.
* @default false
*/

/**
* Whether the animation's sprites should be flipped horizontally.
* @default false
*/

/**
* Whether the animation's sprites should be flipped vertically.
* @default false
*/

/**
* The frame rate of the animation.
* @default 24
*/

/**
* If you want this animation to use only certain frames of an animation with a given prefix,
* select them here.
* @example [0, 1, 2, 3] (use only the first four frames)
* @default [] (all frames)
*/

/**
* The type of animation to use.
* Only available for texture atlases.
* Options: "framelabel", "symbol"
*/

/**
* The render type of the animation.
* Only available for multi-sparrow and multi-animateatlas characters.
* Options: "sparrow", "animateatlas"
*/

/**
* Various settings for the sprite.
* Only available for texture atlases.
*/
}
