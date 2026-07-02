

/**
* The toolbox which allows modifying information like Note Kind.
*/
class ChartEditorNoteDataToolbox extends ChartEditorBaseToolbox
{





public function new(chartEditorState2:ChartEditorState)
{



}

function onClose(event:UIEvent)
{
}

function initialize():Void
{
toolboxNotesNoteKind.onChange = function(event:UIEvent)
{


{
}
else
{
}


{
for (note in chartEditorState.currentNoteSelection)
{

for (noteSprite in chartEditorState.renderedNotes.members)
{
{
}
}

for (holdNoteSprite in chartEditorState.renderedHoldNotes.members)
{
{
}
}
}
}



toolboxNotesCustomKind.onChange = function(event:UIEvent)
{


{
for (note in chartEditorState.currentNoteSelection)
{
}
}


}

public override function refresh():Void
{


{
}
else
{
}

}

function showCustom():Void
{
}

function hideCustom():Void
{
}

function createNoteKindParams(noteKind:Null<String>):Void
{

{
for (note in chartEditorState.currentNoteSelection)
{
{
}
}
}


for (i in 0...noteKindParams.length)
{



switch (param.type)
{
case NoteKindParamType.INT | NoteKindParamType.FLOAT:

{
}
{
}
{
}

case NoteKindParamType.STRING:
}

{
}

paramComponent.onChange = function(event:UIEvent)
{

for (note in chartEditorState.currentNoteSelection)
{
{
}

{
}
}
}

}

{
for (i in 0...noteKindParams.length)
{
}
}
}

function addNoteKindParam(label:Label, component:Component):Void
{

}

function clearNoteKindParams():Void
{
for (param in toolboxNotesParams)
{
}
}

override function update(elapsed:Float):Void
{

{
}

{
}
}

public static function build(chartEditorState:ChartEditorState):ChartEditorNoteDataToolbox
{
}
}

typedef ToolboxNoteKindParam =
{
}
