package funkin.play.cutscene.dialogue;


class DialogueBox extends FlxSpriteGroup implements IDialogueScriptedClass implements IRegistryEntry<DialogueBoxData>
{

function get_dialogueBoxName():String
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

this.screenCenter();

originalPosition[0] = this.x;
originalPosition[1] = this.y;

this.x = value[0] + originalPosition[0] + animOffsets[0];
this.y = value[1] + originalPosition[1] + animOffsets[1];

}



function set_text(value:String):String
{
this.text = value;

textDisplay.resetText(this.text);
textDisplay.start();

}


function set_speed(value:Float):Float
{
this.speed = value;
textDisplay.delay = this.speed * 0.05; // 1.0 x 0.05
}

public function new(id:String, ?params:Dynamic)
{
super();
this.id = id;
this._data = _fetchData(id);

{
throw 'Could not parse dialogue box data for id: $id';
}
}

public function onCreate(event:ScriptEvent):Void
{
this.x = 0;
this.y = 0;
this.globalOffsets = [0, 0];
this.alpha = 1;

loadSpritesheet();
loadAnimations();

loadText();
}

function loadSpritesheet():Void
{
{
remove(this.boxSprite);
this.boxSprite = null;
}

this.boxSprite = new FunkinSprite(0, 0);


{
}

this.boxSprite.frames = tex;

{
this.boxSprite.antialiasing = false;
}
else
{
this.boxSprite.antialiasing = true;
}

this.flipX = _data.flipX;
this.flipY = _data.flipY;
this.globalOffsets = _data.offsets;
this.setScale(_data.scale);

add(this.boxSprite);
}

public function setText(newText:String):Void
{
textDisplay.prefix = '';
textDisplay.resetText(newText);
textDisplay.start();
}

public function appendText(newText:String):Void
{
textDisplay.prefix = this.textDisplay.text;
textDisplay.resetText(newText);
textDisplay.start();
}

public function skip():Void
{
textDisplay.skip();
}

/**
* Reassign this to set a callback.
*/
function onTypingComplete():Void
{
}


/**
* Set the sprite scale to the appropriate value.
* @param scale
*/
public function setScale(scale:Null<Float>):Void
{

this.boxSprite.scale.x = scale;
this.boxSprite.scale.y = scale;
this.boxSprite.updateHitbox();
}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function kill():Void
{
super.kill();
{
this.boxSprite.kill();
this.boxSprite = null;
}
{
this.textDisplay.kill();
this.textDisplay = null;
}
this.clear();
}

public override function revive():Void
{
super.revive();

this.x = 0;
this.y = 0;
this.globalOffsets = [0, 0];
this.visible = true;
this.alpha = 1.0;
}

function loadAnimations():Void
{

FlxAnimationUtil.addAtlasAnimations(this.boxSprite, _data.animations);

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


boxSprite.animation.onFrameChange.add(this.onAnimationFrame);
boxSprite.animation.onFinish.add(this.onAnimationFinished);
}

/**
* Called when an animation finishes.
* @param name The name of the animation that just finished.
*/
function onAnimationFinished(name:String):Void
{
}

/**
* Called when the current animation's frame changes.
* @param name The name of the current animation.
* @param frameNumber The number of the current frame.
* @param frameIndex The index of the current frame.
*
* For example, if an animation was defined as having the indexes [3, 0, 1, 2],
* then the first callback would have frameNumber = 0 and frameIndex = 3.
*/
function onAnimationFrame(name:String = "", frameNumber:Int = -1, frameIndex:Int = -1):Void
{

}

function loadText():Void
{
textDisplay = new FunkinTypeText(0, 0, 300, '', 32);
textDisplay.fieldWidth = _data.text.width;
textDisplay.setFormat(_data.text.fontFamily, _data.text.size, FlxColor.fromString(_data.text.color), LEFT, SHADOW,
FlxColor.fromString(_data.text.shadowColor ?? '#00000000'), false);
textDisplay.borderSize = _data.text.shadowWidth ?? 2;
textDisplay.sounds = [FunkinSound.load(Paths.sound('pixelText'), 0.6)];

textDisplay.completeCallback = onTypingComplete;

textDisplay.x += _data.text.offsets[0];
textDisplay.y += _data.text.offsets[1];

add(textDisplay);
}

/**
* @param name The name of the animation to play.
* @param restart Whether to restart the animation if it is already playing.
* @param reversed If true, play the animation backwards, from the last frame to the first.
*/
public function playAnimation(name:String, restart:Bool = false, reversed:Bool = false):Void
{

this.boxSprite.animation.play(correctName, restart, false, 0);

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
* Returns the name of the animation that is currently playing.
* If no animation is playing (usually this means the character is BROKEN!),
*   returns an empty string to prevent NPEs.
*/
public function getCurrentAnimation():String
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

public function isAnimationFinished():Bool
{
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
boxSprite = null;
textDisplay = null;

this.clear();

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
