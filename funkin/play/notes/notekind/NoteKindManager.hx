

class NoteKindManager
{
/**
* Every built-in note kind class must be added to this list.
* Thankfully, with the power of `ClassMacro`, this is done automatically.
*/

/**
* A map of all note kinds, keyed by their name.
* This is used to retrieve note kinds by their name.
*/

/**
* Retrieve a note kind by its name.
* @param noteKind The name of the note kind.
* @return The note kind, or null if it doesn't exist.
*/
public static function getNoteKind(?noteKind:String):Null<NoteKind>
{
}

/**
* Retrieve a list of known valid note kinds.
* @return A list of note kinds
*/
public static function listNoteKinds():Array<String>
{
}

/**
* Initialize custom behavior for note kinds.
*/
public static function initialize():Void
{

//
//
}

/**
* Register the hard-coded note kinds.
*/
public static function registerBaseNoteKinds():Void
{
for (noteKindCls in BUILTIN_KINDS)
{


{
}
else
{
}
}
}

/**
* Register the scripted note kinds provided by mods.
*/
public static function registerScriptedNoteKinds():Void
{
{
for (scriptedClass in scriptedClassName)
{
try
{
}
catch (e)
{
}
}
}
}

/**
* Calls the given event for note kind scripts
* @param event The event
*/
public static function callEvent(event:ScriptEvent):Void
{
{


{
}
}
else // call the event for all note kind scripts
{
for (noteKind in noteKinds.iterator())
{
}
}
}

/**
* Retrieve the note style from the given note kind
* @param noteKind note kind name
* @param suffix Used for song note styles
* @return NoteStyle
*/
public static function getNoteStyle(noteKind:String, ?suffix:String):Null<NoteStyle>
{

{
}

}

/**
* Get a list of all the note styles used by the given notes.
* Great for preloading.
* @param songNoteDatas The notes to query for note styles.
* @return The note styles to load.
*/
public static function listNoteStylesByNoteData(songNoteDatas:Array<SongNoteData>):Array<NoteStyle>
{
for (songNoteData in songNoteDatas)
{
{
}
}
}

/**
* Retrieve the note style id from the given note kind
* @param noteKind Note kind name
* @param suffix Used for song note styles
* @return Null<String>
*/
public static function getNoteStyleId(noteKind:String, ?suffix:String):Null<String>
{
{
}

{
noteStyleId = NoteStyleRegistry.instance.hasEntry('$noteStyleId-$suffix') ? '$noteStyleId-$suffix' : noteStyleId;
}

}

/**
* Retrive custom params of the given note kind
* @param noteKind Name of the note kind
* @return Array<NoteKindParam>
*/
public static function getParams(noteKind:Null<String>):Array<NoteKindParam>
{
{
}

}

/**
* Clear the note kind cache.
* Be sure to register the note kinds again before trying to use them.
*/
public static function clearNoteKindCache():Void
{
}
}
