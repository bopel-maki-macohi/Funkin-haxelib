

/**
* A bit more of the backend and nitty gritty of FNF's save system
*/
class SaveSystem
{
public function new():Void
{
}

/**
* Call this to make sure the save data is written to disk.
*/
public function flush():Void
{
}

public function clearSlot(slot:Int):Save
{



}

public function fetchLegacySaveData():Option<RawSaveData_v1_0_0>
{

{
}
else
{
}
}

public function archiveBadSaveData(data:Dynamic):Int
{
}

function writeToAvailableSlot(slot:Int, data:Dynamic):Int
{

{
}


}
}
