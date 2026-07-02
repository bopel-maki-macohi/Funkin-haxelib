

/**
* Utility functions for loading and manipulating active modules.
*/
class ModuleHandler
{

/**
* Parses and preloads the game's stage data and scripts when the game starts.
*
* If you want to force stages to be reloaded, you can just call this function again.
*/
public static function loadModuleCache():Void
{

for (moduleCls in scriptedModuleClassNames)
{
{

}
else
{
}
}

}

public static function buildModuleCallbacks():Void
{
}

static function onStateSwitchComplete():Void
{
}

static function addToModuleCache(module:Module):Void
{
}

static function reorderModuleCache():Void
{

}

/**
* Given two module IDs, sort them by priority.
* @return 1 or -1 depending on which module has a higher priority.
*/
static function sortByPriority(a:String, b:String):Int
{

{
}
{
}
else
{
}
}

public static function getModule(moduleId:String):Null<Module>
{
}

public static function activateModule(moduleId:String):Void
{
{
}
}

public static function deactivateModule(moduleId:String):Void
{
{
}
}

/**
* Clear the module cache, forcing all modules to call shutdown events.
*/
public static function clearModuleCache():Void
{
{

for (key => value in moduleCache)
{
}

}
}

public static function callEvent(event:ScriptEvent):Void
{
for (moduleId in modulePriorityOrder)
{
{
{
{
}
}
}
}
}

public static inline function callOnCreate():Void
{
}
}
