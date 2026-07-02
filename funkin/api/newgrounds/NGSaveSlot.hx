

class NGSaveSlot
{

static function get_instance():NGSaveSlot
{
{
}
}

public static function loadInstance():NGSaveSlot
{

}

static function loadSlot(slot:Int):NGSaveSlot
{


}


public function new(?ngSaveSlot:Null<SaveSlot>)
{
}

/**
* Saves `data` to the newgrounds save slot.
* @param data The raw save data.
*/
public function save(data:RawSaveData):Void
{

try
{
ngSaveSlot?.save(encodedData, function(outcome:Outcome<CallError>)
{
switch (outcome)
{
case SUCCESS:
case FAIL(error):
}
}
catch (error:String)
{
}
}

public function load(?onComplete:Null<Dynamic->Void>, ?onError:Null<CallError->Void>):Void
{
try
{
ngSaveSlot?.load(function(outcome:SaveSlotOutcome):Void
{
switch (outcome)
{
case SUCCESS(value):

{
}
case FAIL(error):

{
}
}
}
catch (error:String)
{

{
}
}
}

public function clear():Void
{
try
{
ngSaveSlot?.clear(function(outcome:Outcome<CallError>)
{
switch (outcome)
{
case SUCCESS:
case FAIL(error):
}
}
catch (error:String)
{
}
}

public function checkSlot():Void
{

}
}
