

/**
* The toolbox which allows modifying information like Song Title, Scroll Speed, Characters/Stages, and starting BPM.
*/
class ChartEditorMetadataToolbox extends ChartEditorBaseToolbox
{

public function new(chartEditorState2:ChartEditorState)
{



}

function onClose(event:UIEvent)
{
}

function initialize():Void
{

inputSongId.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputSongName.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputSongArtist.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputSongCharter.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputStage.onChange = function(event:UIEvent)
{

{
}

inputNoteStyle.onChange = function(event:UIEvent)
{

{
}

inputTimeChange.onChange = function(event:UIEvent)
{

{
}
else
{
inputTimeStamp.min += 1; // This here so it can't accidentally change the first/0 timechange timestamp to 1.
}

inputBPM.onChange = function(event:UIEvent)
{

{
chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, event.value,
}

inputTimeStamp.onChange = function(event:UIEvent)
{

{
chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, event.value, currentTimeChange.bpm,
}

inputTSNum.onChange = function(event:UIEvent)
{

chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, currentTimeChange.bpm,
}

inputTSDen.onChange = function(event:UIEvent)
{

chartEditorState.performCommand(new ModifyTimeChangeCommand(inputTimeChange.selectedIndex, currentTimeChange.timeStamp, currentTimeChange.bpm,
}

createTimeChange.onClick = function(_:UIEvent)
{
chartEditorState.performCommand(new AddNewTimeChangeCommand(currentTimeChangeIndex,
}

removeTimeChange.onClick = function(_:UIEvent)
{
}

inputScrollSpeed.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputDifficultyRating.onChange = function(event:UIEvent)
{

buttonCharacterOpponent.onClick = function(_)
{

buttonCharacterGirlfriend.onClick = function(_)
{

buttonCharacterPlayer.onClick = function(_)
{

}

public function refreshTimeChanges(startingTimeChangeIndex:Int = 0):Void
{
}

public function refreshTimeChangeInputs(updateDropdownText:Bool = false):Null<funkin.data.song.SongData.SongTimeChange>
{
{
}
{
}
}

public override function refresh():Void
{



{
}

{
}


{
}
else
{
}

{
}
else
{
}

{
}
else
{
}
}

public static function build(chartEditorState:ChartEditorState):ChartEditorMetadataToolbox
{
}
}
