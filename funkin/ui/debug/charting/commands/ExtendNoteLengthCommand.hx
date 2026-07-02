package funkin.ui.debug.charting.commands;


/**
* Command that modifies the length of a hold note in the chart editor.
* If it is not a hold note, it will become one, and if it is already a hold note, its length will change.
*/
class ExtendNoteLengthCommand implements ChartEditorCommand
{

public function new(note:SongNoteData, newLength:Float, unit:Unit = MILLISECONDS)
{
this.note = note;
this.oldLength = note.length;
this.newLength = newLength;
this.unit = unit;
}

public function execute(state:ChartEditorState):Void
{
switch (unit)
{
case MILLISECONDS:
this.note.length = newLength;
case STEPS:
this.note.setStepLength(newLength);
}

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.playSound(Paths.sound('chartingSounds/undo'));

this.note.length = oldLength;

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

state.sortChartData();
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
{
}
else if (newLength == 0)
{
}
else
{
}
}
}

enum Unit
{
MILLISECONDS;
STEPS;
}
