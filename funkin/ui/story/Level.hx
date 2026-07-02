package funkin.ui.story;


/**
* An object used to retrieve data about a story mode level (also known as "weeks").
* Can be scripted to override each function, for custom behavior.
*/
class Level implements IRegistryEntry<LevelData>
{
/**
* @param id The ID of the JSON file to parse.
*/
public function new(id:String, ?params:Dynamic)
{
this.id = id;
_data = _fetchData(id);

{
throw 'Could not parse level data for id: $id';
}
}

/**
* Get the list of songs in this level, as an array of IDs.
* @return Array<String>
*/
public function getSongs():Array<String>
{
}

/**
* Retrieve the title of the level for display on the menu.
* @return Title of the level as a string
*/
public function getTitle():String
{
}

/**
* Retrieve the title of the level for display on a capsule.
* @return Title of the capsule as a string
*/
public function getCapsuleTitle():String
{
}

public function getCapsuleTitleOffsets():Array<Float>
{
}

/**
* Construct the title graphic for the level.
* @return The constructed graphic as a sprite.
*/
public function buildTitleGraphic():FlxSprite
{

}

/**
* Get the list of songs in this level, as an array of names, for display on the menu.
* @param difficulty The difficulty of the level being displayed
* @return The display names of the songs in this level
*/
public function getSongDisplayNames(difficulty:String):Array<String>
{
{
});
}

static function getSongDisplayName(songId:String, difficulty:String):String
{

}

/**
* Whether this level is unlocked. If not, it will be greyed out on the menu and have a lock icon.
* Override this in a script.
* @default `true`
* @return Whether this level is unlocked
*/
public function isUnlocked():Bool
{
}

/**
* Whether this level is visible. If not, it will not be shown on the menu at all.
* Override this in a script.
* @default `true`
* @return Whether this level is visible in the menu
*/
public function isVisible():Bool
{
}

/**
* Build a sprite for the background of the level.
* Can be overriden by ScriptedLevel. Not used if `isBackgroundSimple` returns true.
* @return The constructed sprite
*/
public function buildBackground():FlxSprite
{
{
}

result.color = getBackgroundColor();
}

/**
* Returns true if the background is a solid color.
* If you have a ScriptedLevel with a fancy background, you may want to override this to false.
* @return Whether the background is a simple color
*/
public function isBackgroundSimple():Bool
{
}

/**
* Returns true if the background is a solid color.
* If you have a ScriptedLevel with a fancy background, you may want to override this to false.
* @return The background as a simple color. May not be valid if `isBackgroundSimple` returns false.
*/
public function getBackgroundColor():FlxColor
{
}

/**
* The list of difficulties the player can select from for this level.
* @return The difficulty IDs.
*/
public function getDifficulties():Array<String>
{



{
for (difficulty in firstSong.listDifficulties([Constants.DEFAULT_VARIATION, 'erect'], false, false))
{
difficulties.push(difficulty);
}
}

difficulties.sort(SortUtil.defaultsThenAlphabetically.bind(Constants.DEFAULT_DIFFICULTY_LIST));

for (songIndex in 1...songList.length)
{


for (difficulty in difficulties.copy())
{
{
difficulties.remove(difficulty);
}
}
}


}

/**
* Build the props for display over the colored background.
* @param existingProps The existing prop sprites, if any.
* @return The constructed prop sprites
*/
public function buildProps(?existingProps:Array<LevelProp>):Array<LevelProp>
{


{
for (i in _data.props.length...props.length)
{
props[i].visible = false;
}
}

for (propIndex in 0..._data.props.length)
{

{
existingProp.propData = propData;
{
existingProp.visible = false;
}
else
{
existingProp.visible = true;
existingProp.x = propData.offsets[0] + FlxG.width * 0.25 * propIndex;
}
}
else
{

propSprite.x = propData.offsets[0] + FlxG.width * 0.25 * propIndex;
props.push(propSprite);
}
}

}
}
