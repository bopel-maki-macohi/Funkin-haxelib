

/**
* A page in a menu system.
*
* You can use it on it's own, or handle it with a `Codex`
*/
class Page<T:PageName> extends FlxGroup
{






inline function switchPage(name:T)
{
}

function exit()
{
}

override function update(elapsed:Float)
{

}

function updateEnabled(elapsed:Float)
{
{
}
}

function set_enabled(value:Bool)
{
}

function openPrompt(prompt:Prompt, onClose:Void->Void)
{
prompt.closeCallback = function()
{
}

}

override function destroy()
{
}
}

/**
* For you to fill in your own page name stuff, see OptionsState.hx and it's OptionsMenuPageName
*/
enum abstract PageName(String) from String to String
{
}
