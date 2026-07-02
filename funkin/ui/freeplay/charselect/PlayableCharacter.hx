package funkin.ui.freeplay.charselect;


/**
* An object used to retrieve data about a playable character (also known as "weeks").
* Can be scripted to override each function, for custom behavior.
*/
class PlayableCharacter implements IRegistryEntry<PlayerData>
{
/**
* @param id The ID of the JSON file to parse.
*/
public function new(id:String, ?params:Dynamic)
{
this.id = id;
_data = _fetchData(id);

{
throw 'Could not parse playable character data for id: $id';
}
}

/**
* Retrieve the readable name of the playable character.
*/
public function getName():String
{
}

/**
* Retrieve the list of stage character IDs associated with this playable character.
* @return The list of associated character IDs
*/
public function getOwnedCharacterIds():Array<String>
{
}

/**
* Return `true` if, when this character is selected in Freeplay,
* songs unassociated with a specific character should appear.
*/
public function shouldShowUnownedChars():Bool
{
}

public function shouldShowCharacter(id:String):Bool
{
{
}

{
}

}

public function getStickerPackID():String
{
}

public function getFreeplayStyleID():String
{
}

public function getFreeplayDJData():Null<PlayerFreeplayDJData>
{
}

public function getFreeplayDJText(index:Int):String
{
}

public function getCharSelectData():Null<PlayerCharSelectData>
{
}

/**
* @param rank Which rank to get info for
* @return An array of animations. For example, BF Great has two animations, one for BF and one for GF
*/
public function getResultsAnimationDatas(rank:ScoringRank):Array<PlayerResultsAnimationData>
{
{
}

switch (rank)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
}
}

public function getResultsMusicPath(rank:ScoringRank):String
{
switch (rank)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

/**
* Returns whether this character is unlocked.
*/
public function isUnlocked():Bool
{
}
}
