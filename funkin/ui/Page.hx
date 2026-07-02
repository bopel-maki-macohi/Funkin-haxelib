package funkin.ui;


/**
* A page in a menu system.
*
* You can use it on it's own, or handle it with a `Codex`
*/
class Page<T:PageName> extends FlxGroup
{




inline function get_controls() return PlayerSettings.player1.controls;


inline function switchPage(name:T)
{
onSwitch.dispatch(name);
}

function exit()
{
onExit.dispatch();
}

override function update(elapsed:Float)
{
super.update(elapsed);

}

function updateEnabled(elapsed:Float)
{
{
exit();
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}
}

function set_enabled(value:Bool)
{
}

function openPrompt(prompt:Prompt, onClose:Void->Void)
{
enabled = false;
prompt.closeCallback = function()
{
enabled = true;
}

}

override function destroy()
{
super.destroy();
onSwitch.removeAll();
}
}

/**
* For you to fill in your own page name stuff, see OptionsState.hx and it's OptionsMenuPageName
*/
enum abstract PageName(String) from String to String
{
}
