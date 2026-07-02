package funkin.api.discord;


class DiscordClient
{


static function get_instance():DiscordClient
{
}


private function new()
{


}

public function init():Void
{

{
}

{
}

}

/**
* @returns `false` if the client ID is invalid.
*/
static function hasValidCredentials():Bool
{
}


function createDaemon():Void
{
}

function doDaemonWork():Void
{
{

}
}

public function shutdown():Void
{

}

public function setPresence(params:DiscordClientPresenceParams):Void
{








button1.label = "Play on Web";
button1.url = Constants.URL_NEWGROUNDS;

button2.label = "Download";
button2.url = Constants.URL_ITCH;

}

private static function onReady(request:cpp.RawConstPointer<DiscordUser>):Void
{


{
}
else
{
}
}

private static function onDisconnected(errorCode:Int, message:cpp.ConstCharStar):Void
{
}

private static function onError(errorCode:Int, message:cpp.ConstCharStar):Void
{
}

//
//
//
//
}

typedef DiscordClientPresenceParams =
{
/**
* The first row of text below the game title.
*/

/**
* The second row of text below the game title.
* Use `null` to display no text.
*/

/**
* A large, 4-row high image to the left of the content.
*/

/**
* A small, inset image to the bottom right of `largeImageKey`.
*/
}

class DiscordClientSandboxed
{
public static function setPresence(params:DiscordClientPresenceParams):Void
{
}

public static function shutdown():Void
{
}
}
class DiscordClientSandboxed
{
public static function setPresence(params:Dynamic):Void
{
}

public static function shutdown():Void
{
}
}
