package funkin.ui.debug.charting.toolboxes;


/**
* The toolbox which allows modifying information like Note Kind.
*/
class ChartEditorNoteDataToolbox extends ChartEditorBaseToolbox
{





public function new(chartEditorState2:ChartEditorState)
{
super(chartEditorState2);

initialize();

this.onDialogClosed = onClose;

this._initializing = false;
}

function onClose(event:UIEvent)
{
chartEditorState.menubarItemToggleToolboxNoteData.selected = false;
}

function initialize():Void
{
toolboxNotesNoteKind.onChange = function(event:UIEvent)
{


{
showCustom();
chartEditorState.noteKindToPlace = toolboxNotesCustomKind.value;
}
else
{
hideCustom();
chartEditorState.noteKindToPlace = noteKind;
}

createNoteKindParams(noteKind);

{
for (note in chartEditorState.currentNoteSelection)
{
note.kind = chartEditorState.noteKindToPlace;
note.params = ChartEditorState.cloneNoteParams(chartEditorState.noteParamsToPlace);

for (noteSprite in chartEditorState.renderedNotes.members)
{
{
noteSprite.noteStyle = NoteKindManager.getNoteStyleId(note.kind) ?? chartEditorState.currentSongNoteStyle;
break;
}
}

for (holdNoteSprite in chartEditorState.renderedHoldNotes.members)
{
{
holdNoteSprite.noteStyle = NoteKindManager.getNoteStyleId(note.kind) ?? chartEditorState.currentSongNoteStyle;
break;
}
}
}
chartEditorState.saveDataDirty = true;
chartEditorState.noteDisplayDirty = true;
chartEditorState.notePreviewDirty = true;
}
};
toolboxNotesNoteKind.pauseEvent(UIEvent.CHANGE, true);

toolboxNotesNoteKind.value = startingValueNoteKind;

toolboxNotesNoteKind.resumeEvent(UIEvent.CHANGE, true, true);

toolboxNotesCustomKind.onChange = function(event:UIEvent)
{
chartEditorState.noteKindToPlace = customKind;


{
for (note in chartEditorState.currentNoteSelection)
{
note.kind = chartEditorState.noteKindToPlace;
}
chartEditorState.saveDataDirty = true;
chartEditorState.noteDisplayDirty = true;
chartEditorState.notePreviewDirty = true;
}
};
toolboxNotesCustomKind.pauseEvent(UIEvent.CHANGE, true);

toolboxNotesCustomKind.value = chartEditorState.noteKindToPlace;

toolboxNotesCustomKind.resumeEvent(UIEvent.CHANGE, true, true);
}

public override function refresh():Void
{
super.refresh();

toolboxNotesNoteKind.pauseEvent(UIEvent.CHANGE, true);
toolboxNotesCustomKind.pauseEvent(UIEvent.CHANGE, true);

toolboxNotesCustomKind.value = chartEditorState.noteKindToPlace;
toolboxNotesNoteKind.value = ChartEditorDropdowns.lookupNoteKind(chartEditorState.noteKindToPlace);
{
showCustom();
}
else
{
hideCustom();
}

createNoteKindParams(chartEditorState.noteKindToPlace);
toolboxNotesNoteKind.resumeEvent(UIEvent.CHANGE, true, true);
toolboxNotesCustomKind.resumeEvent(UIEvent.CHANGE, true, true);
}

function showCustom():Void
{
toolboxNotesCustomKindLabel.hidden = false;
toolboxNotesCustomKind.hidden = false;
}

function hideCustom():Void
{
toolboxNotesCustomKindLabel.hidden = true;
toolboxNotesCustomKind.hidden = true;
}

function createNoteKindParams(noteKind:Null<String>):Void
{
clearNoteKindParams();

{
for (note in chartEditorState.currentNoteSelection)
{
{
chartEditorState.noteParamsToPlace = ChartEditorState.cloneNoteParams(note.params);
setParamsToPlace = true;
break;
}
}
}


for (i in 0...noteKindParams.length)
{

paramLabel.value = param.description;
paramLabel.verticalAlign = "center";
paramLabel.horizontalAlign = "right";


switch (param.type)
{
case NoteKindParamType.INT | NoteKindParamType.FLOAT:
paramStepper.value = (setParamsToPlace ? chartEditorState.noteParamsToPlace[i].value : param.data?.defaultValue) ?? 0.0;
paramStepper.percentWidth = 100;
paramStepper.step = param.data?.step ?? 1.0;

{
paramStepper.min = param.data.min;
}
{
paramStepper.max = param.data.max;
}
{
paramStepper.precision = param.data.precision;
}
paramComponent = paramStepper;

case NoteKindParamType.STRING:
paramTextField.value = (setParamsToPlace ? chartEditorState.noteParamsToPlace[i].value : param.data?.defaultValue) ?? '';
paramTextField.percentWidth = 100;
paramComponent = paramTextField;
}

{
continue;
}

paramComponent.onChange = function(event:UIEvent)
{
chartEditorState.noteParamsToPlace[i].value = paramComponent.value;

for (note in chartEditorState.currentNoteSelection)
{
{
break;
}

{
note.params[i].value = paramComponent.value;
}
}
}

addNoteKindParam(paramLabel, paramComponent);
}

{
for (i in 0...noteKindParams.length)
{
noteParamData.push(new NoteParamData(noteKindParams[i].name, toolboxNotesParams[i].component.value));
}
chartEditorState.noteParamsToPlace = noteParamData;
}
}

function addNoteKindParam(label:Label, component:Component):Void
{
toolboxNotesParams.push({label: label, component: component});
toolboxNotesGrid.addComponent(label);
toolboxNotesGrid.addComponent(component);

this.height = Math.max(DIALOG_HEIGHT, DIALOG_HEIGHT - 30 + toolboxNotesParams.length * 30);
}

function clearNoteKindParams():Void
{
for (param in toolboxNotesParams)
{
toolboxNotesGrid.removeComponent(param.component);
toolboxNotesGrid.removeComponent(param.label);
}
toolboxNotesParams = [];
this.height = DIALOG_HEIGHT;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{
}

{
this.height = heightToSet;
}
}

public static function build(chartEditorState:ChartEditorState):ChartEditorNoteDataToolbox
{
}
}

typedef ToolboxNoteKindParam =
{
}
