package funkin.save;


class SaveProperty<T>
{



function get_value():T
{
}

function set_value(newValue:T):T
{

{
else
_value = newValue;


onChange.dispatch(newValue);
}

}

public function new(initialValue:T, ?getter:Void->T, ?setter:T->Void, autoFlush:Bool = true)
{
_value = initialValue;
_getter = getter;
_setter = setter;
_autoFlush = autoFlush;
onChange = new FlxTypedSignal<T->Void>();
}

public function bind(callback:T->Void, fireImmediately:Bool = true):Void
{
onChange.add(callback);
}

public function bindOnce(callback:T->Void, fireImmediately:Bool = true):Void
{
onChange.addOnce(callback);
}

public function unbind(callback:T->Void):Void
{
onChange.remove(callback);
}

public function unbindAll():Void
{
onChange.removeAll();
}

public function destroy():Void
{
onChange.destroy();
_getter = null;
_setter = null;
}

public function equals(other:T):Bool
{
}

public function notEquals(other:T):Bool
{
}

public function toString():String
{
}
}
