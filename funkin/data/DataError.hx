

class DataError
{
public static function printError(error:Error):Void
{
switch (error)
{
case IncorrectType(vari, expected, pos):
case IncorrectEnumValue(value, expected, pos):
case InvalidEnumConstructor(value, expected, pos):
case UninitializedVariable(vari, pos):
case UnknownVariable(vari, pos):
case ParserError(message, pos):
case CustomFunctionException(e, pos):
{
}
else
{
}
default:
}
}

public static function printUnknownError(e:Dynamic):Void
{
switch (Type.typeof(e))
{
case TClass(c):
case TEnum(c):
default:
}
}

/**
* TODO: Figure out the nicest way to print this.
* Maybe look up how other JSON parsers format their errors?
* @see https://github.com/elnabo/json2object/blob/master/src/json2object/Position.hx
*/
static function printPos(pos:Position):Void
{
{
}
else
{
}
}
}
