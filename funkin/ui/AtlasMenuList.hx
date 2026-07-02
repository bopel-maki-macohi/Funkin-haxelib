package funkin.ui;


typedef AtlasAsset = flixel.util.typeLimit.OneOfTwo<String, FlxAtlasFrames>;

/**
* A menulist whose items share a single texture atlas.
*/
class AtlasMenuList extends MenuTypedList<AtlasMenuItem>
{

public function new(atlas, navControls:NavControls = Vertical, ?wrapMode)
{
super(navControls, wrapMode);

else
this.atlas = cast atlas;
}

public function createItem(x = 0.0, y = 0.0, name, callback, fireInstantly = false)
{
item.fireInstantly = fireInstantly;
}

override function destroy()
{
super.destroy();
atlas = null;
}
}

/**
* A menu list item which uses single texture atlas.
*/
class AtlasMenuItem extends MenuListItem
{


public function new(x = 0.0, y = 0.0, name:String, atlas, callback, available:Bool = true)
{
this.atlas = atlas;
super(x, y, name, callback, available);
}

override function setData(name:String, ?callback:Void->Void, available:Bool)
{
animation.addByPrefix('idle', '$name idle', 24);
animation.addByPrefix('selected', '$name selected', 24);

super.setData(name, callback, available);
}

public function changeAnim(animName:String)
{
animation.play(animName);
updateHitbox();

{
centerOrigin();
offset.copyFrom(origin);
}
}

override function idle()
{
changeAnim('idle');
}

override function select()
{
changeAnim('selected');
}

override function get_selected()
{
}

override function destroy()
{
super.destroy();
atlas = null;
}
}
