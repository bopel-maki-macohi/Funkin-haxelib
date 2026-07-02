

class SpeakerRegistry extends BaseRegistry<Speaker, SpeakerData, SpeakerEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the speaker data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateSpeakerData()` function.
*/


public function new()
{
}
}

typedef SpeakerEntryParams =
{
}
