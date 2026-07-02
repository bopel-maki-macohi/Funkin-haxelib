package funkin.util.macro;


/**
* Macros to generate lists of classes at compile time.
*
* This code is a bitch glad Jason figured it out.
* Based on code from CompileTime: https://github.com/jasononeil/compiletime
*/
class ClassMacro
{
/**
* Gets a list of `Class<T>` for all classes in a specified package.
*
* Example: `var list:Array<Class<Dynamic>> = listClassesInPackage("funkin", true);`
*
* @param targetPackage A String containing the package name to query.
* @param includeSubPackages Whether to include classes located in sub-packages of the target package.
* @return A list of classes matching the specified criteria.
*/
public static macro function listClassesInPackage(targetPackage:String, includeSubPackages:Bool = true):ExprOf<Iterable<Class<Dynamic>>>
{
{
onGenerateCallbackRegistered = true;
Context.onGenerate(onGenerate);
}


classListsToGenerate.push(request);

}

/**
* Get a list of `Class<T>` for all classes extending a specified class.
*
* Example: `var list:Array<Class<FlxSprite>> = listSubclassesOf(FlxSprite);`
*
* @param targetClass The class to query for subclasses.
* @return A list of classes matching the specified criteria.
*/
public static macro function listSubclassesOf<T>(targetClassExpr:ExprOf<Class<T>>):ExprOf<List<Class<T>>>
{
{
onGenerateCallbackRegistered = true;
Context.onGenerate(onGenerate);
}



classListsToGenerate.push(request);

}

/**
* Callback executed after the typing phase but before the generation phase.
* Receives a list of `haxe.macro.Type` for all types in the program.
*
* Only metadata can be modified at this time, which makes it a BITCH to access the data at runtime.
*/
static function onGenerate(allTypes:Array<haxe.macro.Type>)
{
classListsRaw = [];

for (request in classListsToGenerate)
{
classListsRaw.set(request, []);
}

for (type in allTypes)
{
switch (type)
{
case TInst(t, _params):

{
}
else
{
for (request in classListsToGenerate)
{
{
classListsRaw.get(request).push(className);
}
}
}
default:
continue;
}
}

compileClassLists();
}

/**
* At this stage in the program, `classListsRaw` is generated, but only accessible by macros.
* To make it accessible at runtime, we must:
* - Convert the String names to actual `Class<T>` instances, and store it as `classLists`
* - Insert the `classLists` into the metadata of the `CompiledClassList` class.
* `CompiledClassList` then extracts the metadata and stores it where it can be accessed at runtime.
*/
static function compileClassLists()
{



for (request in classListsToGenerate)
{
for (i in classListsRaw.get(request))
{
classListEntries.push(macro $v{i});
}

classLists.push(macro $a{classListEntries});
}

compiledClassList.meta.add('classLists', classLists, Context.currentPos());
}

static function doesClassMatchRequest(classType:ClassType, request:String):Bool
{


switch (requestType)
{
case 'package':


{
}
else
{
}
case 'extend':


{
}
else if (MacroUtil.isSubclassOf(classType, targetClassType))
{
}


default:
throw 'Unknown request type: ${requestType}';
}
}


}
