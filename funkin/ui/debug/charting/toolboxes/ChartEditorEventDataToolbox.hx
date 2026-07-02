package funkin.ui.debug.charting.toolboxes;


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
shouldTriggerOnEventKindChanged = value;

{
toolboxEventsEventKind.pauseEvent(UIEvent.CHANGE, true);
}
else
{
toolboxEventsEventKind.resumeEvent(UIEvent.CHANGE, true, true);
}

}

public function new(chartEditorState2:ChartEditorState)
{
super(chartEditorState2);

initialize();

this.onDialogClosed = onClose;

this._initializing = false;
}

function onClose(event:UIEvent)
{
chartEditorState.menubarItemToggleToolboxEventData.selected = false;
}

function initialize():Void
{
toolboxEventsEventKind.onChange = onEventKindChanged;
shouldTriggerOnEventKindChanged = false;

toolboxEventsEventKind.value = startingEventValue;

shouldTriggerOnEventKindChanged = true;
}

function onEventKindChanged(event:UIEvent):Void
{
{
}



chartEditorState.eventKindToPlace = eventKind;


{
}

buildEventDataFormFromSchema(toolboxEventsDataBox, schema, chartEditorState.eventKindToPlace);

{
for (event in chartEditorState.currentEventSelection)
{
event.eventKind = chartEditorState.eventKindToPlace;
event.value = chartEditorState.eventDataToPlace;
}
chartEditorState.saveDataDirty = true;
chartEditorState.noteDisplayDirty = true;
chartEditorState.notePreviewDirty = true;
}
}

public override function refresh():Void
{
super.refresh();

shouldTriggerOnEventKindChanged = false;


{
throw 'CHART EDITOR - In Event Toolbox, event kind "${chartEditorState.eventKindToPlace}" not in dropdown!';
}
else if (toolboxEventsEventKind.value != newDropdownElement || lastEventKind != toolboxEventsEventKind.value.id)
{
toolboxEventsEventKind.value = newDropdownElement;

{
}
else
{
buildEventDataFormFromSchema(toolboxEventsDataBox, schema, chartEditorState.eventKindToPlace);
}
}
else
{
}

for (pair in chartEditorState.eventDataToPlace.keyValueIterator())
{

field.pauseEvent(UIEvent.CHANGE, true);

{
throw 'ChartEditorEventDataToolbox - Field "${fieldId}" does not exist in the event data form for kind ${lastEventKind}.';
}
else
{
switch (field)
{
case Std.isOfType(_, NumberStepper) => true:
numberStepper.value = value;
case Std.isOfType(_, CheckBox) => true:
checkBox.selected = value;
case Std.isOfType(_, DropDown) => true:
dropDown.value = value;
case Std.isOfType(_, TextField) => true:
textField.text = value;
default:
throw 'ChartEditorEventDataToolbox - Field "${fieldId}" is of unknown type "${Type.getClassName(Type.getClass(field))}".';
}
}
field.resumeEvent(UIEvent.CHANGE, true, true);
}

shouldTriggerOnEventKindChanged = true;
updateEasePreview();
}


function buildEventDataFormFromSchema(target:Box, schema:SongEventSchema, eventKind:String):Void
{

_initializing = true;

lastEventKind = eventKind ?? 'unknown';

target.removeAllComponents();

recursiveChildAdd(target, schema);

_initializing = false;
}

function recursiveChildAdd(parent:Component, schema:SongEventSchema)
{
easeGraphImage = null;
easeDotImage = null;

for (field in schema)
{

hbox.percentWidth = 100;
parent.addComponent(hbox);

label.text = field.title;
label.verticalAlign = "center";
label.percentWidth = 50;
hbox.addComponent(label);

switch (field.type)
{
case INTEGER:
numberStepper.id = field.name;
numberStepper.step = field.step ?? 1.0;
input = numberStepper;
case FLOAT:
numberStepper.id = field.name;
numberStepper.step = field.step ?? 0.1;
input = numberStepper;
case BOOL:
checkBox.id = field.name;
input = checkBox;
case ENUM:
dropDown.id = field.name;
dropDown.width = 150.0;
dropDown.dropdownSize = 10;
dropDown.dropdownWidth = 157;
dropDown.searchable = true;
dropDown.dataSource = new ArrayDataSource();



for (optionName in field.keys.keys())
{
dropDown.dataSource.add({value: optionValue, text: optionName});
}

dropDown.value = field.defaultValue;

dropDown.dataSource.sort('text', ASCENDING);

input = dropDown;
case STRING:
input = new TextField();
input.id = field.name;
case FRAME:
hbox.removeComponent(label, true);

input = new Frame();
input.id = field.name;
input.text = field.title;
input.percentWidth = 100;
{
}

frameVBox.percentWidth = 100;
input.addComponent(frameVBox);


default:
input = new Label();
input.id = field.name;
input.text = field.type;
}

inputBox.percentWidth = 50;

{
_needEasePreview = true;
}

{
units.text = field.units;
units.verticalAlign = "center";
inputBox.addComponent(units);
}

hbox.addComponent(field.type == FRAME ? input : inputBox);

{
{
chartEditorState.eventDataToPlace.set(field.name, field.defaultValue);
}
}

input.pauseEvent(UIEvent.CHANGE, true);
input.onChange = function(event:UIEvent)
{

{
value = drp.selectedItem?.value ?? field.defaultValue;
updateEasePreview();
}
else if (field.type == BOOL)
{
value = cast(chk.selected, Null<Bool>); // Need to cast to nullable bool or the compiler will get mad.
}


{
chartEditorState.eventDataToPlace.remove(event.target.id);
}
else
{
chartEditorState.eventDataToPlace.set(event.target.id, value);
}

{
for (songEvent in chartEditorState.currentEventSelection)
{
songEvent.eventKind = chartEditorState.eventKindToPlace;
songEvent.value = Reflect.copy(chartEditorState.eventDataToPlace);
}
chartEditorState.saveDataDirty = true;
chartEditorState.noteDisplayDirty = true;
chartEditorState.notePreviewDirty = true;
chartEditorState.noteTooltipsDirty = true;
}
updateEasePreview();
}

input.resumeEvent(UIEvent.CHANGE, true, true);
}

{
{
easeGraphImage = new Image();
easeGraphImage.id = "easeGraph";
easeGraphImage.width = 100;
easeGraphImage.height = 100;
easeGraphImage.hidden = true;
easeGraphImage.verticalAlign = "bottom";
}
{
easeDotImage = new Image();
easeDotImage.id = "easeDot";
easeDotImage.width = 16;
easeDotImage.height = 100;
easeDotImage.hidden = true;
easeDotImage.verticalAlign = "bottom";
}

easeHBox.percentWidth = 100;
easeHBox.height = 100;
easeHBox.verticalAlign = "bottom";

easeHBox.addComponent(easeGraphImage);
easeHBox.addComponent(easeDotImage);

currentEaseHBox = easeHBox;
currentEaseHBox.hidden = true;
parent.addComponent(easeHBox);

updateEasePreview();
}
}


function updateEasePreview():Void
{


{
_dotTimer?.cancel();
_pauseTimer?.cancel();
_dotTimer = null;
_pauseTimer = null;
_easeDotSprites = [];
_dotIndex = 0;

easeGraphImage.resource = null;
easeDotImage.resource = null;
easeGraphImage.hidden = true;
easeDotImage.hidden = true;
}

_dotTimer?.cancel();
_pauseTimer?.cancel();
_dotTimer = null;
_pauseTimer = null;
_easeDotSprites = [];
_dotIndex = 0;

_easeGraphSprite = SongEventHelper.createSpriteFromKey(key, 100, 100);
easeGraphImage.resource = _easeGraphSprite?.frame;
{
easeDotImage.resource = null;
easeGraphImage.hidden = true;
easeDotImage.hidden = true;
}

easeGraphImage.hidden = false;
easeDotImage.hidden = false;

{
easeDotImage.resource = null;
}
_easeDotSprites = dotSprites;
easeDotImage.resource = _easeDotSprites[0].frame;

frameCallback = (tmr:FlxTimer) ->
{
_dotIndex++;
{
_dotTimer?.cancel();
_pauseTimer ??= new FlxTimer();
_pauseTimer.start(_loopPause, function(p:FlxTimer):Void
{
{
_dotIndex = 0;
_dotTimer ??= new FlxTimer();
_dotTimer.start(_dotInterval, frameCallback, 0);
}
}, 1);
}
else if (easeDotImage != null
&& !_initializing
&& _easeDotSprites[_dotIndex].frame != null) easeDotImage.resource = _easeDotSprites[_dotIndex].frame;
};

_dotTimer ??= new FlxTimer();
_dotTimer.start(_dotInterval, frameCallback, 0);
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
