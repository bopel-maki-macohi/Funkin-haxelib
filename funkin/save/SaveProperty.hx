

class SaveProperty<T>
{



function get_value():T
{
}

function set_value(newValue:T):T
{

{
else


}

}

public function new(initialValue:T, ?getter:Void->T, ?setter:T->Void, autoFlush:Bool = true)
{
}

public function bind(callback:T->Void, fireImmediately:Bool = true):Void
{
}

public function bindOnce(callback:T->Void, fireImmediately:Bool = true):Void
{
}

public function unbind(callback:T->Void):Void
{
}

public function unbindAll():Void
{
}

public function destroy():Void
{
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
