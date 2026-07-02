package funkin.play.notes;


/**
* The direction of a note.
* This has implicit casting set up, so you can use this as an integer.
*/
enum abstract NoteDirection(Int) from Int to Int
{

public static function fromInt(value:Int):NoteDirection
{
{
case 0: LEFT;
case 1: DOWN;
case 2: UP;
case 3: RIGHT;
default: LEFT;
}
}

function get_name():String
{
{
case LEFT:
'left';
case DOWN:
'down';
case UP:
'up';
case RIGHT:
'right';
default:
'unknown';
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
'purple';
case DOWN:
'blue';
case UP:
'green';
case RIGHT:
'red';
default:
'unknown';
}
}

public function toString():String
{
}
}
