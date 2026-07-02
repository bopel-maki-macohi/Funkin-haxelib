package funkin.data.song;


/**
* Data containing information about a song.
* It should contain all the data needed to display a song in the Freeplay menu, or to load the assets required to play its chart.
* Data which is only necessary in-game should be stored in the SongChartData.
*/
class SongMetadata implements ICloneable<SongMetadata>
{
/**
* A semantic versioning string for the song data format.
*
*/






/**
* Instrumental and vocal offsets.
* Defaults to an empty SongOffsets object.
*/

/**
* Data relating to the song's gameplay.
*/




/**
* Defaults to `Constants.DEFAULT_VARIATION`. Populated later.
*/

public function new(songName:String, artist:String, ?charter:String, ?variation:String)
{
this.version = SongRegistry.SONG_METADATA_VERSION;
this.songName = songName;
this.artist = artist;
this.charter = (charter == null) ? null : charter;
this.timeFormat = 'ms';
this.divisions = null;
this.offsets = new SongOffsets();
this.timeChanges = [new SongTimeChange(0, 100)];
this.looped = false;
this.playData = new SongPlayData();
this.playData.songVariations = [];
this.playData.difficulties = [];
this.playData.characters = new SongCharacterData('bf', 'gf', 'dad');
this.playData.stage = 'mainStage';
this.playData.noteStyle = Constants.DEFAULT_NOTE_STYLE;
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
this.variation = (variation == null) ? Constants.DEFAULT_VARIATION : variation;
}

/**
* Create a copy of this SongMetadata with the same information.
* @param newVariation Set to a new variation ID to change the new metadata.
* @return The cloned SongMetadata
*/
public function clone():SongMetadata
{
result.version = this.version;
result.timeFormat = this.timeFormat;
result.divisions = this.divisions;
result.offsets = this.offsets != null ? this.offsets.clone() : new SongOffsets(); // if no song offsets found (aka null), so just create new ones
result.timeChanges = this.timeChanges.deepClone();
result.looped = this.looped;
result.playData = this.playData.clone();
result.generatedBy = this.generatedBy;

}

/**
* Serialize this SongMetadata into a JSON string.
* @param pretty Whether the JSON should be big ol string (false),
* or formatted with tabs (true)
* @return The JSON string.
*/
public function serialize(pretty:Bool = true):String
{
updateVersionToLatest();

{

}

}

public function updateVersionToLatest():Void
{
this.version = SongRegistry.SONG_METADATA_VERSION;
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

enum abstract SongTimeFormat(String) from String to String
{
}

class SongTimeChange implements ICloneable<SongTimeChange>
{
public static final DEFAULT_SONGTIMECHANGE:SongTimeChange = new SongTimeChange(0, 100);

public static final DEFAULT_SONGTIMECHANGES:Array<SongTimeChange> = [DEFAULT_SONGTIMECHANGE];


/**
* Timestamp in specified `timeFormat`.
*/

/**
* Time in beats (int). The game will calculate further beat values based on this one,
* so it can do it in a simple linear fashion.
*/

/**
* Quarter notes per minute (float). Cannot be empty in the first element of the list,
* but otherwise it's optional, and defaults to the value of the previous element.
*/

/**
* Time signature numerator (int). Optional, defaults to 4.
*/

/**
* Time signature denominator (int). Optional, defaults to 4. Should only ever be a power of two.
*/

/**
* Beat tuplets (Array<int> or int). This defines how many steps each beat is divided into.
* It can either be an array of length `n` (see above) or a single integer number.
* Optional, defaults to `[4]`.
*/

public function new(timeStamp:Float, bpm:Float, timeSignatureNum:Int = 4, timeSignatureDen:Int = 4, ?beatTime:Float, ?beatTuplets:Array<Int>)
{
this.timeStamp = timeStamp;
this.bpm = bpm;

this.timeSignatureNum = timeSignatureNum;
this.timeSignatureDen = timeSignatureDen;

this.beatTime = beatTime == null ? DEFAULT_BEAT_TIME : beatTime;
this.beatTuplets = beatTuplets == null ? DEFAULT_BEAT_TUPLETS : beatTuplets;
}

public function clone():SongTimeChange
{
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

/**
* Offsets to apply to the song's instrumental and vocals, relative to the chart.
* These are intended to correct for issues with the chart, or with the song's audio (for example a 10ms delay before the song starts).
* This is independent of the offsets applied in the user's settings, which are applied after these offsets and intended to correct for the user's hardware.
*/
class SongOffsets implements ICloneable<SongOffsets>
{
/**
* The offset, in milliseconds, to apply to the song's instrumental relative to the chart.
* For example, setting this to `-10.0` will start the instrumental 10ms earlier than the chart.
*
* Setting this to `-5000.0` means the chart start 5 seconds into the song.
* Setting this to `5000.0` means there will be 5 seconds of silence before the song starts.
*/

/**
* Apply different offsets to different alternate instrumentals.
*/

/**
* The offset, in milliseconds, to apply to the song's vocals, relative to the song's base instrumental.
* These are applied ON TOP OF the instrumental offset.
*/

/**
* The offset, in milliseconds, to apply to the songs vocals, relative to each alternate instrumental.
* This is useful for the circumstance where, for example, an alt instrumental has a few seconds of lead in before the song starts.
*/

public function new(instrumental:Float = 0.0, ?altInstrumentals:Map<String, Float>, ?vocals:Map<String, Float>, ?altVocals:Map<String, Map<String, Float>>)
{
this.instrumental = instrumental;
this.altInstrumentals = altInstrumentals == null ? new Map<String, Float>() : altInstrumentals;
this.vocals = vocals == null ? new Map<String, Float>() : vocals;
this.altVocals = altVocals == null ? new Map<String, Map<String, Float>>() : altVocals;
}

public function getInstrumentalOffset(?instrumental:String):Float
{


}

public function setInstrumentalOffset(value:Float, ?instrumental:String):Float
{
{
this.instrumental = value;
}
else
{
this.altInstrumentals.set(instrumental, value);
}
}

public function getVocalOffset(charId:String, ?instrumental:String):Float
{
{
}
else
{
}
}

public function setVocalOffset(charId:String, value:Float):Float
{
this.vocals.set(charId, value);
}

public function clone():SongOffsets
{
result.altInstrumentals = this.altInstrumentals.clone();
result.vocals = this.vocals.clone();

}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

/**
* Metadata for a song only used for the music.
* For example, the menu music.
*/
class SongMusicData implements ICloneable<SongMusicData>
{
/**
* A semantic versioning string for the song data format.
*
*/








/**
* Defaults to `Constants.DEFAULT_VARIATION`. Populated later.
*/

public function new(songName:String, artist:String, variation:String = 'default')
{
this.version = SongRegistry.SONG_CHART_DATA_VERSION;
this.songName = songName;
this.artist = artist;
this.timeFormat = 'ms';
this.divisions = null;
this.timeChanges = [new SongTimeChange(0, 100)];
this.looped = false;
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
this.variation = variation == null ? Constants.DEFAULT_VARIATION : variation;
}

public function updateVersionToLatest():Void
{
this.version = SongRegistry.SONG_MUSIC_DATA_VERSION;
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
}

public function clone():SongMusicData
{
result.version = this.version;
result.timeFormat = this.timeFormat;
result.divisions = this.divisions;
result.timeChanges = this.timeChanges.clone();
result.looped = this.looped;
result.generatedBy = this.generatedBy;

}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

class SongPlayData implements ICloneable<SongPlayData>
{
/**
* The variations this song has. The associated metadata files should exist.
*/

/**
* The difficulties contained in this song's chart file.
*/

/**
* The characters used by this song.
*/

/**
* The stage used by this song.
*/

/**
* The note style used by this song.
*/

/**
* The difficulty ratings for this song as displayed in Freeplay.
* Key is a difficulty ID.
*/

/**
* The album ID for the album to display in Freeplay.
* If `null`, display no album.
*/

/**
* The sticker pack for the song to use during transitions.
* If `null`, display the character's sticker pack.
*/

/**
* The start time for the audio preview in Freeplay.
* Defaults to 0 seconds in.
* @since `2.2.2`
*/

/**
* The end time for the audio preview in Freeplay.
* Defaults to 20% seconds in.
* @since `2.2.2`
*/

public function new()
{
ratings = new Map<String, Int>();
}

public function clone():SongPlayData
{
result.songVariations = this.songVariations.clone();
result.difficulties = this.difficulties.clone();
result.characters = this.characters.clone();
result.stage = this.stage;
result.noteStyle = this.noteStyle;
result.ratings = this.ratings.clone();
result.album = this.album;
result.previewStart = this.previewStart;
result.previewEnd = this.previewEnd;

}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

/**
* Information about the characters used in this variation of the song.
* Create a new variation if you want to change the characters.
*/
class SongCharacterData implements ICloneable<SongCharacterData>
{







public function new(player:String = '', girlfriend:String = '', opponent:String = '', instrumental:String = '', ?altInstrumentals:Array<String>,
?opponentVocals:Array<String>, ?playerVocals:Array<String>)
{
this.player = player;
this.girlfriend = girlfriend;
this.opponent = opponent;
this.instrumental = instrumental;

this.altInstrumentals = altInstrumentals ?? [];
this.opponentVocals = opponentVocals;
this.playerVocals = playerVocals;

}

public function clone():SongCharacterData
{
result.altInstrumentals = this.altInstrumentals.clone();

}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

class SongChartData implements ICloneable<SongChartData>
{



/**
* Defaults to `Constants.DEFAULT_VARIATION`. Populated later.
*/

public function new(scrollSpeed:Map<String, Float>, events:Array<SongEventData>, notes:Map<String, Array<SongNoteData>>)
{
this.version = SongRegistry.SONG_CHART_DATA_VERSION;

this.events = events;
this.notes = notes;
this.scrollSpeed = scrollSpeed;

this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
}

public function getScrollSpeed(diff:String = 'default'):Float
{


}

public function setScrollSpeed(value:Float, diff:String = 'default'):Float
{
this.scrollSpeed.set(diff, value);
}

public function getNotes(diff:String):Array<SongNoteData>
{


}

public function setNotes(value:Array<SongNoteData>, diff:String):Array<SongNoteData>
{
this.notes.set(diff, value);
}

/**
* Convert this SongChartData into a JSON string.
*/
public function serialize(pretty:Bool = true):String
{
updateVersionToLatest();

}

public function updateVersionToLatest():Void
{
this.version = SongRegistry.SONG_CHART_DATA_VERSION;
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
}

public function clone():SongChartData
{
for (key in this.notes.keys())
{
noteDataClone.set(key, this.notes.get(key).deepClone());
}

result.version = this.version;
result.generatedBy = this.generatedBy;
result.variation = this.variation;

}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

/**
* The raw underlying data for a song event.
* This value gets wrapped in an `abstract` to allow operators to be overloaded.
*/
class SongEventDataRaw implements ICloneable<SongEventDataRaw>
{
/**
* The timestamp of the event. The timestamp is in the format of the song's time format.
*/

function set_time(value:Float):Float
{
_stepTime = null;
}

/**
* The kind of the event.
* Examples include "FocusCamera" and "PlayAnimation"
* Custom events can be added by scripts with the `ScriptedSongEvent` class.
*/

/**
* The data for the event.
* This can allow the event to include information used for custom behavior.
* Data type depends on the event kind. It can be anything that's JSON serializable.
*/

/**
* Whether this event has been activated.
* This is only used internally by the game during gameplay. It should not be serialized.
*/

public function new(time:Float, eventKind:String, value:Dynamic = null)
{
this.time = time;
this.eventKind = eventKind;
this.value = value;
}

/**
* The cached step time of the event. Should not be serialized in case the BPM of the song changes.
*/

/**
* Get the position of the event in the song, in steps.
* This value is cached for performance. Use `force` to require a recalculation.
*
* @param force Force the value to be recalculated.
* @return The position of the event in the song, in steps.
*/
public function getStepTime(force:Bool = false):Float
{

}

/**
* Clone this event data, creating an independent instance with identical data.
* @return The newly created event data.
*/
public function clone():SongEventDataRaw
{
}

public function valueAsStruct(?defaultKey:String = "key"):Dynamic
{
{
};
{
result.set(defaultKey, this.value);
}
else if (Reflect.isObject(this.value))
{
}
else
{
result.set(defaultKey, this.value);
}
}

/**
* Retrieve the SongEvent handler class for this event.
* @return The handler class, or `null` if not found.
*/
public function getHandler():Null<SongEvent>
{
}

/**
* Retrieve the SongEventSchema for this event.
* @return The schema, or `null` if not found.
*/
public function getSchema():Null<SongEventSchema>
{
}

/**
* Retrieve a field from this event's data, as a `Dynamic` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getDynamic(key:String):Null<Dynamic>
{
}

/**
* Retrieve a field from this event's data, as a `Bool` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getBool(key:String):Null<Bool>
{
}

/**
* Retrieve a field from this event's data, as an `Int` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getInt(key:String):Null<Int>
{
}

/**
* Retrieve a field from this event's data, as a `Float` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getFloat(key:String):Null<Float>
{
}

/**
* Retrieve a field from this event's data, as a `String` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getString(key:String):String
{
}

/**
* Retrieve a field from this event's data, as an `Array<Dynamic>` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getArray(key:String):Array<Dynamic>
{
}

/**
* Retrieve a field from this event's data, as an `Array<Bool>` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getBoolArray(key:String):Array<Bool>
{
}

/**
* Retrieve a field from this event's data, as an `Array<Float>` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getFloatArray(key:String):Array<Float>
{
}

/**
* Retrieve a field from this event's data, as an `Array<String>` value.
* @param key The name of the field to retrieve.
* @return The field value, or `null` if not provided.
*/
public function getStringArray(key:String):Array<Float>
{
}

/**
* Build the tooltip string for this particular instance of the song event.
* @return A tooltip string, containing readable values for the event's data.
*/
public function buildTooltip():String
{




for (fieldName in eventSchema.listAllFieldNames())
{


result += '\n- ${title}: ${valueStr}';
}

for (pair in valueStruct.keyValueIterator())
{



result += '\n- ${title}: ${valueStr}';
}

}
}

/**
* Wrap SongEventData in an abstract so we can overload operators.
*/
getBoolArray, buildTooltip, valueAsStruct)
abstract SongEventData(SongEventDataRaw) from SongEventDataRaw to SongEventDataRaw
{
public function new(time:Float, eventKind:String, value:Dynamic = null)
{
this = new SongEventDataRaw(time, eventKind, value);
}

/**
* Create an independent copy of this event with the same underlying data.
* @return The newly created event.
*/
public function clone():SongEventData
{
}

/**
* Check whether this event is equal to another event.
* Ex. `event1 == event2`
*
* @param other The other event to compare.
* @return Whether the events have the same time, kind, and data.
*/
public function op_equals(other:SongEventData):Bool
{
}

/**
* Check whether this event is not equal to another event.
* Ex. `event1 != event2`
*
* @param other The other event to compare.
* @return Whether the events have a different same time, kind, or data.
*/
public function op_notEquals(other:SongEventData):Bool
{
}

/**
* Check whether this event is later than another event.
* Ex. `event1 > event2`
*
* @param other The other event to compare.
* @return Bool
*/
public function op_greaterThan(other:SongEventData):Bool
{
}

/**
* Check whether this event is earlier than another event.
* Ex. `event1 < event2`
*
* @param other The other event to compare.
* @return Whether this event is earlier than the other event.
*/
public function op_lessThan(other:SongEventData):Bool
{
}

/**
* Check whether this event is later than or at the same time as another event.
* Ex. `event1 >= event2`
*
* @param other The other event to compare.
* @return Whether this event is later than or at the same time as the other event.
*/
public function op_greaterThanOrEquals(other:SongEventData):Bool
{
}

/**
* Check whether this event is earlier than or at the same time as another event.
* Ex. `event1 <= event2`
*
* @param other The other event to compare.
* @return Whether this event is earlier than or at the same time as the other event.
*/
public function op_lessThanOrEquals(other:SongEventData):Bool
{
}

/**
* Produces a string representation of this event, suitable for debugging.
*/
public function toString():String
{
}
}

/**
* The underlying data for a single note.
*/
class SongNoteDataRaw implements ICloneable<SongNoteDataRaw>
{
/**
* The timestamp of the note. The timestamp is in the format of the song's time format.
*/

function set_time(value:Float):Float
{
_stepTime = null;
}

/**
* Data for the note. Represents the index on the strumline.
* 0 = left, 1 = down, 2 = up, 3 = right
* `floor(direction / strumlineSize)` specifies which strumline the note is on.
* 0 = player, 1 = opponent, etc.
*/

/**
* Length of the note, if applicable.
* Defaults to 0 for single notes.
*/

function set_length(value:Float):Float
{
_stepLength = null;
}

/**
* The kind of the note.
* This can allow the note to include information used for custom behavior.
* Defaults to `null` for no kind.
*/

function get_kind():Null<String>
{

}

function set_kind(value:Null<String>):Null<String>
{
}

/**
* The parameters for the note.
* Used for custom behavior on custom note kinds. Defaults to an empty array.
*/

public function new(time:Float, data:Int, length:Float = 0, kind:String = '', ?params:Array<NoteParamData>)
{
this.time = time;
this.data = data;
this.length = length;
this.kind = kind;
this.params = params ?? [];
}

/**
* The direction of the note, if applicable.
* Strips the strumline index from the data.
*
* 0 = left, 1 = down, 2 = up, 3 = right
*
* @param strumlineSize The size of the strumline for the current song. Defaults to 4.
* @return The direction of the note as an index.
*/
public inline function getDirection(strumlineSize:Int = 4):Int
{
}

/**
* The name of the direction of the note, if applicable.
* Strips the strumline index from the data.
*
* @param strumlineSize The size of the strumline for the current song. Defaults to 4.
* @return The direction of the note as a name.
*/
public function getDirectionName(strumlineSize:Int = 4):String
{
}

/**
* The strumline index of the note, if applicable.
* Strips the direction from the data.
*
* 0 = player, 1 = opponent, etc.
*
* @param strumlineSize The size of the strumline for the current song. Defaults to 4.
* @return The strumline index of the note.
*/
public function getStrumlineIndex(strumlineSize:Int = 4):Int
{
}

/**
* Returns true if the note is one that Boyfriend should try to hit (i.e. it's on his side).
* TODO: The name of this function is a little misleading; what about mines?
* @param strumlineSize Defaults to 4.
* @return True if it's Boyfriend's note.
*/
public function getMustHitNote(strumlineSize:Int = 4):Bool
{
}

/**
* The position of the note in the song, in steps.
* Calculated from the time and the BPM.
* Cached for performance. Set to `null` to recalculate.
*/

/**
* @param force Set to `true` to force recalculation (good after BPM changes)
* @return The position of the note in the song, in steps.
*/
public function getStepTime(force:Bool = false):Float
{

}

/**
* The length of the note, if applicable, in steps.
* Calculated from the length and the BPM.
* Cached for performance. Set to `null` to recalculate.
*/

/**
* @param force Set to `true` to force recalculation (good after BPM changes)
* @return The length of the hold note in steps, or `0` if this is not a hold note.
*/
public function getStepLength(force = false):Float
{


}

/**
* Set the length of the hold note, in steps.
* @param value The desired length of the hold note, in steps. Use `0` to make this a tap note.
*/
public function setStepLength(value:Float):Void
{
{
this.length = 0.0;
}
else
{

this.length = lengthMs;
}

_stepLength = null;
}

/**
* Clone the `params` data for this node, creating a new independent instance.
* @return A new array of cloned `NoteParamData` instances.
*/
public function cloneParams():Array<NoteParamData>
{
for (param in this.params)
{
newParams.push(param.clone());
}
}

/**
* Clone this song note data, creating a new independent instance with identical data.
* @return The newly created song note data.
*/
public function clone():SongNoteDataRaw
{
}

public function toString():String
{
+ (this.kind != '' ? ' [kind: ${this.kind}])' : ')');
}

/**
* Build a tooltip string for this note, as seen when hovering in the Chart Editor.
* @return The tooltip string to display.
*/
public function buildTooltip():String
{



result += '\nParams:';

for (param in params)
{
result += '\n- ${param.name}: ${param.value}';
}

}
}

/**
* Wrap SongNoteData in an abstract so we can overload operators.
*/
abstract SongNoteData(SongNoteDataRaw) from SongNoteDataRaw to SongNoteDataRaw
{
public function new(time:Float, data:Int, length:Float = 0, kind:String = '', ?params:Array<NoteParamData>)
{
this = new SongNoteDataRaw(time, data, length, kind, params);
}

public static function buildDirectionName(data:Int, strumlineSize:Int = 4):String
{
switch (data % strumlineSize)
{
case 0:
case 1:
case 2:
case 3:
default:
}
}

/**
* Whether this note is a hold note.
*/

function get_isHoldNote():Bool
{
}

/**
* Determine if two notes are equal.
* Ex. `note1 == note2`
*
* @param other The other note to compare.
* @return Whether the two notes have equal data.
*/
public function op_equals(other:SongNoteData):Bool
{

{
}
else
{
}

}

public function op_notEquals(other:SongNoteData):Bool
{

{
}
else
{
}

}

public function op_greaterThan(other:SongNoteData):Bool
{

}

public function op_lessThan(other:SongNoteData):Bool
{

}

public function op_greaterThanOrEquals(other:SongNoteData):Bool
{

}

public function op_lessThanOrEquals(other:SongNoteData):Bool
{

}

public function clone():SongNoteData
{
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
+ (this.kind != '' ? ' [kind: ${this.kind}])' : ')');
}
}

class NoteParamData implements ICloneable<NoteParamData>
{


public function new(name:String, value:Dynamic)
{
this.name = name;
this.value = value;
}

public function clone():NoteParamData
{
}

public function toString():String
{
}
}
