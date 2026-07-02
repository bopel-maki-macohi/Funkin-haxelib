package funkin.util.plugins;


/**
* A plugin which adds functionality to press `F5` to reload all game assets, then reload the current state.
* This is useful for hot reloading assets during development.
*/
class ReloadAssetsDebugPlugin extends FlxBasic
{
public function new()
{
super();

CallbackUtil.onActivityResult.add(onActivityResult);
}

public static function initialize():Void
{
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
reload();
}
}

public override function destroy():Void
{
super.destroy();

{
CallbackUtil.onActivityResult.remove(onActivityResult);
}
}


function reload():Void
{
{
path = s._asc.fullyQualifiedName;
}

else
{
funkin.modding.PolymodHandler.forceReloadAssets();

{
}

}
}

function onActivityResult(requestCode:Int, resultCode:Int):Void
{
{
reload();
}
}
}
