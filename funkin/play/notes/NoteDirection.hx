

/**
* The direction of a note.
* This has implicit casting set up, so you can use this as an integer.
*/
enum abstract NoteDirection(Int) from Int to Int
{

public static function fromInt(value:Int):NoteDirection
{
{
}
}

function get_name():String
{
{
case LEFT:
case DOWN:
case UP:
case RIGHT:
default:
}
}

function get_nameUpper():String
{
}

function get_color():FlxColor
{
}

function get_colorName():String
{
{
case LEFT:
case DOWN:
case UP:
case RIGHT:
default:
}
}

public function toString():String
{
}
}
