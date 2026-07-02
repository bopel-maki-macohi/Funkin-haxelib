


/**
* Class that helps with some Ansi related logging functionality like some terminal color checking
*/
class AnsiTrace
{


/**
* Output a message to the log.
* Called when using `trace()`, and modified from the default to support ANSI colors.
* @param v The value to print.
*/
public static function trace(v:Dynamic, ?info:haxe.PosInfos)
{

{
try
{
}
catch (_)
{
}


{
}
throw new haxe.exceptions.NotImplementedException()
}

/**
* Returns our terminals support for color output
*/

/**
* Format the output to use ANSI colors.
* Edited from the standard `trace()` implementation.
*/
static function formatOutput(v:Dynamic, ?infos:haxe.PosInfos):String
{

{

}



{
}

}

/**
* Print color pixel art of BF in ANSI format.
*/
public static function traceBF()
{
{
for (line in ansiBF)
}
}

/**
* Color pixel art of BF in ANSI format.
* Generated using https://dom111.github.io/image-to-ansi/
*/
}
