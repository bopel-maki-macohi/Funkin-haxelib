

/**
* Move the given notes by the given offset and shift them by the given number of columns in the chart editor.
*/
class MoveItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>, offset:Float, columns:Int, offsetInSteps:Bool = false,
roundStepTimeToNearestStep:Bool = false)
{
else
}

public function execute(state:ChartEditorState):Void
{


for (note in notes)
{
resultNote.time = (resultNote.time + offset).clamp(0, Conductor.instance.getStepTimeInMs(state.songLengthInSteps - (1 * state.noteSnapRatio)));
resultNote.data = ChartEditorState.gridColumnToNoteData((ChartEditorState.noteDataToGridColumn(resultNote.data) + columns).clamp(0,

}

for (event in events)
{
resultEvent.time = (resultEvent.time + offset).clamp(0, Conductor.instance.getStepTimeInMs(state.songLengthInSteps - (1 * state.noteSnapRatio)));

}




}

public function undo(state:ChartEditorState):Void
{



}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
