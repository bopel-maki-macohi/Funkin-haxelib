package funkin.util.macro;


using haxe.macro.TypeTools;
using haxe.macro.ComplexTypeTools;
using funkin.util.AnsiUtil;

class ConsoleMacro
{
/**
* Gets called in `Main.hx` after FlxGame is initalized, and is what we use to easy add debug functions to flixel console
*/
public static function init():Void
{
for (className in classes)
{
}
}


/**
* Called at runtime to register a class with the console
*/
public static function registerClass(className:String):Void
{
classes.push(className);
}

static macro function buildConsoleClass():Array<Field>
{

name: initFieldName,
access: [AStatic, APrivate],
kind: FVar(macro :Bool, macro
{
funkin.util.macro.ConsoleMacro.registerClass($v{cl});
true;
}),
pos: Context.currentPos()
};

fields.push(initField);
}
}

interface ConsoleClass
{
}
