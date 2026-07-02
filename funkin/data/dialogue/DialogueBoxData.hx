package funkin.data.dialogue;


/**
* A type definition for the data for a conversation text box.
* It includes things like the sprite to use, and the font and color for the text.
* The actual text is included in the ConversationData.
* @see https://lib.haxe.org/p/json2object/
*/
typedef DialogueBoxData =
{
/**
* Semantic version for dialogue box data.
*/

/**
* A human readable name for the dialogue box type.
*/

/**
* The asset path for the sprite to use for the dialogue box.
* Takes a static sprite or a sprite sheet.
*/

/**
* Whether to horizontally flip the dialogue box sprite.
*/

/**
* Whether to vertically flip the dialogue box sprite.
*/

/**
* Whether to disable anti-aliasing for the dialogue box sprite.
*/

/**
* The relative horizontal and vertical offsets for the dialogue box sprite.
*/

/**
* Info about how to display text in the dialogue box.
*/

/**
* Multiply the size of the dialogue box sprite.
*/

/**
* If using a spritesheet for the dialogue box, the animations to use.
*/
}

typedef DialogueBoxTextData =
{
/**
* The position of the text in teh box.
*/

/**
* The width of the
*/

/**
* The font size to use for the text.
*/

/**
* The color to use for the text.
* Use a string that can be translated to a color, like `#FF0000` for red.
*/

/**
* The font to use for the text.
* @since v1.1.0
* @default `Arial`, make sure to switch this!
*/

/**
* The color to use for the shadow of the text. Use transparent to disable.
*/

/**
* The width of the shadow of the text.
*/
};
