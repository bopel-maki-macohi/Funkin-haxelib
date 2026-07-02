package funkin.save;


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
legacySave.bind(Constants.SAVE_NAME_LEGACY, Constants.SAVE_PATH_LEGACY);

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

targetSaveData.bind(Constants.SAVE_NAME + slot, Constants.SAVE_PATH);
{
slot++;
targetSaveData.bind(Constants.SAVE_NAME + slot, Constants.SAVE_PATH);
}

targetSaveData.mergeData(data, true);

}
}
