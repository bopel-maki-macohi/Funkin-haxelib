

/**
* A type definition for the data in a story mode level JSON file.
* @see https://lib.haxe.org/p/json2object/
*/
typedef LevelData =
{
/**
* The version number of the level data schema.
* When making changes to the level data format, this should be incremented,
* and a migration function should be added to LevelDataParser to handle old versions.
*/

/**
* The title of the level, as seen in the top corner.
*/

/**
* Optional data for how a level title is labeled on a capsule.
* Used when displaying songs in Freeplay.
*/

/**
* The graphic for the level, as seen in the scrolling list.
*/

/**
* The props to display over the colored background.
* In the base game this is usually Boyfriend and the opponent.
*/

/**
* Whether this week is visible in the story menu.
* @default `true`
*/

/**
* The list of song IDs included in this level.
*/

/**
* The background for the level behind the props.
*/
}

/**
* Data for a level capsule text.
*/
typedef LevelCapsuleData =
{
/**
* The label for the capsule text.
*/

/**
* The offset on the position to render the capsule text at.
*/
}

/**
* Data for a single prop for a story mode level.
*/
typedef LevelPropData =
{
/**
* The image to use for the prop. May optionally be a sprite sheet.
*/

/**
* The scale to render the prop at.
* @default 1.0
*/

/**
* The opacity to render the prop at.
* @default 1.0
*/

/**
* If true, the prop is a pixel sprite, and will be rendered without smoothing.
*/

/**
* The frequency to bop at, in beats.
* 1 = every beat, 2 = every other beat, etc.
* Supports up to 0.25 precision.
* @default 1.0
*/

/**
* The offset on the position to render the prop at.
* @default [0.0, 0.0]
*/

/**
* A set of animations to play on the prop.
* If default/empty, the prop will be static.
*/

/**
* If animations are used, this is the name of the animation to play first.
* @default idle
*/

/**
* Flips the sprite on X axis.
*/

/**
* Flips the sprite on Y axis.
*/
}
