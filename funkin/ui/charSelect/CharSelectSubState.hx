

class CharSelectSubState extends MusicBeatSubState
{
/**
* The default index for the cursor.
*/










public function new(?params:CharSelectSubStateParams)
{








}

function loadAvailableCharacters():Void
{

for (playerId in playerIds)
{

{
}



{
}
}

}

override public function create():Void
{


{
}


applyStageMatrix: true

applyStageMatrix: true


barthing.loadTextureAtlas("charSelect/barThing", {
applyStageMatrix: true




function setupPlayerChill(character:String)
{


}

{
for (pos => charId in availableChars)
{
{
}
}
}
else
{
}

applyStageMatrix: true


dipshitBlur.animation.addByPrefix('idle', "CHOOSE vertical offset instance 1", 24, true);

dipshitBacking.animation.addByPrefix('idle', "CHOOSE horizontal offset instance 1", 24, true);







{
}













FunkinSound.playMusic('stayFunky', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,


for (index => member in grpIcons.members)
{
}







{
}

FlxTween.tween(backButton, {x: FlxG.width - 230}, 0.5, {
ease: FlxEase.expoOut,
onComplete: (_) ->
{
}


fadeShader.fade(0.0, 1.0, 0.8, {
ease: FlxEase.quadOut,
onComplete: (twn) ->
{
}
FlxTween.tween(camFollow, {y: camFollow.y + 150}, 1.5, {
ease: FlxEase.expoOut,
onComplete: function(_)
{
}





subStateClosed.addOnce((_) ->
{
{

}

Save.instance.oldChar.value = true;
}

override public function destroy():Void
{
}

function checkNewChar():Void
{
{
else
{

FunkinSound.playMusic('stayFunky', {
startingVolume: 1,
overrideExisting: true,
restartTrack: true,
onLoad: function()
{

}
}
}


function initLocks():Void
{


for (i in 0...9)
{
{
}
else
{

swfMode: true,
uniqueInCache: true


}

}


}

function unLock():Void
{




{
}




selectTimer.start(0.5, function(_)
{

lock.anim.onFrameChange.add(function(animName:String, frame:Int, index:Int)
{
{
}


lock.anim.onFinish.addOnce(function(_)
{





playerChillOut.anim.onFinish.addOnce((_) -> if (_ == "death")
{


Save.instance.addCharacterSeen(char);
{


FunkinSound.playMusic('stayFunky', {
startingVolume: 1,
overrideExisting: true,
restartTrack: true,
onLoad: function()
{

}
}
else


}

function updateIconPositions()
{

for (index => member in grpIcons.members)
{


}

for (index => member in grpHitboxes.members)
{


}
}

function goToFreeplay():Void
{

{
}


for (index => member in grpIcons.members)
{
}

FlxTween.tween(camFollow, {y: camFollow.y - 150}, 0.8, {
ease: FlxEase.backIn,
onComplete: function(_)
{
{
character: wentBackToFreeplay ? rememberedChar : curChar,
fromCharSelect: true
}
}
}




override public function update(elapsed:Float):Void
{

Conductor.instance.update();


{
{
for (i => hitbox in grpHitboxes.members)
{


{
}
else if (TouchUtil.justPressed)
{
}

}
}

{
}

{


}
{
}
{

}
{
}

{
}

{
}

{
}

{
}


}


{

{


{
}

FlxTween.tween(FlxG.sound.music, {pitch: 1.0}, 1, {
ease: FlxEase.quartInOut,
onComplete: (_) ->
{
{
}
}
}

{




{
}



selectTimer.start(1.5, (_) ->
{
}

}
else
{


{

}
}


{
}



}

function goBack():Void
{
{
}

}


function doBop(icon:PixelatedIcon, elapsed:Float):Void
{
{
}

{




}
}

public override function dispatchEvent(event:ScriptEvent):Void
{

}

function spamOnStep():Void
{
{


{
}
{
}
{
}
{
}
}
}

private function updateLockAnims():Void
{
for (index => member in grpIcons.group.members)
{
switch (member.ID)
{
case 1:
{
switch (lock.getCurrentAnimation())
{
case "idle":
case "selected" | "clicked":
}
}
else
{
}
case 0:

{
{
{
}
}
else
{
}
{

onFinish = (_) ->
{

}
}
else
{
}
}
}
}

function getCurrentSelected():Int
{
}

function setCursorPosition(index:Int, instant:Bool = false):Void
{

{
}



{


}
}

function set_curChar(value:String):String
{


else



playerChillOut.anim.onFrameChange.add(function(animName:String, frameNumber:Int, index:Int)
{
{
}

playerChillOut.anim.onFinish.addOnce(function(animName:String)
{

}

function set_grpXSpread(value:Float):Float
{
}

function set_grpYSpread(value:Float):Float
{
}
}

/**
* Parameters used to initialize the CharSelectSubState.
*/
typedef CharSelectSubStateParams =
{
?character:String
