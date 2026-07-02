package funkin.data;

/**
* An interface defining the necessary functions for a registry entry.
* A `String->Void` constructor is also mandatory, but enforced elsewhere.
* @param T The JSON data type of the registry entry.
*/
interface IRegistryEntry<T>
{
public final id:String;

public function destroy():Void;
public function toString():String;

public final _data:T;
}
