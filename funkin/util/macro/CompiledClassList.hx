package funkin.util.macro;


using funkin.util.AnsiUtil;

/**
* A complement to `ClassMacro`. See `ClassMacro` for more information.
*/
class CompiledClassList
{

/**
* Class lists are injected into this class's metadata during the typing phase.
* This function extracts the metadata, at runtime, and stores it in `classLists`.
*/
static function init():Void
{
initialized = true;


{
for (list in metaData.classLists)
{


for (i in 1...data.length)
{
classes.push(classType);
}

classLists.set(id, classes);
}
}
else
{
throw "Class lists not properly generated. Try cleaning out your export folder, restarting your IDE, and rebuilding your project.";
}
}

public static function get(request:String):List<Class<Dynamic>>
{

{
classLists.set(request, new List()); // Make the error only appear once.
}

}

public static inline function getTyped<T>(request:String, type:Class<T>):List<Class<T>>
{
}
}
