

/**
* Command that mirrors a given array of notes on either or strumline individually,
* along either the X (note direction) axis or Y (note time) axis.
* Flip middle will only work when the given notes are in both strumlines - it's incompatible with individually mirroring the selection.
*/
class MirrorNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, mirrorIndividually:Bool = true, flipMiddle:Bool = false, mirrorX:Bool = true, mirrorY:Bool = true)
{
{
for (note in notes)
{
{
}
else if (note.data >= ChartEditorState.STRUMLINE_SIZE)
{
}
}
{
}
{
}
}
else
}

public function execute(state:ChartEditorState):Void
{



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
