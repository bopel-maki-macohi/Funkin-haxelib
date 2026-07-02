package funkin.ui;


class TextMenuList extends MenuTypedList<TextMenuItem>
{
public function new(navControls:NavControls = Vertical, ?wrapMode)
{
super(navControls, wrapMode);
}

public function createItem(x = 0.0, y = 0.0, name:String, font:AtlasFont = BOLD, ?callback:Void->Void, fireInstantly = false,
available:Bool = true):TextMenuItem
{
item.fireInstantly = fireInstantly;

}
}

class TextMenuItem extends TextTypedMenuItem<AtlasText>
{

public function new(x = 0.0, y = 0.0, name:String, font:AtlasFont = BOLD, ?callback:Void->Void, available:Bool = true)
{
atlasText = new AtlasText(0, 0, name, font);
super(x, y, atlasText, name, callback, available);
setEmptyBackground();
}
}

class TextTypedMenuItem<T:AtlasText> extends MenuTypedItem<T>
{
public function new(x = 0.0, y = 0.0, label:T, name:String, ?callback:Void->Void, available:Bool = true)
{
super(x, y, label, name, callback, available);
}

override function setItem(name:String, ?callback:Void->Void)
{
{
label.text = name;
label.alpha = alpha;
width = label.width;
height = label.height;
}

super.setItem(name, callback);
}

override function set_label(value:T):T
{
super.set_label(value);
setItem(name, callback);
}
}
