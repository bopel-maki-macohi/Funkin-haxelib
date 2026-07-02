package funkin.data.freeplay.player;


class PlayerRegistry extends BaseRegistry<PlayableCharacter, PlayerData, PlayerEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the stage data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migratePlayerData()` function.
*/
public static final PLAYER_DATA_VERSION:thx.semver.Version = "1.0.0";

public static final PLAYER_DATA_VERSION_RULE:thx.semver.VersionRule = "1.0.x";

/**
* A mapping between stage character IDs and Freeplay playable character IDs.
*/

public function new()
{
super('PLAYER', 'players', PLAYER_DATA_VERSION_RULE);
}

public override function loadEntries():Void
{
super.loadEntries();

for (playerId in listEntryIds())
{

for (characterId in currentPlayerCharIds)
{
ownedCharacterIds.set(characterId, playerId);
}
}

log('Loaded ${countEntries()} playable characters with ${ownedCharacterIds.size()} associations.');
}

public function countUnlockedCharacters():Int
{

for (charId in listEntryIds())
{

count++;
}

}

public function hasNewCharacter():Bool
{

for (charId in listEntryIds())
{


}

}

public function listNewCharacters():Array<String>
{

for (charId in listEntryIds())
{


result.push(charId);
}

}

/**
* Get the playable character associated with a given stage character.
* @param characterId The stage character ID.
* @return The playable character.
*/
public function getCharacterOwnerId(characterId:Null<String>):Null<String>
{
}

/**
* Return true if the given stage character is associated with a specific playable character.
* If so, the level should only appear if that character is selected in Freeplay.
* NOTE: This is NOT THE SAME as `player.isUnlocked()`!
* @param characterId The stage character ID.
* @return Whether the character is owned by any one character.
*/
public function isCharacterOwned(characterId:String):Bool
{
}

/**
* @param characterId The character ID to check.
* @return Whether the player saw the character unlock animation in Character Select.
*/
public function isCharacterSeen(characterId:String):Bool
{
}
}

typedef PlayerEntryParams =
{
}
