package funkin.ui;


class MenuTypedList<T:MenuListItem> extends FlxTypedGroup<T>
{


/** Called when a new item is highlighted */

/** Called when an item is accepted */

/** The navigation control scheme to use */

/** Set to false to disable nav control */

/**  */


/** Set to true, internally to disable controls, without affecting vars like `enabled` */


/** touchBuddy over here helps with the touch input! Because overlap for touch does not account for the graphic, only the hitbox.
* And, `FlxG.pixelPerfectOverlap` uses two FlxSprites, so we can't use the `FlxTouch` object */


/** Only used in Options, basically acts the same as OptionsState's `currentName`, it's the current name of the current page in OptionsState.
* Why is it needed? Because touch control's a bitch. Thats why. */


public function new(navControls:NavControls = Vertical, ?wrapMode:WrapMode)
{
this.navControls = navControls;

else
{
this.wrapMode = switch (navControls)
{
case Horizontal: Horizontal;
case Vertical: Vertical;
default: Both;
}
}

touchBuddy = new FlxSprite().makeGraphic(10, 10);
_isMainMenuState = Std.isOfType(FlxG.state, funkin.ui.mainmenu.MainMenuState);

super();
}

public function addItem(name:String, item:T):T
{

byName[name] = item;
}

public function resetItem(oldName:String, newName:String, ?callback:Void->Void):Null<T>
{
byName.remove(oldName);
byName[newName] = item;
item.setItem(newName, callback);

}

override function update(elapsed:Float)
{
super.update(elapsed);

}

inline function updateControls():Void
{




newIndex = switch (navControls)
{
case Vertical: navList(inputUp, inputDown, wrapY);
case Horizontal: navList(inputLeft, inputRight, wrapX);
case Both: navList(inputLeft || inputUp, inputRight || inputDown, !wrapMode.match(None));

case Columns(num): navGrid(num, inputLeft, inputRight, wrapX, inputUp, inputDown, wrapY);
case Rows(num): navGrid(num, inputUp, inputDown, wrapY, inputLeft, inputRight, wrapX);
};

{
touchBuddy.setPosition(TouchUtil.touch.x, TouchUtil.touch.y);
}

{
{
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
selectItem(newIndex);
}
}
else if (TouchUtil.pressed)
{
for (i in 0...members.length)
{



{

{
newIndex = i;
break;
}
else
{
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
selectItem(i);
}

{
{
FlxTween.cancelTweensOf(item);
item.scale.set(1.1, 1.1);
FlxTween.tween(item.scale, {x: 1, y: 1}, 0.3, {ease: FlxEase.backOut});

HapticUtil.vibrate(0, 0.05, 1);
accept();
}
else
{
FlxTween.cancelTweensOf(item);
item.scale.set(0.94, 0.94);
FlxTween.tween(item.scale, {x: 1, y: 1}, 0.3, {ease: FlxEase.backOut});

HapticUtil.vibrate(0, 0.01, 0.5);
}
}
else
{
accept();
}

break;
}
}
}

{
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
selectItem(newIndex);
}
{
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
selectItem(newIndex);
}


}

function navAxis(index:Int, size:Int, prev:Bool, next:Bool, allowWrap:Bool):Int
{

{
else if (allowWrap) index = size - 1;
}
else
{
else if (allowWrap) index = 0;
}

}

/**
* Controls navigation on a linear list of items such as Vertical.
* @param prev
* @param next
* @param allowWrap
*/
inline function navList(prev:Bool, next:Bool, allowWrap:Bool)
{
}

/**
* Controls navigation on a grid
* @param latSize   The size of the fixed axis of the grid, or the "lateral axis"
* @param latPrev   Whether the 'prev' key is pressed along the fixed-lengthed axis. eg: "left" in Column mode
* @param latNext   Whether the 'next' key is pressed along the fixed-lengthed axis. eg: "right" in Column mode
* @param prev      Whether the 'prev' key is pressed along the variable-lengthed axis. eg: "up" in Column mode
* @param next      Whether the 'next' key is pressed along the variable-lengthed axis. eg: "down" in Column mode
* @param allowWrap unused
*/
function navGrid(latSize:Int, latPrev:Bool, latNext:Bool, latAllowWrap:Bool, prev:Bool, next:Bool, allowWrap:Bool):Int
{

latIndex = navAxis(latIndex, latSize, latPrev, latNext, latAllowWrap);
index = navAxis(index, size, prev, next, allowWrap);

}

public function accept():Void
{


onAcceptPress.dispatch(menuItem);

else
{
busy = true;
FunkinSound.playOnce(Paths.sound('confirmMenu'));
FlxFlicker.flicker(menuItem, 1, 0.06, true, false, function(_)
{
busy = false;
menuItem.callback();
});
}
}

public function cancelAccept():Void
{
FlxFlicker.stopFlickering(members[selectedIndex]);
busy = false;
}

/**
* Selects an item in the list. If the item is not available, it will select the next available item.
* @param index The index of the item to select.
*/
public function selectItem(index:Int):Void
{
members[selectedIndex].idle();

{
{
selectItem(newIndex);
}
else if (index > selectedIndex)
{
selectItem(newIndex);
}
}

selectedIndex = index;

selectedMenuItem.select();
onChange.dispatch(selectedMenuItem);
}

public function has(name:String):Bool
{
}

public function getItem(name:String):Null<T>
{
}

override function destroy():Void
{
super.destroy();
byName.clear();
onChange.removeAll();
onAcceptPress.removeAll();
}

inline function get_selectedItem():T
{
}
}

class MenuListItem extends FlxSprite
{

/**
* Set to true for things like opening URLs otherwise, it may it get blocked.
*/


function get_selected() return alpha == 1.0;

public function new(x = 0.0, y = 0.0, name:String, callback, available:Bool = true)
{
super(x, y);

this.name = name;
this.callback = callback;
this.available = available;
setData(name, callback, available);
idle();
}

function setData(name:String, ?callback:Void->Void, available:Bool):Void
{
this.name = name;


this.available = available;
}

/**
* Calls setData and resets/redraws the state of the item
* @param name      the label.
* @param callback  Unchanged if null.
*/
public function setItem(name:String, ?callback:Void->Void):Void
{
setData(name, callback, available);

else
idle();
}

public function idle():Void
{
alpha = 0.6;
}

public function select():Void
{
alpha = 1.0;
}
}

class MenuTypedItem<T:FlxSprite> extends MenuListItem
{

public function new(x = 0.0, y = 0.0, label:T, name:String, callback, available:Bool = true)
{
super(x, y, name, callback, available);
this.label = label;
}

/**
* Use this when you only want to show the label
*/
public function setEmptyBackground()
{
makeGraphic(1, 1, 0x0);
width = oldWidth;
height = oldHeight;
}

function set_label(value:Null<T>):Null<T>
{
{
value.x = x;
value.y = y;
value.alpha = alpha;
}
}

override function update(elapsed:Float)
{
super.update(elapsed);
}

override function draw()
{
super.draw();
{
label.cameras = cameras;
label.scrollFactor.copyFrom(scrollFactor);
label.draw();
}
}

override function set_alpha(value:Float):Float
{
super.set_alpha(value);


}

override function set_x(value:Float):Float
{
super.set_x(value);


}

override function set_y(Value:Float):Float
{
super.set_y(Value);


}
}

enum NavControls
{
Horizontal;
Vertical;
Both;
Columns(num:Int);
Rows(num:Int);
}

enum WrapMode
{
Horizontal;
Vertical;
Both;
None;
}
