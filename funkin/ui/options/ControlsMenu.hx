

class ControlsMenu extends Page<OptionsState.OptionsMenuPageName>
{
/*
* Defines groups of controls that cannot share inputs, like left and right. Say, if ACCEPT is Z, Back is X,
* if the player sets Back to Z it also set ACCEPT to X. This prevents the player from setting the controls in
* a way the prevents them from changing more controls or exiting the menu.
*/






public function new()
{




{



}

for (i in 0...controlList.length)
{
{
}

{
}
else if (currentHeader != "NOTE_" && name.indexOf("NOTE_") == 0)
{
}
else if (currentHeader != "CUTSCENE_" && name.indexOf("CUTSCENE_") == 0)
{
}
else if (currentHeader != "FREEPLAY_" && name.indexOf("FREEPLAY_") == 0)
{
}
else if (currentHeader != "WINDOW_" && name.indexOf("WINDOW_") == 0)
{
}
else if (currentHeader != "VOLUME_" && name.indexOf("VOLUME_") == 0)
{
}
else if (currentHeader != "DEBUG_" && name.indexOf("DEBUG_") == 0)
{
}


for (i in 0...COLUMNS)

}

{
}
else

controlGrid.onChange.add(function(selected)
{




{
{
}
else if (canExit)
{
}
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
}
case Gamepad(id):
{
}
}

}

function createPopup():Void
{
}

function goToDeviceList():Void
{
}

function selectDevice(device:Device):Void
{

for (item in controlGrid.members)

{
}
else
{
}

}


override function update(elapsed:Float):Void
{


{
switch (currentDevice)
{
case Keys:
{


{
{
}
else if (key == BACKSPACE)
{
}
else
{
}
}
}
case Gamepad(id):
{
{
}

{
{
}
else if (key == BACKSPACE)
{
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
}
}
case Gamepad(id):
{
{
}
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
}
}
}
}



{
{

}
}
else
{
{

}
}

}

function closePrompt()
{
}

function closePopup()
{
}

override function destroy()
{


}

override function set_enabled(value:Bool)
{
{
}
else
{
}
}
}

class InputItem extends TextMenuItem
{

public function new(x = 0.0, y = 0.0, device, control, index, ?callback)
{


}

public function updateDevice(device:Device)
{
{
}
}

function getInput()
{
{

}

}

public function getLabel(input:Int)
{
}
}
