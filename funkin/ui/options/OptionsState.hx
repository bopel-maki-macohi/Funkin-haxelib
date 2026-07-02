

/**
* The main options menu
* It mainly is controlled via the "optionsCodex" object,
* which handles paging and going to the different submenus
*/
class OptionsState extends MusicBeatState
{
/**
* Instance of the OptionsState
*/




override function create():Void
{
instance = this;







{
}
else
{
}

}

function exitOffsets():Void
{
{
}
{
FunkinSound.playMusic('freakyMenu', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,
persist: true
}

function exitControls():Void
{

}

function exitToMainMenu()
{
}
}

/**
* Our default Page when we enter the OptionsState, a bit of the root
*/
class OptionsMenu extends Page<OptionsMenuPageName>
{


/**
* Camera focus point
*/


public function new()
{

createItem("LAG ADJUSTMENT", function()
{
{
FunkinSound.playMusic('offsetsLoop', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,
loop: true
OptionsState.instance.drumsBG.play(true);

createItem("RESTORE PURCHASES", function()
{
createItem("OPEN DATA FOLDER", function()
{
{
createItem("LOGOUT OF NG", function()
{
NewgroundsClient.instance.logout(function()
{
}, function()
{
}
else
{
createItem("LOGIN TO NG", function()
{
NewgroundsClient.instance.login(function()
{
}, function()
{
}





}

public function addSaveDataOptionsItem(saveDataMenu:SaveDataMenu):Void
{
{
createItem("SAVE DATA OPTIONS", function()
{
}
else
{
}
}

public function addExitItem():Void
{
backButton.onConfirmStart.add(function()
{
}

function onMenuChange(selected:TextMenuItem):Void
{
}

function createItem(name:String, callback:Void->Void, fireInstantly = false):TextMenuItem
{
}

override function update(elapsed:Float):Void
{
{
}

}

override function set_enabled(value:Bool):Bool
{
}

/**
* True if this page has multiple options, excluding the exit option.
* If false, there's no reason to ever show this page.
*/
public function hasMultipleOptions():Bool
{
}
}

enum abstract OptionsMenuPageName(String) to PageName
{
}
