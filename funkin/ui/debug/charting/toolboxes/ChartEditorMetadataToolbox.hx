package funkin.ui.debug.charting.toolboxes;


/**
* The toolbox which allows modifying information like Song Title, Scroll Speed, Characters/Stages, and starting BPM.
*/
class ChartEditorMetadataToolbox extends ChartEditorBaseToolbox
{

public function new(chartEditorState2:ChartEditorState)
{
super(chartEditorState2);

tcDropdownItemRenderer = inputTimeChange.findComponent(haxe.ui.core.ItemRenderer);

initialize();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
chartEditorState.menubarItemToggleToolboxMetadata.selected = false;
}

function initialize():Void
{
this.x = 150;
this.y = 250;

inputSongId.onChange = function(event:UIEvent)
{

{
inputSongId.removeClass('invalid-value');
chartEditorState.songManifestData.songId = event.target.text;
}
else
{
chartEditorState._songManifestData = null;
}
};

inputSongName.onChange = function(event:UIEvent)
{

{
inputSongName.removeClass('invalid-value');
chartEditorState.currentSongMetadata.songName = event.target.text;
}
else
{
chartEditorState.currentSongMetadata.songName = '';
}
};

inputSongArtist.onChange = function(event:UIEvent)
{

{
inputSongArtist.removeClass('invalid-value');
chartEditorState.currentSongMetadata.artist = event.target.text;
}
else
{
chartEditorState.currentSongMetadata.artist = '';
}
};

inputSongCharter.onChange = function(event:UIEvent)
{

{
inputSongCharter.removeClass('invalid-value');
chartEditorState.currentSongMetadata.charter = event.target.text;
}
else
{
chartEditorState.currentSongMetadata.charter = null;
}
};

inputStage.onChange = function(event:UIEvent)
{

{
chartEditorState.currentSongMetadata.playData.stage = event.data.id;
}
};
inputStage.value = startingValueStage;

inputNoteStyle.onChange = function(event:UIEvent)
{

{
chartEditorState.currentSongNoteStyle = event.data.id;
}
};
inputNoteStyle.value = startingValueNoteStyle;

inputTimeChange.onChange = function(event:UIEvent)
{
inputTimeStamp.step = ((Constants.SECS_PER_MIN / (previousTimeChange?.bpm ?? currentTimeChange?.bpm ?? 100)) * Constants.MS_PER_SEC) * (4 / (previousTimeChange?.timeSignatureDen ?? currentTimeChange?.timeSignatureDen ?? 4)) / Constants.STEPS_PER_BEAT;
inputTimeStamp.min = (previousTimeChange?.timeStamp ?? 0);
inputTimeStamp.max = (chartEditorState.currentSongMetadata.timeChanges[inputTimeChange.selectedIndex + 1]?.timeStamp ?? chartEditorState.songLengthInMs);
inputTimeStamp.max -= 1;

{
labelTimeStamp.hidden = true;
inputTimeStamp.hidden = true;
removeTimeChange.disabled = true;
}
else
{
inputTimeStamp.min += 1; // This here so it can't accidentally change the first/0 timechange timestamp to 1.
labelTimeStamp.hidden = false;
inputTimeStamp.hidden = false;
removeTimeChange.disabled = false;
}
};
inputTimeChange.selectedIndex = Std.parseInt(startingTimeChange.id);
inputTimeChange.value = startingTimeChange;

inputBPM.onChange = function(event:UIEvent)
{

{
chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, event.value,
currentTimeChange.timeSignatureNum, currentTimeChange.timeSignatureDen));
inputTimeChange.value.text = '${currentTimeChange.timeStamp} ms : BPM: ${event.value} in ${currentTimeChange.timeSignatureNum}/${currentTimeChange.timeSignatureDen}';
tcDropdownItemRenderer.data = inputTimeChange.value;
}
};

inputTimeStamp.onChange = function(event:UIEvent)
{

{
chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, event.value, currentTimeChange.bpm,
currentTimeChange.timeSignatureNum, currentTimeChange.timeSignatureDen));
inputTimeChange.value.text = '${event.value} ms : BPM: ${currentTimeChange.bpm} in ${currentTimeChange.timeSignatureNum}/${currentTimeChange.timeSignatureDen}';
tcDropdownItemRenderer.data = inputTimeChange.value;
}
};

inputTSNum.onChange = function(event:UIEvent)
{

chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, currentTimeChange.bpm,
numerator, currentTimeChange.timeSignatureDen));
inputTimeChange.value.text = '${currentTimeChange.timeStamp} ms : BPM: ${currentTimeChange.bpm} in ${numerator}/${currentTimeChange.timeSignatureDen}';
tcDropdownItemRenderer.data = inputTimeChange.value;
}

inputTSDen.onChange = function(event:UIEvent)
{

chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, currentTimeChange.bpm,
currentTimeChange.timeSignatureNum, denominator));
inputTimeChange.value.text = '${currentTimeChange.timeStamp} ms : BPM: ${currentTimeChange.bpm} in ${currentTimeChange.timeSignatureNum}/${denominator}';
tcDropdownItemRenderer.data = inputTimeChange.value;
}

createTimeChange.onClick = function(_:UIEvent)
{
chartEditorState.performCommand(new AddNewTimeChangeCommand(currentTimeChangeIndex,
chartEditorState.scrollPositionInMs + chartEditorState.playheadPositionInMs));
}

removeTimeChange.onClick = function(_:UIEvent)
{
chartEditorState.performCommand(new RemoveTimeChangeCommand(inputTimeChange.selectedIndex));
}

inputScrollSpeed.onChange = function(event:UIEvent)
{

{
inputScrollSpeed.removeClass('invalid-value');
chartEditorState.currentSongChartScrollSpeed = event.target.value;
}
else
{
chartEditorState.currentSongChartScrollSpeed = 1.0;
}
labelScrollSpeed.text = 'Scroll Speed: ${chartEditorState.currentSongChartScrollSpeed}x';
};

inputDifficultyRating.onChange = function(event:UIEvent)
{
chartEditorState.currentSongChartDifficultyRating = event.target.value;
};

buttonCharacterOpponent.onClick = function(_)
{
chartEditorState.openCharacterDropdown(CharacterType.DAD, false);
};

buttonCharacterGirlfriend.onClick = function(_)
{
chartEditorState.openCharacterDropdown(CharacterType.GF, false);
};

buttonCharacterPlayer.onClick = function(_)
{
chartEditorState.openCharacterDropdown(CharacterType.BF, false);
};

refresh();
}

public function refreshTimeChanges(startingTimeChangeIndex:Int = 0):Void
{
startingTimeChangeIndex);
inputTimeChange.selectedIndex = Std.parseInt(startingTimeChange.id);
inputTimeChange.value = startingTimeChange;
chartEditorState.updateSongTime();
}

public function refreshTimeChangeInputs(updateDropdownText:Bool = false):Null<funkin.data.song.SongData.SongTimeChange>
{
{
}
inputBPM.value = currentTimeChange.bpm;
inputTSNum.value = currentTimeChange.timeSignatureNum;
inputTSDen.value = currentTimeChange.timeSignatureDen;
inputTimeStamp.value = currentTimeChange.timeStamp;
{
inputTimeChange.value.text = '${currentTimeChange.timeStamp} ms : BPM: ${currentTimeChange.bpm} in ${currentTimeChange.timeSignatureNum}/${currentTimeChange.timeSignatureDen}';
tcDropdownItemRenderer.data = inputTimeChange.value;
}
}

public override function refresh():Void
{
super.refresh();

inputSongId.value = chartEditorState.songManifestData.songId;
inputSongName.value = chartEditorState.currentSongMetadata.songName;
inputSongArtist.value = chartEditorState.currentSongMetadata.artist;
inputSongCharter.value = chartEditorState.currentSongMetadata.charter;
inputStage.value = chartEditorState.currentSongMetadata.playData.stage;
inputNoteStyle.value = chartEditorState.currentSongMetadata.playData.noteStyle;
inputDifficultyRating.value = chartEditorState.currentSongChartDifficultyRating;
inputScrollSpeed.value = chartEditorState.currentSongChartScrollSpeed;
labelScrollSpeed.text = 'Scroll Speed: ${chartEditorState.currentSongChartScrollSpeed}x';
frameVariation.text = 'Variation: ${chartEditorState.selectedVariation.toTitleCase()}';
frameDifficulty.text = 'Difficulty: ${chartEditorState.selectedDifficulty.toTitleCase()}';

refreshTimeChanges();

{
inputStage.value = (stage != null) ? {id: stage.id, text: stage.stageName} : {id: "mainStage", text: "Main Stage"};
}

{
inputNoteStyle.value = (noteStyle != null) ? {id: noteStyle.id, text: noteStyle.getName()} : {id: "Funkin", text: "Funkin'"};
}


{
buttonCharacterOpponent.icon = haxe.ui.util.Variant.fromImageData(CharacterDataParser.getCharPixelIconAsset(chartEditorState.currentSongMetadata.playData.characters.opponent));
buttonCharacterOpponent.text = charDataOpponent.name.length > LIMIT ? '${charDataOpponent.name.substr(0, LIMIT)}.' : '${charDataOpponent.name}';
}
else
{
buttonCharacterOpponent.icon = null;
buttonCharacterOpponent.text = "None";
}

{
buttonCharacterGirlfriend.icon = haxe.ui.util.Variant.fromImageData(CharacterDataParser.getCharPixelIconAsset(chartEditorState.currentSongMetadata.playData.characters.girlfriend));
buttonCharacterGirlfriend.text = charDataGirlfriend.name.length > LIMIT ? '${charDataGirlfriend.name.substr(0, LIMIT)}.' : '${charDataGirlfriend.name}';
}
else
{
buttonCharacterGirlfriend.icon = null;
buttonCharacterGirlfriend.text = "None";
}

{
buttonCharacterPlayer.icon = haxe.ui.util.Variant.fromImageData(CharacterDataParser.getCharPixelIconAsset(chartEditorState.currentSongMetadata.playData.characters.player));
buttonCharacterPlayer.text = charDataPlayer.name.length > LIMIT ? '${charDataPlayer.name.substr(0, LIMIT)}.' : '${charDataPlayer.name}';
}
else
{
buttonCharacterPlayer.icon = null;
buttonCharacterPlayer.text = "None";
}
}

public static function build(chartEditorState:ChartEditorState):ChartEditorMetadataToolbox
{
}
}
