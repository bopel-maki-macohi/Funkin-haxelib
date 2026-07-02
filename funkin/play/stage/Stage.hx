package funkin.play.stage;


typedef StagePropGroup = FlxTypedSpriteGroup<StageProp>;

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
super();

this.id = id;
_data = _fetchData(id);

{
throw 'Could not find stage data for stage id: $id';
}
}

/**
* Called when the player is moving into the PlayState where the song will be played.
*/
public function onCreate(event:ScriptEvent):Void
{
frameBufferMan = new FrameBufferManager(FlxG.camera);
setupFrameBuffers();

buildStage();
this.refresh();

debugIconGroup = new FlxSpriteGroup();
debugIconGroup.visible = false;
debugIconGroup.zIndex = 1000000;
}

public function resetStage():Void
{
{
getBoyfriend().setScale(finalScale);
getBoyfriend().resetCharacter(true);

getBoyfriend().cameraFocusPoint.x += stageCharData.cameraOffsets[0];
getBoyfriend().cameraFocusPoint.y += stageCharData.cameraOffsets[1];
}
else
{
log(' WARNING '.warning() + ' No boyfriend found while resetting stage.');
}
{
getGirlfriend().setScale(finalScale);
getGirlfriend().resetCharacter(true);

getGirlfriend().cameraFocusPoint.x += stageCharData.cameraOffsets[0];
getGirlfriend().cameraFocusPoint.y += stageCharData.cameraOffsets[1];
}
{
getDad().setScale(finalScale);
getDad().resetCharacter(true);

getDad().cameraFocusPoint.x += stageCharData.cameraOffsets[0];
getDad().cameraFocusPoint.y += stageCharData.cameraOffsets[1];
}

for (dataProp in _data.props)
{

{
prop.x = dataProp.position[0];
prop.y = dataProp.position[1];
prop.zIndex = dataProp.zIndex;

{
cast(prop, Bopper).danceEvery = dataProp.danceEvery;
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
log('Building stage "${this.id}" for display...');

this.debugIconGroup = new FlxSpriteGroup();

for (dataProp in _data.props)
{
log('Placing prop ${dataProp.name} (${dataProp.assetPath})');


{
propSprite = new Bopper(dataProp.danceEvery);
}
else
{
propSprite = new StageProp();
}

{
switch (dataProp.animType)
{
case 'packer':
propSprite.loadPacker(dataProp.assetPath);
case 'animateatlas':
propSprite.loadTextureAtlas(dataProp.assetPath, _data.directory, cast dataProp.atlasSettings);
default: // 'sparrow'
propSprite.loadSparrow(dataProp.assetPath);
}
}
else if (isSolidColor)
{
switch (dataProp.scale)
{
case Left(value):
width = Std.int(value);
height = Std.int(value);

case Right(values):
width = Std.int(values[0]);
height = Std.int(values[1]);
}
propSprite.makeSolidColor(width, height, FlxColor.fromString(dataProp.assetPath));
}
else
{
propSprite.loadTexture(dataProp.assetPath);

propSprite.active = false;
}

{
log(' ERROR '.error() + ' Could not build texture for prop. Check the asset path (${Paths.currentLevel ?? 'default'}, ${dataProp.assetPath}).');
continue;
}

{
switch (dataProp.scale)
{
case Left(value):
propSprite.scale.set(value, value);

case Right(values):
propSprite.scale.set(values[0], values[1]);
}
}
propSprite.updateHitbox();

propSprite.x = dataProp.position[0];
propSprite.y = dataProp.position[1];

propSprite.alpha = dataProp.alpha;

propSprite.antialiasing = !dataProp.isPixel;


propSprite.scrollFactor.x = dataProp.scroll[0];
propSprite.scrollFactor.y = dataProp.scroll[1];

propSprite.angle = dataProp.angle;

propSprite.zIndex = dataProp.zIndex;

propSprite.flipX = dataProp.flipX;
propSprite.flipY = dataProp.flipY;

switch (dataProp.animType)
{
case 'packer':
for (propAnim in dataProp.animations)
{
propSprite.animation.add(propAnim.name, propAnim.frameIndices);

{
cast(propSprite, Bopper).setAnimationOffsets(propAnim.name, propAnim.offsets[0], propAnim.offsets[1]);
}
}
case 'animateatlas':
FlxAnimationUtil.addTextureAtlasAnimations(propSprite, dataProp.animations);
default: // 'sparrow'
FlxAnimationUtil.addAtlasAnimations(propSprite, dataProp.animations);
{
for (propAnim in dataProp.animations)
{
cast(propSprite, Bopper).setAnimationOffsets(propAnim.name, propAnim.offsets[0], propAnim.offsets[1]);
}
}
}

{
for (propAnim in dataProp.animations)
{
cast(propSprite, Bopper).setAnimationOffsets(propAnim.name, propAnim.offsets[0], propAnim.offsets[1]);
}

{
cast(propSprite, Bopper).originalPosition.x = dataProp.position[0];
cast(propSprite, Bopper).originalPosition.y = dataProp.position[1];
}
}

{
cast(propSprite, Bopper).playAnimation(dataProp.startingAnimation);
}

{
}
else if (Std.isOfType(propSprite, Bopper))
{
addBopper(cast propSprite, dataProp.name);
}
else
{
addProp(propSprite, dataProp.name);
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
namedProps.set(name, prop);
prop.name = name;
}
this.add(prop);
}

/**
* Add a sprite to the stage which animates to the beat of the song.
*/
public function addBopper(bopper:Bopper, ?name:String = null):Void
{
boppers.push(bopper);
this.addProp(bopper, name);
bopper.name = name;
}

/**
* Refreshes the stage, by redoing the render order of all props.
* It does this based on the `zIndex` of each prop.
*/
public function refresh():Void
{
sort(SortUtil.byZIndex, FlxSort.ASCENDING);
}

/**
* Sets a shader for each prop in the stage
* @param shader The shader to apply to each prop
*/
public function setShader(shader:FlxShader):Void
{
forEachAlive(function(prop:FlxSprite)
{
prop.shader = shader;
});
}

/**
* Adjusts the position and other properties of the soon-to-be child of this sprite group.
* Private helper to avoid duplicate code in `add()` and `insert()`.
*
* @param	Sprite	The sprite or sprite group that is about to be added or inserted into the group.
*/
override function preAdd(Sprite:FlxSprite):Void
{
sprite.x += x;
sprite.y += y;
sprite.alpha *= alpha;
sprite.cameras = _cameras; // _cameras instead of cameras because get_cameras() will not return null

}


/**
* Used by the PlayState to add a character to the stage.
*/
public function addCharacter(character:BaseCharacter, charType:CharacterType):Void
{

debugIcon.makeGraphic(8, 8, 0xffff00ff);
debugIcon2.makeGraphic(8, 8, 0xff00ffff);
debugIcon.visible = true;
debugIcon2.visible = true;
debugIcon.zIndex = 1000000;
debugIcon2.zIndex = 1000000;

switch (charType)
{
case BF:
this.characters.set('bf', character);
stageCharData = _data.characters.bf;
character.flipX = !character.getDataFlipX();
character.name = 'bf';
character.initHealthIcon(false);
case GF:
this.characters.set('gf', character);
stageCharData = _data.characters.gf;
character.flipX = character.getDataFlipX();
character.name = 'gf';
case DAD:
this.characters.set('dad', character);
stageCharData = _data.characters.dad;
character.flipX = character.getDataFlipX();
character.name = 'dad';
character.initHealthIcon(true);
default:
this.characters.set(character.characterId, character);
}

character.resetCharacter(true);

{
character.zIndex = stageCharData.zIndex;

character.x = stageCharData.position[0] - character.characterOrigin.x;
character.y = stageCharData.position[1] - character.characterOrigin.y;

character.setScale(finalScale); // Don't use scale.set for characters!
character.originalPosition.set(character.x, character.y);

character.resetCameraFocusPoint();

character.cameraFocusPoint.x += stageCharData.cameraOffsets[0];
character.cameraFocusPoint.y += stageCharData.cameraOffsets[1];

character.scrollFactor.x = stageCharData.scroll[0];
character.scrollFactor.y = stageCharData.scroll[1];

character.alpha = stageCharData.alpha;
character.angle = stageCharData.angle;

{
debugIcon.x = stageCharData.position[0];
debugIcon.y = stageCharData.position[1];
debugIcon2.x = character.x;
debugIcon2.y = character.y;
}
}

character.characterType = charType;

this.add(character);

ScriptEventDispatcher.callEvent(character, new ScriptEvent(ADDED, false));

debugIconGroup.add(debugIcon);
debugIconGroup.add(debugIcon2);
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

this.remove(boyfriend);
this.characters.remove('bf');

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

this.remove(girlfriend);
this.characters.remove('gf');

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

this.remove(dad);
this.characters.remove('dad');

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
});
}

/**
* Resume the animations of ALL sprites in this group.
*/
public function resume():Void
{
forEachAlive(function(prop:FlxSprite)
{
});
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
result.push(Paths.image(dataProp.assetPath));
}
}

/**
* Dispatch an event to all the characters in the stage.
* @param event The script event to dispatch.
*/
public function dispatchToCharacters(event:ScriptEvent):Void
{


{
dispatchToCharacter('dad', event);
charList.remove('dad');
}

{
dispatchToCharacter('bf', event);
charList.remove('bf');
}

{
dispatchToCharacter('gf', event);
charList.remove('gf');
}

for (characterId in charList)
{
dispatchToCharacter(characterId, event);
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
ScriptEventDispatcher.callEvent(character, event);
}
}

/**
* onDestroy gets called when the player is leaving the PlayState,
* and is used to clean up any objects that need to be destroyed.
*/
public function onDestroy(event:ScriptEvent):Void
{
kill();

for (prop in this.namedProps)
{
{
remove(prop);
prop.kill();
prop.destroy();
}
}
namedProps.clear();

for (char in this.characters)
{
{
remove(char);
char.kill();
char.destroy();
}
}
characters.clear();

for (bopper in boppers)
{
{
remove(bopper);
bopper.kill();
bopper.destroy();
}
}
boppers = [];

{
for (sprite in this.group)
{
{
sprite.kill();
sprite.destroy();
remove(sprite);
}
}
group.clear();
}

{
debugIconGroup.kill();
}
else
{
debugIconGroup = null;
}

{
frameBufferMan.dispose();
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
_skipTransformChildren = true;
alive = false;
exists = false;
_skipTransformChildren = false;
}

public override function remove(Sprite:FlxSprite, Splice:Bool = false):FlxSprite
{
sprite.x -= x;
sprite.y -= y;
sprite.cameras = null;

}

override function draw():Void
{
{
frameBufferMan.lock();
}
super.draw();
{
frameBufferMan.unlock();
}
frameBuffersUpdated();
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
ScriptEventDispatcher.callEvent(bopper, event);
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
