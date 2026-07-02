

/**
* The toolbox which allows modifying information like Song Title, Scroll Speed, Characters/Stages, and starting BPM.
*/
class ChartEditorEventDataToolbox extends ChartEditorBaseToolbox
{





/**
* If `true`, changing the value of the Event Kind dropdown will trigger the `onEventKindChanged` callback,
* modifying the event kind of all selected events.
* Set to `false` to safety modify the dropdown directly, without modifying placed events.
*/

function set_shouldTriggerOnEventKindChanged(value:Bool):Bool
{

{
}
else
{
}

}

public function new(chartEditorState2:ChartEditorState)
{



}

function onClose(event:UIEvent)
{
}

function initialize():Void
{


}

function onEventKindChanged(event:UIEvent):Void
{
{
}





{
}


{
for (event in chartEditorState.currentEventSelection)
{
}
}
}

public override function refresh():Void
{



{
}
else if (toolboxEventsEventKind.value != newDropdownElement || lastEventKind != toolboxEventsEventKind.value.id)
{

{
}
else
{
}
}
else
{
}

for (pair in chartEditorState.eventDataToPlace.keyValueIterator())
{


{
}
else
{
switch (field)
{
case Std.isOfType(_, NumberStepper) => true:
case Std.isOfType(_, CheckBox) => true:
case Std.isOfType(_, DropDown) => true:
case Std.isOfType(_, TextField) => true:
default:
}
}
}

}


function buildEventDataFormFromSchema(target:Box, schema:SongEventSchema, eventKind:String):Void
{





}

function recursiveChildAdd(parent:Component, schema:SongEventSchema)
{

for (field in schema)
{



switch (field.type)
{
case INTEGER:
case FLOAT:
case BOOL:
case ENUM:



for (optionName in field.keys.keys())
{
}



case STRING:
case FRAME:

{
}



default:
}


{
}

{
}


{
{
}
}

input.onChange = function(event:UIEvent)
{

{
}
else if (field.type == BOOL)
{
value = cast(chk.selected, Null<Bool>); // Need to cast to nullable bool or the compiler will get mad.
}


{
}
else
{
}

{
for (songEvent in chartEditorState.currentEventSelection)
{
}
}
}

}

{
{
}
{
}




}
}


function updateEasePreview():Void
{


{

}


{
}


{
}

frameCallback = (tmr:FlxTimer) ->
{
{
_pauseTimer.start(_loopPause, function(p:FlxTimer):Void
{
{
}
}
else if (easeDotImage != null
&& !_initializing

}

/**
* Constructs a new Event toolbox for the given Chart Editor.
* @param chartEditorState The Chart Editor state to build the toolbox for.
* @return The newly constructed toolbox.
*/
public static function build(chartEditorState:ChartEditorState):ChartEditorEventDataToolbox
{
}
}
