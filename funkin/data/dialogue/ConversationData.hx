package funkin.data.dialogue;

/**
* A type definition for the data for a specific conversation.
* It includes things like what dialogue boxes to use, what text to display, and what animations to play.
* @see https://lib.haxe.org/p/json2object/
*/
typedef ConversationData =
{
/**
* Semantic version for conversation data.
*/

/**
* Data on the backdrop for the conversation.
*/

/**
* Data on the outro for the conversation.
*/

/**
* Data on the music for the conversation.
*/

/**
* Data for each line of dialogue in the conversation.
*/
}

/**
* Data on the backdrop for the conversation, behind the dialogue box.
* A custom parser distinguishes between backdrop types based on the `type` field.
*/
enum BackdropData
{
SOLID(data:BackdropData_Solid); // 'solid'
}

/**
* Data for a Solid color backdrop.
*/
typedef BackdropData_Solid =
{
/**
* Used to distinguish between backdrop types. Should always be `solid` for this type.
*/

/**
* The color of the backdrop.
*/

/**
* Fade-in time for the backdrop.
* @default No fade-in
*/
};

enum OutroData
{
NONE(data:OutroData_None); // 'none'
FADE(data:OutroData_Fade); // 'fade'
}

typedef OutroData_None =
{
/**
* Used to distinguish between outro types. Should always be `none` for this type.
*/
}

typedef OutroData_Fade =
{
/**
* Used to distinguish between outro types. Should always be `fade` for this type.
*/

/**
* The time to fade out the conversation.
* @default 1 second
*/
}

typedef MusicData =
{
/**
* The asset to play for the music.
*/

/**
* The time to fade in the music.
*/

};

/**
* Data on a single line of dialogue in a conversation.
*/
typedef DialogueEntryData =
{
/**
* Which speaker is speaking.
* @see `SpeakerData.hx`
*/

/**
* The animation the speaker should play for this line of dialogue.
*/

/**
* Which dialogue box to use for this line of dialogue.
* @see `DialogueBoxData.hx`
*/

/**
* Which animation to play for the dialogue box.
*/

/**
* The text that will display for this line of dialogue.
* Text will automatically wrap.
* When the user advances the dialogue, the next entry in the array will concatenate on.
* Advancing when the last entry is displayed will move to the next `DialogueEntryData`,
* or end the conversation if there are no more.
*/

/**
* The relative speed at which text gets "typed out".
* Setting `speed` to `1.5` would make it look like the character is speaking quickly,
* and setting `speed` to `0.5` would make it look like the character is emphasizing each word.
*/
};
