

class FreeplayStyleRegistry extends BaseRegistry<FreeplayStyle, FreeplayStyleData, FreeplayStyleEntryParams> implements ISingleton
implements DefaultRegistryImpl
{
/**
* The current version string for the style data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStyleData()` function.
*/


public function new()
{
}
}

typedef FreeplayStyleEntryParams =
{
}
