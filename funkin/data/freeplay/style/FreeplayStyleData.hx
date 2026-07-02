

/**
* A type definition for the data for an album of songs.
* It includes things like what graphics to display in Freeplay.
* @see https://lib.haxe.org/p/json2object/
*/
typedef FreeplayStyleData =
{
/**
* Semantic version for style data.
*/

/**
* Asset key for the background image.
*/

/**
* Asset key for the difficulty selector image.
*/

/**
* Asset key for the numbers shown at the top right of the screen.
*/

/**
* Asset key for the freeplay capsules.
*/

/**
* Color data for the capsule text outline.
* the order of this array goes as follows: [DESELECTED, SELECTED]
*/

/**
* Delay time after confirming a song selection, before entering PlayState.
* Useful for letting longer animations play out.
*/
}
