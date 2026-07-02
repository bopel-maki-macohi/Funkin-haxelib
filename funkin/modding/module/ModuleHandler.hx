package funkin.modding.module;


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
clearModuleCache();

for (moduleCls in scriptedModuleClassNames)
{
{

addToModuleCache(module);
}
else
{
}
}
reorderModuleCache();

}

public static function buildModuleCallbacks():Void
{
}

static function onStateSwitchComplete():Void
{
callEvent(new StateChangeScriptEvent(STATE_CHANGE_END, FlxG.state, true));
}

static function addToModuleCache(module:Module):Void
{
moduleCache.set(module.moduleId, module);
}

static function reorderModuleCache():Void
{
modulePriorityOrder = moduleCache.keys().array();

modulePriorityOrder.sort(sortByPriority);
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
module.active = true;
}
}

public static function deactivateModule(moduleId:String):Void
{
{
module.active = false;
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
ScriptEventDispatcher.callEvent(value, event);
}

moduleCache.clear();
modulePriorityOrder = [];
}
}

public static function callEvent(event:ScriptEvent):Void
{
for (moduleId in modulePriorityOrder)
{
{
{
{
continue;
}
}
ScriptEventDispatcher.callEvent(module, event);
}
}
}

public static inline function callOnCreate():Void
{
callEvent(new ScriptEvent(CREATE, false));
}
}
