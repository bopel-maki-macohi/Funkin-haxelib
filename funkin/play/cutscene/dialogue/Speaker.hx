package funkin.play.cutscene.dialogue;


/**
* The character sprite which displays during dialogue.
*
* Most conversations have two speakers, with one being flipped.
*/
class Speaker extends FlxSprite implements IDialogueScriptedClass implements IRegistryEntry<SpeakerData>
{
/**
* A readable name for this speaker.
*/

function get_speakerName():String
{
}

/**
* Offset the speaker's sprite by this much when playing each animation.
*/

/**
* The position without offsets applied.
*/

/**
* The current animation offset being used.
*/

function set_animOffsets(value:Array<Float>):Array<Float>
{

this.x = globalOffsets[0] + originalPosition[0] + value[0];
this.y = globalOffsets[1] + originalPosition[1] + value[1];

}

/**
* The offset of the speaker overall.
*/

function set_globalOffsets(value:Array<Float>):Array<Float>
{

this.x = value[0] + originalPosition[0] + animOffsets[0];
this.y = value[1] + originalPosition[1] + animOffsets[1];

}

public function new(id:String, ?params:Dynamic)
{
super();

this.id = id;
this._data = _fetchData(id);

{
throw 'Could not parse speaker data for id: $id';
}
}

/**
* Called when speaker is being created.
* @param event The script event.
*/
public function onCreate(event:ScriptEvent):Void
{
this.x = 0;
this.y = 0;
this.globalOffsets = [0, 0];
this.alpha = 1;

loadSpritesheet();
loadAnimations();
}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function kill():Void
{
super.kill();
}

public override function revive():Void
{
super.revive();

this.x = 0;
this.y = 0;
this.globalOffsets = [0, 0];
this.visible = true;
this.alpha = 1.0;

loadSpritesheet();
loadAnimations();
}

function loadSpritesheet():Void
{

{
}

this.frames = tex;

{
this.antialiasing = false;
}
else
{
this.antialiasing = true;
}

this.screenCenter();

originalPosition[0] = this.x;
originalPosition[1] = this.y;

this.flipX = _data.flipX;
this.flipY = _data.flipY;
this.globalOffsets = _data.offsets;
this.setScale(_data.scale);
}

/**
* Set the sprite scale to the appropriate value.
* @param scale
*/
public function setScale(scale:Null<Float>):Void
{

this.scale.x = scale;
this.scale.y = scale;
this.updateHitbox();
}

function loadAnimations():Void
{

FlxAnimationUtil.addAtlasAnimations(this, _data.animations);

for (anim in _data.animations)
{
{
setAnimationOffsets(anim.name, 0, 0);
}
else
{
setAnimationOffsets(anim.name, anim.offsets[0], anim.offsets[1]);
}
}

}

/**
* @param name The name of the animation to play.
* @param restart Whether to restart the animation if it is already playing.
*/
public function playAnimation(name:String, restart:Bool = false):Void
{

this.animation.play(correctName, restart, false, 0);

applyAnimationOffsets(correctName);
}

/**
* Ensure that a given animation exists before playing it.
* Will gracefully check for name, then name with stripped suffixes, then 'idle', then fail to play.
* @param name
*/
function correctAnimationName(name:String):String
{


{
}
else
{
{
}
else
{
}
}
}

public function hasAnimation(id:String):Bool
{

}

/**
* Define the animation offsets for a specific animation.
*/
public function setAnimationOffsets(name:String, xOffset:Float, yOffset:Float):Void
{
animationOffsets.set(name, [xOffset, yOffset]);
}

/**
* Retrieve an apply the animation offsets for a specific animation.
*/
function applyAnimationOffsets(name:String):Void
{
{
this.animOffsets = offsets;
}
else
{
this.animOffsets = [0, 0];
}
}

public function onDialogueStart(event:DialogueScriptEvent):Void
{
}

public function onDialogueCompleteLine(event:DialogueScriptEvent):Void
{
}

public function onDialogueLine(event:DialogueScriptEvent):Void
{
}

public function onDialogueSkip(event:DialogueScriptEvent):Void
{
}

public function onDialogueEnd(event:DialogueScriptEvent):Void
{
}

public function onUpdate(event:UpdateScriptEvent):Void
{
}

public function onDestroy(event:ScriptEvent):Void
{
frames = null;

this.x = 0;
this.y = 0;
this.globalOffsets = [0, 0];
this.alpha = 0;

this.kill();
}

public function onScriptEvent(event:ScriptEvent):Void
{
}
}
