package funkin.ui.options;


class ControlsMenu extends Page<OptionsState.OptionsMenuPageName>
{
public static inline final COLUMNS = 2;
/*
* Defines groups of controls that cannot share inputs, like left and right. Say, if ACCEPT is Z, Back is X,
* if the player sets Back to Z it also set ACCEPT to X. This prevents the player from setting the controls in
* a way the prevents them from changing more controls or exiting the menu.
*/






public function new()
{
super();

menuCamera = new FunkinCamera('controlsMenu');
menuCamera.bgColor = 0x0;
camera = menuCamera;

labels = new FlxTypedGroup<AtlasText>();
controlGrid = new MenuTypedList(Columns(COLUMNS), Vertical);

add(labels);
add(headers);
add(controlGrid);

{
devicesBg.makeSolidColor(FlxG.width, 100, 0xFFFAFD6D);
add(devicesBg);
deviceList = new TextMenuList(Horizontal, None);
add(deviceList);
deviceListSelected = true;


item = deviceList.createItem('Keyboard', AtlasFont.BOLD, selectDevice.bind(Keys));
item.x = FlxG.width / 2 - item.width - 30;
item.y = (devicesBg.height - item.height) / 2;

item = deviceList.createItem('Gamepad', AtlasFont.BOLD, selectDevice.bind(Gamepad(FlxG.gamepads.firstActive.id)));
item.x = FlxG.width / 2 + 30;
item.y = (devicesBg.height - item.height) / 2;
}

for (i in 0...controlList.length)
{
{
continue;
}

{
currentHeader = "UI_";
headers.add(new AtlasText(0, y, "UI", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "NOTE_" && name.indexOf("NOTE_") == 0)
{
currentHeader = "NOTE_";
headers.add(new AtlasText(0, y, "NOTES", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "CUTSCENE_" && name.indexOf("CUTSCENE_") == 0)
{
currentHeader = "CUTSCENE_";
headers.add(new AtlasText(0, y, "CUTSCENE", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "FREEPLAY_" && name.indexOf("FREEPLAY_") == 0)
{
currentHeader = "FREEPLAY_";
headers.add(new AtlasText(0, y, "FREEPLAY", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "WINDOW_" && name.indexOf("WINDOW_") == 0)
{
currentHeader = "WINDOW_";
headers.add(new AtlasText(0, y, "WINDOW", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "VOLUME_" && name.indexOf("VOLUME_") == 0)
{
currentHeader = "VOLUME_";
headers.add(new AtlasText(0, y, "VOLUME", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}
else if (currentHeader != "DEBUG_" && name.indexOf("DEBUG_") == 0)
{
currentHeader = "DEBUG_";
headers.add(new AtlasText(0, y, "DEBUG", AtlasFont.BOLD)).screenCenter(X);
y += spacer;
}


label.alpha = 0.6;
for (i in 0...COLUMNS)
createItem(label.x + CONTROL_MARGIN_X + i * CONTROL_SPACING_X, y, control, i);

y += spacer;
}

camFollow = new FlxObject(FlxG.width / 2, 0, 70, 70);
{
camFollow.y = deviceList.selectedItem.y;
controlGrid.selectedItem.idle();
controlGrid.enabled = false;
}
else
camFollow.y = controlGrid.selectedItem.y;

menuCamera.follow(camFollow, null, 0.06);
menuCamera.deadzone.set(0, margin, menuCamera.width, menuCamera.height - margin * 2);
menuCamera.minScrollY = 0;
controlGrid.onChange.add(function(selected)
{
camFollow.y = selected.y;

labels.forEach((label) -> label.alpha = 0.6);
labels.members[Std.int(controlGrid.selectedIndex / COLUMNS)].alpha = 1.0;
});

prompt = new Prompt("\nPress any key to rebind\n\n\nBackspace to unbind\n    Escape to cancel", None);
prompt.create();
prompt.createBgFromMargin(100, 0xFFfafd6d);
prompt.back.scrollFactor.set(0, 0);
prompt.exists = false;
add(prompt);

popup = new Prompt("\nYou cannot unbind\nthat key!\n\n\nEscape to exit", None);
popup.create();
popup.createBgFromMargin(100, 0xFFfafd6d);
popup.back.scrollFactor.set(0, 0);
popup.exists = false;
add(popup);

{
{
goToDeviceList();
}
else if (canExit)
{
exit();
}
}, 1.0);
add(backButton);
}

function createItem(x = 0.0, y = 0.0, control:Control, index:Int)
{
for (i in 0...controlGroups.length)
{
}

}

function onSelect():Void
{
switch (currentDevice)
{
case Keys:
{
keyUsedToEnterPrompt = FlxG.keys.firstJustPressed();
}
case Gamepad(id):
{
buttonUsedToEnterPrompt = FlxG.gamepads.getByID(id).firstJustPressedID();
}
}

controlGrid.enabled = false;
canExit = false;
prompt.exists = true;
}

function createPopup():Void
{
canExit = false;
popup.exists = true;
}

function goToDeviceList():Void
{
controlGrid.selectedItem.idle();
labels.members[Std.int(controlGrid.selectedIndex / COLUMNS)].alpha = 0.6;
controlGrid.enabled = false;
deviceList.enabled = true;
canExit = true;
camFollow.y = deviceList.selectedItem.y;
deviceListSelected = true;
}

function selectDevice(device:Device):Void
{
currentDevice = device;

for (item in controlGrid.members)
item.updateDevice(currentDevice);

{
prompt.setText('\nPress any key to rebind\n\n\n\n    $cancel to cancel');
popup.setText('\nYou cannot unbind\nthat key!\n\n\n$cancel to exit');
}
else
{
prompt.setText('\nPress any button\n   to rebind\n\n\n $cancel to cancel');
popup.setText('\nYou cannot unbind\nthat button!\n\n\n$cancel to exit');
}

controlGrid.selectedItem.select();
labels.members[Std.int(controlGrid.selectedIndex / COLUMNS)].alpha = 1.0;
controlGrid.enabled = true;
deviceList.enabled = false;
deviceListSelected = false;
canExit = false;
}


override function update(elapsed:Float):Void
{
super.update(elapsed);


{
switch (currentDevice)
{
case Keys:
{


{
{
closePrompt();
}
else if (key == BACKSPACE)
{
onInputSelect(NONE);
closePrompt();
}
else
{
onInputSelect(key);
closePrompt();
}
}
}
case Gamepad(id):
{
{
closePrompt();
}

{
{
closePrompt();
}
else if (key == BACKSPACE)
{
onInputSelect(NONE);
closePrompt();
}
}
}
}
}


{
switch (currentDevice)
{
case Keys:
{
}
case Gamepad(id):
{

}
}
}

switch (currentDevice)
{
case Keys:
{
{
keyUsedToEnterPrompt = null;
}
buttonUsedToEnterPrompt = null;
}
case Gamepad(id):
{
{
buttonUsedToEnterPrompt = null;
}
keyUsedToEnterPrompt = null;
}
}
}

function onInputSelect(input:Int):Void
{

{
for (group in itemGroups)
{
}
}


{
for (i in 0...COLUMNS)
{
}
}

for (group in itemGroups)
{
{
for (otherItem in group)
{
{
PlayerSettings.player1.controls.replaceBinding(otherItem.control, currentDevice, item.input, otherItem.input);
otherItem.input = item.input;
otherItem.label.text = item.label.text;
}
}
}
}

PlayerSettings.player1.controls.replaceBinding(item.control, currentDevice, input, item.input);

item.input = input;
item.label.text = item.getLabel(input);

{
{
leftItem.input = item.input;
item.input = temp;

leftItem.label.text = leftItem.getLabel(leftItem.input);
item.label.text = item.getLabel(item.input);
}
}
else
{
{
item.input = rightItem.input;
rightItem.input = temp;

item.label.text = item.getLabel(item.input);
rightItem.label.text = rightItem.getLabel(rightItem.input);
}
}

PlayerSettings.player1.saveControls();
}

function closePrompt()
{
prompt.exists = false;
controlGrid.enabled = true;
}

function closePopup()
{
popup.exists = false;
actionPrevented = false;
}

override function destroy()
{
super.destroy();

itemGroups = null;

}

override function set_enabled(value:Bool)
{
{
controlGrid.enabled = false;
}
else
{
controlGrid.enabled = !deviceListSelected;
}
}
}

class InputItem extends TextMenuItem
{

public function new(x = 0.0, y = 0.0, device, control, index, ?callback)
{
this.device = device;
this.control = control;
this.index = index;
this.input = getInput();

super(x, y, getLabel(input), DEFAULT, callback);

this.fireInstantly = true;
}

public function updateDevice(device:Device)
{
{
this.device = device;
input = getInput();
label.text = getLabel(input);
}
}

function getInput()
{
list = list.distinct();
{

}

}

public function getLabel(input:Int)
{
}
}
