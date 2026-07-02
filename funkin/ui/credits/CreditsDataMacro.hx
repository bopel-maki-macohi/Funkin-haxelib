package funkin.ui.credits;


using funkin.util.AnsiUtil;

class CreditsDataMacro
{
public static macro function loadCreditsData():haxe.macro.Expr.ExprOf<CreditsData>
{

{
Context.info(' WARNING '.warning() + ' Could not fetch JSON data for credits.', Context.currentPos());
}


{
Context.info(' WARNING '.warning() + ' Could not parse JSON data for credits.', Context.currentPos());
}

CreditsDataHandler.debugPrint(creditsData);
}

static function fetchJSON():Null<String>
{


}

/**
* Parse the JSON data for the credits.
*
* @param json The string data to parse.
* @return The parsed data.
*/
static function parseJSON(json:String):Null<CreditsData>
{
try
{
}
catch (e)
{
}
}
}
