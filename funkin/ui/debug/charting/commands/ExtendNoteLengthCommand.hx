

/**
* Command that modifies the length of a hold note in the chart editor.
* If it is not a hold note, it will become one, and if it is already a hold note, its length will change.
*/
class ExtendNoteLengthCommand implements ChartEditorCommand
{

public function new(note:SongNoteData, newLength:Float, unit:Unit = MILLISECONDS)
{
}

public function execute(state:ChartEditorState):Void
{
switch (unit)
{
case MILLISECONDS:
case STEPS:
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
}
