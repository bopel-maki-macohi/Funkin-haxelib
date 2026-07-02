

class TextMenuList extends MenuTypedList<TextMenuItem>
{
public function new(navControls:NavControls = Vertical, ?wrapMode)
{
}

public function createItem(x = 0.0, y = 0.0, name:String, font:AtlasFont = BOLD, ?callback:Void->Void, fireInstantly = false,
available:Bool = true):TextMenuItem
{

}
}

class TextMenuItem extends TextTypedMenuItem<AtlasText>
{

public function new(x = 0.0, y = 0.0, name:String, font:AtlasFont = BOLD, ?callback:Void->Void, available:Bool = true)
{
}
}

class TextTypedMenuItem<T:AtlasText> extends MenuTypedItem<T>
{
public function new(x = 0.0, y = 0.0, label:T, name:String, ?callback:Void->Void, available:Bool = true)
{
}

override function setItem(name:String, ?callback:Void->Void)
{
{
}

}

override function set_label(value:T):T
{
}
}
