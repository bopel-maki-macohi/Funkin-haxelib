


/**
* A menulist whose items share a single texture atlas.
*/
class AtlasMenuList extends MenuTypedList<AtlasMenuItem>
{

public function new(atlas, navControls:NavControls = Vertical, ?wrapMode)
{

else
}

public function createItem(x = 0.0, y = 0.0, name, callback, fireInstantly = false)
{
}

override function destroy()
{
}
}

/**
* A menu list item which uses single texture atlas.
*/
class AtlasMenuItem extends MenuListItem
{


public function new(x = 0.0, y = 0.0, name:String, atlas, callback, available:Bool = true)
{
}

override function setData(name:String, ?callback:Void->Void, available:Bool)
{

}

public function changeAnim(animName:String)
{

{
}
}

override function idle()
{
}

override function select()
{
}

override function get_selected()
{
}

override function destroy()
{
}
}
