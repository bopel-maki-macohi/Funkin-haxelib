

class StageRegistry extends BaseRegistry<Stage, StageData, StageEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the stage data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStageData()` function.
*/


public function new()
{
}
}

typedef StageEntryParams =
{
}
