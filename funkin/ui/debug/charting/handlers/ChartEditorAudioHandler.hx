

/**
* Functions for loading audio for the chart editor.
* Handlers split up the functionality of the Chart Editor into different classes based on focus to limit the amount of code in each class.
*/
class ChartEditorAudioHandler
{
/**
* Loads and stores byte data for a vocal track from an absolute file path
*
* @param path The absolute path to the audio file.
* @param charId The character this vocal track will be for.
* @param instId The instrumental this vocal track will be for.
* @return Success or failure.
*/
public static function loadVocalsFromPath(state:ChartEditorState, path:Path, charId:String, instId:String = '', wipeFirst:Bool = false):Bool
{
}

/**
* Loads and stores byte data for a vocal track from an asset
*
* @param path The path to the asset. Use `Paths` to build this.
* @param charId The character this vocal track will be for.
* @param instId The instrumental this vocal track will be for.
* @return Success or failure.
*/
public static function loadVocalsFromAsset(state:ChartEditorState, path:String, charId:String, instId:String = '', wipeFirst:Bool = false):Bool
{
{
}
}

/**
* Loads and stores byte data for a vocal track
*
* @param bytes The audio byte data.
* @param charId The character this vocal track will be for.
* @param instId The instrumental this vocal track will be for.
* @param wipeFirst Whether to wipe the existing vocal data before loading.
*/
public static function loadVocalsFromBytes(state:ChartEditorState, bytes:Bytes, charId:String, instId:String = '', wipeFirst:Bool = false):Bool
{
}

/**
* Loads and stores byte data for an instrumental track from an absolute file path
*
* @param path The absolute path to the audio file.
* @param instId The instrumental this vocal track will be for.
* @return Success or failure.
*/
public static function loadInstFromPath(state:ChartEditorState, path:Path, instId:String = '', wipeFirst:Bool = false):Bool
{
}

/**
* Loads and stores byte data for an instrumental track from an asset
*
* @param path The path to the asset. Use `Paths` to build this.
* @param instId The instrumental this vocal track will be for.
* @return Success or failure.
*/
public static function loadInstFromAsset(state:ChartEditorState, path:String, instId:String = '', wipeFirst:Bool = false):Bool
{
{
}
}

/**
* Loads and stores byte data for a vocal track
*
* @param bytes The audio byte data.
* @param charId The character this vocal track will be for.
* @param instId The instrumental this vocal track will be for.
*/
public static function loadInstFromBytes(state:ChartEditorState, bytes:Bytes, instId:String = '', wipeFirst:Bool = false):Bool
{
}

public static function switchToInstrumental(state:ChartEditorState, instId:String = '', playerId:String, opponentId:String):Bool
{








}

/**
* Tell the Chart Editor to select a specific instrumental track, that is already loaded.
*/
public static function playInstrumental(state:ChartEditorState, instId:String = ''):Bool
{


}

public static function stopExistingInstrumental(state:ChartEditorState):Void
{
{
}
}

/**
* Tell the Chart Editor to select a specific vocal track, that is already loaded.
*/
public static function playVocals(state:ChartEditorState, charType:CharacterType, charId:String, instId:String = ''):Bool
{




switch (charType)
{
case BF:


{
}
else
{
}

case DAD:


{
}
else
{
}


case OTHER:
default:
}

}

static function initWaveformSprite(waveformData:WaveformData, state:ChartEditorState, charType:CharacterType):WaveformSprite
{
waveformSprite.duration = Conductor.instance.getStepTimeInMs(16) * 0.001;
}

public static function stopExistingVocals(state:ChartEditorState):Void
{
{
}
}

/**
* Play a sound effect.
* Automatically cleans up after itself and recycles previous FlxSound instances if available, for performance.
* @param path The path to the sound effect. Use `Paths` to build this.
*/
public static function playSound(_state:ChartEditorState, path:String, volume:Float = 1.0):Void
{
{
}
}

/**
* Play one of two stretchy sounds.
* Since some configurations can play this frequently, we limit to one of each of the two alternating sounds at a time.
* @param state
* @param volume
*/
public static function playStretchySound(state:ChartEditorState, volume:Float = 1.0):Void
{
{


}
else
{


}
}

public static function wipeInstrumentalData(state:ChartEditorState):Void
{
}

public static function wipeVocalData(state:ChartEditorState):Void
{
}

/**
* Create a list of ZIP file entries from the current loaded instrumental tracks in the chart eidtor.
* @param state The chart editor state.
* @return `Array<haxe.zip.Entry>`
*/
public static function makeZIPEntriesFromInstrumentals(state:ChartEditorState):Array<haxe.zip.Entry>
{

for (key in instTrackIds)
{
{
{
}
}
else
{
{
}
}
}

}

/**
* Create a list of ZIP file entries from the current loaded vocal tracks in the chart eidtor.
* @param state The chart editor state.
* @return `Array<haxe.zip.Entry>`
*/
public static function makeZIPEntriesFromVocals(state:ChartEditorState):Array<haxe.zip.Entry>
{

for (key in state.audioVocalTrackData.keys())
{
{
}
}

}
}
