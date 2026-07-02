package funkin.ui.debug.charting.util;


/**
* Functions for populating dropdowns based on game data.
* These get used by both dialogs and toolboxes so they're in their own class to prevent "reaching over."
*/
class ChartEditorDropdowns
{
/**
* Populate a dropdown with a list of characters.
*/
public static function populateDropdownWithCharacters(dropDown:DropDown, charType:CharacterType, startingCharId:String):DropDownEntry
{
dropDown.dataSource.clear();


{
case BF: {id: "bf", text: "Boyfriend"};
case DAD: {id: "dad", text: "Daddy Dearest"};
default: {
dropDown.dataSource.add({id: "none", text: ""});
{id: "none", text: "None"};
}
}

for (charId in charIds)
{


dropDown.dataSource.add(value);
}

dropDown.dataSource.sort('text', ASCENDING);

}

/**
* Populate a dropdown with a list of stages.
*/
public static function populateDropdownWithStages(dropDown:DropDown, startingStageId:String):DropDownEntry
{
dropDown.dataSource.clear();



for (stageId in stageIds)
{


dropDown.dataSource.add(value);
}

dropDown.dataSource.sort('text', ASCENDING);

}

/**
* Populate a dropdown with a list of time changes.
*/
public static function populateDropdownWithTimeChanges(dropDown:DropDown, timeChanges:Array<SongTimeChange>, startingTimeChange:Int = 0):DropDownEntry
{
dropDown.dataSource.clear();

id: "0",
text: '${timeChanges[0].timeStamp} ms : BPM: ${timeChanges[0].bpm} in ${timeChanges[0].timeSignatureNum}/${timeChanges[0].timeSignatureDen}'
};

for (index in 0...timeChanges.length)
{
id: '$index',
text: '${timeChanges[index].timeStamp} ms : BPM: ${timeChanges[index].bpm} in ${timeChanges[index].timeSignatureNum}/${timeChanges[index].timeSignatureDen}'
};

dropDown.dataSource.add(value);
}

dropDown.dataSource.sort('id', ASCENDING);

}

/**
* Populate a dropdown with a list of song events.
*/
public static function populateDropdownWithSongEvents(dropDown:DropDown, startingEventId:String):DropDownEntry
{
dropDown.dataSource.clear();



for (event in songEvents)
{
dropDown.dataSource.add(value);
}

dropDown.dataSource.sort('text', ASCENDING);

}

/**
* Given the ID of a dropdown element, find the corresponding entry in the dropdown's dataSource.
*/
public static function findDropdownElement(id:String, dropDown:DropDown):Null<DropDownEntry>
{
for (entryIndex in 0...dropDown.dataSource.size)
{
}

}

/**
* Populate a dropdown with a list of note styles.
*/
public static function populateDropdownWithNoteStyles(dropDown:DropDown, startingStyleId:String):DropDownEntry
{
dropDown.dataSource.clear();



for (noteStyleId in noteStyleIds)
{

|| noteStyle._data?.assets?.note == null
|| noteStyle._data?.assets?.holdNote == null)
{
continue;
}


dropDown.dataSource.add(value);
}

dropDown.dataSource.sort('text', ASCENDING);

}

/**
* Populate the provided dropdown with the list of available note kinds.
* @param dropDown The dropdown to populate
* @param startingKindId The note kind to pre-select.
* @return The dropdown entry for the pre-selected note kind.
*/
public static function populateDropdownWithNoteKinds(dropDown:DropDown, startingKindId:String):DropDownEntry
{
dropDown.dataSource.clear();

dropDown.dataSource.add({id: '', text: 'Default'});
dropDown.dataSource.add({id: '~CUSTOM~', text: 'Custom'});


for (noteKindId in customNoteKinds)
{
dropDown.dataSource.add(lookupNoteKind(noteKindId));
}

dropDown.dataSource.sort('id', ASCENDING);

}

/**
* Generates the dropdown entry for the provided note kind ID.
* @param noteKindId The note kind ID
* @return The dropdown entry
*/
public static function lookupNoteKind(noteKindId:Null<String>):DropDownEntry
{


}

/**
* Populate a dropdown with a list of song variations.
*/
public static function populateDropdownWithVariations(dropDown:DropDown, state:ChartEditorState, includeNone:Bool = true):DropDownEntry
{
dropDown.dataSource.clear();


{
dropDown.dataSource.add({id: "none", text: ""});
}


for (variationId in variationIds)
{
dropDown.dataSource.add({id: variationId, text: variationId.toTitleCase()});
}

dropDown.dataSource.sort('text', ASCENDING);

}
}

/**
* An entry in a dropdown.
*/
typedef DropDownEntry =
{
id:String,
text:String
};

