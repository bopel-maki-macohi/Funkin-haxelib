package funkin.data.notestyle;


/**
* A type definition for the data in a note style JSON file.
* @see https://lib.haxe.org/p/json2object/
*/
typedef NoteStyleData =
{
/**
* The version number of the note style data schema.
* When making changes to the note style data format, this should be incremented,
* and a migration function should be added to NoteStyleDataParser to handle old versions.
*/

/**
* The readable title of the note style.
*/

/**
* The author of the note style.
*/

/**
* The note style to use as a fallback/parent.
* @default null
*/

/**
* Data for each of the assets in the note style.
*/
}

typedef NoteStyleAssetsData =
{
/**
* The sprites for the notes.
* @default The sprites from the fallback note style.
*/

/**
* The sprites for the hold notes.
* @default The sprites from the fallback note style.
*/

/**
* The sprites for the strumline.
* @default The sprites from the fallback note style.
*/

/**
* The sprites for the note splashes.
*/

/**
* The sprites for the hold note covers.
*/

/**
* The THREE sound (and an optional pre-READY graphic).
*/

/**
* The TWO sound and READY graphic.
*/

/**
* The ONE sound and SET graphic.
*/

/**
* The GO sound and GO! graphic.
*/

/**
* The SICK! judgement.
*/

/**
* The GOOD! judgement.
*/

/**
* The BAD! judgement.
*/

/**
* The SHIT! judgement.
*/










}

/**
* Data shared by all note style assets.
*/
typedef NoteStyleAssetData<T> =
{
/**
* The image to use for the asset. May be a Sparrow sprite sheet.
*/

/**
* The scale to render the note at.
* @default 1.0
*/

/**
* Offset the sprite's position by this amount.
* @default [0, 0]
*/

/**
* If true, the note is a pixel sprite, and will be rendered without anti-aliasing.
*/


/**
* If true, animations will be played on the graphic.
* @default `false` to save performance.
*/

/**
* The structure of this data depends on the asset.
*/
}

typedef NoteStyleData_Note =
{
}

typedef NoteStyleData_Countdown =
{
}

typedef NoteStyleData_HoldNote =
{
}

typedef NoteStyleData_Judgement =
{
}

typedef NoteStyleData_ComboNum =
{
}

/**
* Data on animations for each direction of the strumline.
*/
typedef NoteStyleData_NoteStrumline =
{
}

typedef NoteStyleData_NoteSplash =
{
/**
* If false, note splashes are entirely hidden on this note style.
* @default Note splashes are enabled.
*/







};

typedef NoteStyleData_HoldNoteCover =
{
/**
* If false, hold note covers are entirely hidden on this note style.
* @default Hold note covers are enabled.
*/




};

typedef NoteStyleData_HoldNoteCoverDirectionData =
{
/**
* Optionally specify an asset path to use for this specific animation.
* @:default The assetPath of the main holdNoteCover asset
*/

}
