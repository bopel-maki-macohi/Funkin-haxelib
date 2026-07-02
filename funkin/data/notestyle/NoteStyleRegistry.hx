

class NoteStyleRegistry extends BaseRegistry<NoteStyle, NoteStyleData, NoteStyleEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the note style data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateNoteStyleData()` function.
*/


public function new()
{
}

public function fetchDefault():NoteStyle
{
}
}

typedef NoteStyleEntryParams =
{
}
