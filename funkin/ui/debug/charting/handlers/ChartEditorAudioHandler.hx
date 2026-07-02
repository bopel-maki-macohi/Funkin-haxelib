package funkin.ui.debug.charting.handlers;


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
state.audioVocalTrackData.set(trackId, bytes);
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
state.audioInstTrackData.set(instId, bytes);
}

public static function switchToInstrumental(state:ChartEditorState, instId:String = '', playerId:String, opponentId:String):Bool
{

stopExistingVocals(state);

result = playVocals(state, BF, playerId, instId);

result = playVocals(state, DAD, opponentId, instId);

state.postLoadVocals();

state.hardRefreshOffsetsToolbox();

state.hardRefreshFreeplayToolbox();

state.loadSubtitles();

}

/**
* Tell the Chart Editor to select a specific instrumental track, that is already loaded.
*/
public static function playInstrumental(state:ChartEditorState, instId:String = ''):Bool
{

instTrack.important = true;

stopExistingInstrumental(state);
state.audioInstTrack = instTrack;
state.postLoadInstrumental();
}

public static function stopExistingInstrumental(state:ChartEditorState):Void
{
{
state.audioInstTrack.stop();
state.audioInstTrack.destroy();
state.audioInstTrack = null;
}
}

/**
* Tell the Chart Editor to select a specific vocal track, that is already loaded.
*/
public static function playVocals(state:ChartEditorState, charType:CharacterType, charId:String, instId:String = ''):Bool
{



vocalTrack.important = true;

switch (charType)
{
case BF:
state.audioVocalTrackGroup.addPlayerVoice(vocalTrack);


{
state.audioWaveforms.add(waveformSprite);
}
else
{
}

state.audioVocalTrackGroup.playerVoicesOffset = state.currentVocalOffsetPlayer;
case DAD:
state.audioVocalTrackGroup.addOpponentVoice(vocalTrack);


{
state.audioWaveforms.add(waveformSprite);
}
else
{
}

state.audioVocalTrackGroup.opponentVoicesOffset = state.currentVocalOffsetOpponent;

case OTHER:
state.audioVocalTrackGroup.add(vocalTrack);
default:
}

}

static function initWaveformSprite(waveformData:WaveformData, state:ChartEditorState, charType:CharacterType):WaveformSprite
{
waveformSprite.y = Math.max(state.gridTiledSprite?.y ?? 0.0, ChartEditorState.GRID_INITIAL_Y_POS - ChartEditorState.GRID_TOP_PAD);
waveformSprite.height = (ChartEditorState.GRID_SIZE) * 16;
waveformSprite.width = (ChartEditorState.GRID_SIZE) * 2;
waveformSprite.time = 0;
waveformSprite.duration = Conductor.instance.getStepTimeInMs(16) * 0.001;
waveformSprite.iconId = charType;
}

public static function stopExistingVocals(state:ChartEditorState):Void
{
state.audioVocalTrackGroup.clear();
{
state.audioWaveforms.clear();
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
snd.autoDestroy = true;
snd.play(true);
snd.volume = volume;
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


state.stretchySounds = !state.stretchySounds;
state.stretchySound1.play(true);
state.stretchySound1.volume = volume;
}
else
{


state.stretchySounds = !state.stretchySounds;
state.stretchySound2.play(true);
state.stretchySound2.volume = volume;
}
}

public static function wipeInstrumentalData(state:ChartEditorState):Void
{
state.audioInstTrackData.clear();
stopExistingInstrumental(state);
}

public static function wipeVocalData(state:ChartEditorState):Void
{
state.audioVocalTrackData.clear();
stopExistingVocals(state);
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
continue;
}
zipEntries.push(FileUtil.makeZIPEntryFromBytes('Inst.ogg', data));
}
else
{
{
continue;
}
zipEntries.push(FileUtil.makeZIPEntryFromBytes('Inst-${key}.ogg', data));
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
continue;
}
zipEntries.push(FileUtil.makeZIPEntryFromBytes('Voices-${key}.ogg', data));
}

}
}
