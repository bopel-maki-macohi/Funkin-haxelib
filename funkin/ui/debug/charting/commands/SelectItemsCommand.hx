package funkin.ui.debug.charting.commands;


/**
* Appends one or more items to the selection in the chart editor.
* This does not deselect any items that are already selected, if any.
*/
class SelectItemsCommand implements ChartEditorCommand
{

public function new(?notes:Array<SongNoteData>, ?events:Array<SongEventData>)
{
this.notes = notes ?? [];
this.events = events ?? [];
}

public function execute(state:ChartEditorState):Void
{
for (note in this.notes)
{
state.currentNoteSelection.push(note);
}

for (event in this.events)
{
state.currentEventSelection.push(event);
}

{

state.eventKindToPlace = eventSelected.eventKind;

{
}
else
{
defaultKey = eventSchema.getFirstField()?.name;
}

state.eventDataToPlace = eventData;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT);
}

{

state.noteKindToPlace = noteSelected.kind;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT);
}

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;
}

public function undo(state:ChartEditorState):Void
{
state.currentNoteSelection = SongDataUtils.subtractNotes(state.currentNoteSelection, this.notes);
state.currentEventSelection = SongDataUtils.subtractEvents(state.currentEventSelection, this.events);

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

{
{
}
else
{
}
}
else if (events.length == 0)
{
{
}
else
{
}
}

}
}
