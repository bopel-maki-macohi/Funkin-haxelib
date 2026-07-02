

/**
* Command that copies a given set of notes and song events to the clipboard,
* and then deletes them from the chart editor.
*/
class CutItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{
SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(notes),
events: SongDataUtils.buildEventClipboard(events)


}

public function undo(state:ChartEditorState):Void
{


}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

else
}
}
