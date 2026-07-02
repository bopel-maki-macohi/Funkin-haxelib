package funkin.data.stage;


class StageData
{
/**
* The sematic version number of the stage data JSON format.
* Supports fancy comparisons like NPM does it's neat.
*/




public function new()
{
this.version = StageRegistry.STAGE_DATA_VERSION;
this.characters = makeDefaultCharacters();
}

function makeDefaultCharacters():StageDataCharacters
{
bf: {
zIndex: 0,
scale: 1,
position: [0, 0],
cameraOffsets: [-100, -100]
},
dad: {
zIndex: 0,
scale: 1,
position: [0, 0],
cameraOffsets: [100, -100]
},
gf: {
zIndex: 0,
scale: 1,
position: [0, 0],
cameraOffsets: [0, 0]
}
};
}

/**
* Convert this StageData into a JSON string.
*/
public function serialize(pretty:Bool = true):String
{
updateVersionToLatest();

}

public function updateVersionToLatest():Void
{
this.version = StageRegistry.STAGE_DATA_VERSION;
}
}

typedef StageDataCharacters =
{
};

typedef StageDataProp =
{
/**
* The name of the prop for later lookup by scripts.
* Optional; if unspecified, the prop can't be referenced by scripts.
*/

/**
* The asset used to display the prop.
* NOTE: As of Stage data v1.0.1, you can also use a color here to create a rectangle, like "#ff0000".
* In this case, the `scale` property will be used to determine the size of the prop.
*/

/**
* The position of the prop as an [x, y] array of two floats.
*/

/**
* A number determining the stack order of the prop, relative to other props and the characters in the stage.
* Props with lower numbers render below those with higher numbers.
* This is just like CSS, it isn't hard.
* @default 0
*/

/**
* If set to true, anti-aliasing will be forcibly disabled on the sprite.
* This prevents blurry images on pixel-art levels.
* @default false
*/

/**
* If set to true, the prop will be flipped horizontally.
* @default false
*/

/**
* If set to true, the prop will be flipped vertically.
* @default false
*/

/**
* Either the scale of the prop as a float, or the [w, h] scale as an array of two floats.
* Pro tip: On pixel-art levels, save the sprite small and set this value to 6 or so to save memory.
*/

/**
* The alpha of the prop, as a float.
* @default 1.0
*/

/**
* If not zero, this prop will play an animation every X beats of the song.
* This requires animations to be defined. If `danceLeft` and `danceRight` are defined,
* they will alternated between, otherwise the `idle` animation will be used.
* Supports up to 0.25 precision.
* @default 0.0
*/

/**
* How much the prop scrolls relative to the camera. Used to create a parallax effect.
* Represented as an [x, y] array of two floats.
* [1, 1] means the prop moves 1:1 with the camera.
* [0.5, 0.5] means the prop moves half as much as the camera.
* [0, 0] means the prop is not moved.
* @default [1, 1]
*/

/**
* An optional array of animations which the prop can play.
* @default Prop has no animations.
*/

/**
* If animations are used, this is the name of the animation to play first.
* @default Don't play an animation.
*/

/**
* The animation type to use.
* Options: "sparrow", "packer", "animateatlas"
* @default "sparrow"
*/

/**
* The angle of the prop, as a float.
* @default 0.0
*/

/**
* The blend mode of the prop, as a string.
* Just like in photoshop.
* @default Nothing.
*/

/**
* The color of the prop overlay, as a hex string.
* White overlays, or the ones with the value #FFFFFF, do not appear.
* @default `#FFFFFF`
*/

/**
* Various settings for the prop.
* Only available for texture atlases.
*/
};

typedef TextureAtlasData =
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
};

typedef StageDataCharacter =
{
/**
* A number determining the stack order of the character, relative to props and other characters in the stage.
* Again, just like CSS.
* @default 0
*/

/**
* The position to render the character at.
*/

/**
* The scale to render the character at.
*/

/**
* The camera offsets to apply when focusing on the character on this stage.
* @default [-100, -100] for BF, [100, -100] for DAD/OPPONENT, [0, 0] for GF
*/

/**
* How much the character scrolls relative to the camera. Used to create a parallax effect.
* Represented as an [x, y] array of two floats.
* [1, 1] means the character moves 1:1 with the camera.
* [0.5, 0.5] means the character moves half as much as the camera.
* [0, 0] means the character is not moved.
* @default [1, 1]
*/

/**
* The alpha of the character, as a float.
* @default 1.0
*/

/**
* The angle of the character, as a float.
* @default 0.0
*/
};
