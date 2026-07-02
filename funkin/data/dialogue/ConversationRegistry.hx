

class ConversationRegistry extends BaseRegistry<Conversation, ConversationData, ConversationEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the dialogue box data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateConversationData()` function.
*/


public function new()
{
}
}

typedef ConversationEntryParams =
{
}
