

class MainMenuState extends MusicBeatState
{




function get_canInteract():Bool
{
}



public function new(_overrideMusic:Bool = false)
{



}

override function create():Void
{






bg.scrollFactor.x = #if !mobile 0 #else 0.17 #end; // we want a lil x scroll on mobile





menuItems.onAcceptPress.add(_ ->
{


createMenuItem('storymode', 'mainmenu/storymode', () ->
{
{

createMenuItem('freeplay', 'mainmenu/freeplay', function()
{



{
for (i in 0...upgradeSparkles.length)
{
}
}

openSubState(new FreeplayState({
character: targetCharacter

{
}
else
{

createMenuItem('upgrade', 'mainmenu/upgrade', function()
{
}

{
createMenuItem('options', 'mainmenu/options', function()
{
}

createMenuItem('credits', 'mainmenu/credits', function()
{


for (index => menuItem in menuItems)
{
menuItem.scrollFactor.x = #if !mobile 0.0 #else 0.4 #end; // we want a lil scroll on mobile, for the cute gyro effect

}


{
for (_ in 0...8)
{

}

subStateClosed.add(_ ->
{
for (i in 0...upgradeSparkles.length)
{
}
}



subStateOpened.add((sub:FlxSubState) ->
{
{
FlxTimer.wait(0.5, () ->
{
}





{
}

backButton?.onConfirmStart.add(() ->
{

optionsButton?.onConfirmStart.add(() ->
{


}

function initLeftWatermarkText():Void
{


{
leftWatermarkText.text += ' | Newgrounds: Logged in as ${NewgroundsClient.instance.user?.name}';
}
}

function playMenuMusic():Void
{
FunkinSound.playMusic('freakyMenu', {
overrideExisting: true,
restartTrack: false,
persist: true
}

function resetCamStuff(snap:Bool = true):Void
{

}

function createMenuItem(name:String, atlas:String, callback:Void->Void, fireInstantly:Bool = false):Void
{


}


function createMenuButtion(name:String, atlas:String, callback:Void->Void):Void
{
}

override function closeSubState():Void
{

{



}

}

function onMenuItemChange(selected:MenuListItem)
{
}

function selectDonate()
{
}

function selectMerch()
{
}

public function openPrompt(prompt:Prompt, onClose:Void->Void):Void
{

prompt.closeCallback = function()
{
}

}

function startExitState(state:NextState):Void
{

uiStateMachine.transition(Exiting); // Start fade out

menuItems.forEach(item ->
{
else


FlxTimer.wait(fadeOutDuration, () ->
{
}

override function update(elapsed:Float):Void
{

Conductor.instance.update();

{


}

{
}


{
}
{
}
}

function handleInputs():Void
{

{


}


{
}

{
funkin.save.Save.instance.setLevelScore('weekend1', 'easy', {
score: 1,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}
}

{
for (diff in ['easy', 'normal', 'hard'])
{
funkin.save.Save.instance.setLevelScore('weekend1', diff, {
score: 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}
}
}

{
funkin.save.Save.instance.setSongScore('tutorial', 'easy', {
score: 1234567,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 1,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 1,
totalNotes: 10,
}
}

{
{
funkin.save.Save.instance.data.unlocks.charactersSeen = ["bf"];
funkin.save.Save.instance.oldChar.value = false;
}
}

{
funkin.save.Save.instance.debug_dumpSaveJsonSave();
}

}

function goOptions():Void
{
}

function goBack():Void
{

}
}
