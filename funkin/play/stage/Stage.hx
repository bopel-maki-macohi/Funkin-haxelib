


/**
* A Stage is a group of objects rendered in the PlayState.
*
* A Stage is comprised of one or more props, each of which is an FlxSprite.
*/
class Stage extends FlxSpriteGroup implements IPlayStateScriptedClass implements IRegistryEntry<StageData>
{

function get_stageName():String
{
}


function get_camZoom():Float
{
}


/**
* The texture that has the mask information. Used for shader effects.
*/


/**
* The Stage elements get initialized at the beginning of the game.
* They're used to cache the data needed to build the stage,
* then accessed and fleshed out when the stage needs to be built.
*
* @param id
*/
public function new(id:String, ?params:Dynamic)
{


{
}
}

/**
* Called when the player is moving into the PlayState where the song will be played.
*/
public function onCreate(event:ScriptEvent):Void
{


}

public function resetStage():Void
{
{

}
else
{
}
{

}
{

}

for (dataProp in _data.props)
{

{

{
}
}
}

}

/**
* The default stage construction routine. Called when the stage is going to be played in.
* Instantiates each prop and adds it to the stage, while setting its parameters.
*/
function buildStage():Void
{


for (dataProp in _data.props)
{


{
}
else
{
}

{
switch (dataProp.animType)
{
case 'packer':
case 'animateatlas':
default: // 'sparrow'
}
}
else if (isSolidColor)
{
switch (dataProp.scale)
{
case Left(value):

case Right(values):
}
}
else
{

}

{
}

{
switch (dataProp.scale)
{
case Left(value):

case Right(values):
}
}









switch (dataProp.animType)
{
case 'packer':
for (propAnim in dataProp.animations)
{

{
}
}
case 'animateatlas':
default: // 'sparrow'
{
for (propAnim in dataProp.animations)
{
}
}
}

{
for (propAnim in dataProp.animations)
{
}

{
}
}

{
}

{
}
else if (Std.isOfType(propSprite, Bopper))
{
}
else
{
}
}
}

/**
* Add a sprite to the stage.
* @param prop The sprite to add.
* @param name (Optional) A unique name for the sprite.
*   You can call `getNamedProp(name)` to retrieve it later.
*/
public function addProp(prop:StageProp, ?name:String = null):Void
{
{
}
}

/**
* Add a sprite to the stage which animates to the beat of the song.
*/
public function addBopper(bopper:Bopper, ?name:String = null):Void
{
}

/**
* Refreshes the stage, by redoing the render order of all props.
* It does this based on the `zIndex` of each prop.
*/
public function refresh():Void
{
}

/**
* Sets a shader for each prop in the stage
* @param shader The shader to apply to each prop
*/
public function setShader(shader:FlxShader):Void
{
forEachAlive(function(prop:FlxSprite)
{
}

/**
* Adjusts the position and other properties of the soon-to-be child of this sprite group.
* Private helper to avoid duplicate code in `add()` and `insert()`.
*
* @param	Sprite	The sprite or sprite group that is about to be added or inserted into the group.
*/
override function preAdd(Sprite:FlxSprite):Void
{
sprite.cameras = _cameras; // _cameras instead of cameras because get_cameras() will not return null

}


/**
* Used by the PlayState to add a character to the stage.
*/
public function addCharacter(character:BaseCharacter, charType:CharacterType):Void
{


switch (charType)
{
case BF:
case GF:
case DAD:
default:
}


{


character.setScale(finalScale); // Don't use scale.set for characters!





{
}
}




}

/**
* Get the position of the girlfriend character, as defined in the stage data.
* @return An FlxPoint position.
*/
public inline function getGirlfriendPosition():FlxPoint
{
}

/**
* Get the position of the boyfriend character, as defined in the stage data.
* @return An FlxPoint position.
*/
public inline function getBoyfriendPosition():FlxPoint
{
}

/**
* Get the position of the dad character, as defined in the stage data.
* @return An FlxPoint position.
*/
public inline function getDadPosition():FlxPoint
{
}

/**
* Retrieves a given character from the stage.
*/
public function getCharacter(id:String):BaseCharacter
{
}

/**
* Retrieve the Boyfriend character.
* @param pop If true, the character will be removed from the stage as well.
* @return The Boyfriend character.
*/
public function getBoyfriend(pop:Bool = false):BaseCharacter
{
{


}
else
{
}
}

/**
* Retrieve the player/Boyfriend character.
* @param pop If true, the character will be removed from the stage as well.
* @return The player/Boyfriend character.
*/
public function getPlayer(pop:Bool = false):BaseCharacter
{
}

/**
* Retrieve the Girlfriend character.
* @param pop If true, the character will be removed from the stage as well.
* @return The Girlfriend character.
*/
public function getGirlfriend(pop:Bool = false):BaseCharacter
{
{


}
else
{
}
}

/**
* Retrieve the Dad character.
* @param pop If true, the character will be removed from the stage as well.
* @return The Dad character.
*/
public function getDad(pop:Bool = false):BaseCharacter
{
{


}
else
{
}
}

/**
* Retrieve the opponent/Dad character.
* @param pop If true, the character will be removed from the stage as well.
* @return The opponent character.
*/
public function getOpponent(pop:Bool = false):BaseCharacter
{
}

/**
* Retrieve a specific prop by the name assigned in the JSON file.
* @param name The name of the prop to retrieve.
* @return The corresponding FlxSprite.
*/
public function getNamedProp(name:String):StageProp
{
}

/**
* Pause the animations of ALL sprites in this group.
*/
public function pause():Void
{
forEachAlive(function(prop:FlxSprite)
{
}

/**
* Resume the animations of ALL sprites in this group.
*/
public function resume():Void
{
forEachAlive(function(prop:FlxSprite)
{
}

/**
* Retrieve a list of all the asset paths required to load the stage.
* Override this in a scripted class to ensure that all necessary assets are loaded!
*
* @return An array of file names.
*/
public function fetchAssetPaths():Array<String>
{
for (dataProp in _data.props)
{
}
}

/**
* Dispatch an event to all the characters in the stage.
* @param event The script event to dispatch.
*/
public function dispatchToCharacters(event:ScriptEvent):Void
{


{
}

{
}

{
}

for (characterId in charList)
{
}
}

/**
* Dispatch an event to a specific character.
* @param characterId The ID of the character to dispatch to.
* @param event The script event to dispatch.
*/
public function dispatchToCharacter(characterId:String, event:ScriptEvent):Void
{
{
}
}

/**
* onDestroy gets called when the player is leaving the PlayState,
* and is used to clean up any objects that need to be destroyed.
*/
public function onDestroy(event:ScriptEvent):Void
{

for (prop in this.namedProps)
{
{
}
}

for (char in this.characters)
{
{
}
}

for (bopper in boppers)
{
{
}
}

{
for (sprite in this.group)
{
{
}
}
}

{
}
else
{
}

{
}
}

/**
* A function that gets called once per step in the song.
* @param curStep The current step number.
*/
public function onStepHit(event:SongTimeScriptEvent):Void
{
}

/**
* A function that gets called once per beat in the song (once every four steps).
* @param curStep The current beat number.
*/
public function onBeatHit(event:SongTimeScriptEvent):Void
{
}

public function onUpdate(event:UpdateScriptEvent)
{
}

public override function kill()
{
}

public override function remove(Sprite:FlxSprite, Splice:Bool = false):FlxSprite
{

}

override function draw():Void
{
{
}
{
}
}

/**
* Called when the frame buffer manager is ready.
* Create frame buffers inside this method.
*/
function setupFrameBuffers():Void
{
}

/**
* Called when all the frame buffers are updated. If you need any
* frame buffers before `grabScreen()`, make sure you
* grab the screen inside this method since it immediately uses the
* frame buffers.
*/
function frameBuffersUpdated():Void
{
}

public function onScriptEvent(event:ScriptEvent)
{
for (bopper in boppers)
{
}
}

public function onPause(event:PauseScriptEvent)
{
}

public function onResume(event:ScriptEvent)
{
}

public function onSongStart(event:ScriptEvent)
{
}

public function onSongEnd(event:ScriptEvent)
{
}

public function onGameOver(event:ScriptEvent)
{
}

public function onCountdownStart(event:CountdownScriptEvent)
{
}

public function onCountdownStep(event:CountdownScriptEvent)
{
}

public function onCountdownEnd(event:CountdownScriptEvent)
{
}

public function onNoteIncoming(event:NoteScriptEvent)
{
}

public function onNoteHit(event:HitNoteScriptEvent)
{
}

public function onNoteMiss(event:NoteScriptEvent)
{
}

public function onNoteHoldDrop(event:HoldNoteScriptEvent)
{
}

public function onSongEvent(event:SongEventScriptEvent)
{
}

public function onNoteGhostMiss(event:GhostMissNoteScriptEvent)
{
}

public function onSongLoaded(event:SongLoadScriptEvent)
{
}

public function onSongRetry(event:SongRetryEvent)
{
}

static function log(message:String):Void
{
}
}
