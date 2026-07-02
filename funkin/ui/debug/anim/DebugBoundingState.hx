package funkin.ui.debug.anim;


using flixel.util.FlxSpriteUtil;

class DebugBoundingState extends FlxState
{
/*
TODAY'S TO-DO
- Cleaner UI
*/









function get_currentAnimationName():String
{
}

function get_haxeUIFocused():Bool
{
}

override function create():Void
{
Paths.setCurrentLevel('week1');

hudCam = new FlxCamera();
hudCam.bgColor.alpha = 0;

bg = new FlxBackdrop(FlxGridOverlay.createGrid(10, 10, FlxG.width, FlxG.height, true, 0xffe7e6e6, 0xffd9d5d5));
add(bg);


offsetEditorDialog = cast RuntimeComponentBuilder.fromAsset(str);

viewDropdown.onChange = function(e:UIEvent)
{
curView = cast e?.data?.curView;
};

offsetAnimationDropdown = offsetEditorDialog.findComponent("animationDropdown", DropDown);

offsetEditorDialog.cameras = [hudCam];
offsetEditorDialog.closable = false;

add(offsetEditorDialog);
offsetEditorDialog.showDialog(false);

offsetEditorDialog.x = 16;
offsetEditorDialog.y = 16;


initSpritesheetView();
initOffsetView();

Cursor.show();

super.create();
}


function initSpritesheetView():Void
{
spriteSheetView = new FlxGroup();
add(spriteSheetView);


bf = new FlxSprite();
bf.loadGraphic(tex.parent);
spriteSheetView.add(bf);

swagOutlines = new FlxSprite().makeGraphic(tex.parent.width, tex.parent.height, FlxColor.TRANSPARENT);

generateOutlines(tex.frames);

txtGrp = new FlxTypedGroup<FlxText>();
txtGrp.cameras = [hudCam];
spriteSheetView.add(txtGrp);

addInfo('boyfriend.xml', "");
addInfo('Width', bf.width);
addInfo('Height', bf.height);

spriteSheetView.add(swagOutlines);
}

function generateOutlines(frameShit:Array<FlxFrame>):Void
{
swagOutlines.pixels.fillRect(new Rectangle(0, 0, swagOutlines.width, swagOutlines.height), 0x00000000);

for (i in frameShit)
{


swagOutlines.drawRect(i.uv.left * i.parent.width, i.uv.top * i.parent.height, uvW, uvH, FlxColor.TRANSPARENT, lineStyle);
}
}

function updateOnionSkin():Void
{

onionSkinChar.alpha = 0.6;
onionSkinChar.flipX = swagChar.flipX;

{
onionSkinChar.playAnimation("idle", true);
}
else if (onionSkinChar.hasAnimation("danceLeft"))
{
onionSkinChar.playAnimation("danceLeft", true);
}
else if (onionSkinChar.hasAnimation("danceRight"))
{
onionSkinChar.playAnimation("danceRight", true);
}
else
{
onionSkinChar.playAnimation(currentAnimationName, true);
}
}

function initOffsetView():Void
{
offsetView = new FlxGroup();
add(offsetView);

txtOffsetShit = new FlxText(20, 20, 0, "", 20);
txtOffsetShit.setFormat(Paths.font("vcr.ttf"), 26, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
txtOffsetShit.cameras = [hudCam];
txtOffsetShit.y = FlxG.height - 20 - txtOffsetShit.height;
offsetView.add(txtOffsetShit);

characters.sort(SortUtil.alphabetically);

for (char in characters)
{
charDropdown.dataSource.add({text: char});
}

charDropdown.onChange = function(e:UIEvent)
{
loadAnimShit(e.data.text);
};
}


function mouseOffsetMovement()
{
{
{
movingCharacter = true;
mouseOffset.set(FlxG.mouse.x - -swagChar.animOffsets[0], FlxG.mouse.y - -swagChar.animOffsets[1]);
}


{
swagChar.animOffsets = [(FlxG.mouse.x - mouseOffset.x) * -1, (FlxG.mouse.y - mouseOffset.y) * -1];

swagChar.animationOffsets.set(swagChar.getCurrentAnimation(), swagChar.animOffsets);

txtOffsetShit.text = 'Offset: ' + swagChar.animOffsets;
txtOffsetShit.y = FlxG.height - 20 - txtOffsetShit.height;
}

{
movingCharacter = false;
}

{
movingCharacter = false;
}
}
}

function addInfo(str:String, value:Dynamic)
{
swagText.setFormat(Paths.font("vcr.ttf"), 26, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
swagText.scrollFactor.set();

for (text in txtGrp.members)
{
text.y -= swagText.height;
}
txtGrp.add(swagText);

swagText.text = str + ": " + Std.string(value);
}

function clearInfo()
{
txtGrp.clear();
}

function checkLibrary(library:String)
{
{

Assets.loadLibrary(library).onComplete(function(_)
{
});
}
}

override function update(elapsed:Float)
{
{
lv.selectedIndex = 0;
curView = SPRITESHEET;
}

{
lv.selectedIndex = 1;
curView = ANIMATIONS;
{
}
}

switch (curView)
{
case SPRITESHEET:
spriteSheetView.visible = true;
offsetView.visible = false;
offsetView.active = false;
offsetAnimationDropdown.hide();
case ANIMATIONS:
spriteSheetView.visible = false;
offsetView.visible = true;
offsetView.active = true;
offsetAnimationDropdown.show();
offsetControls();
mouseOffsetMovement();
}



MouseUtil.mouseCamDrag();


bg.setGraphicSize(Std.int(bg.width / FlxG.camera.zoom));

super.update(elapsed);
}

override function destroy()
{
super.destroy();

Cursor.hide();

funkin.play.GameOverSubState.reset();
funkin.play.PauseSubState.reset();
funkin.play.Countdown.reset();
}

function offsetControls():Void
{
{
saveOffsets(outputString, FlxG.keys.pressed.SHIFT ? swagChar.characterId + "Offsets.txt" : swagChar.characterId + ".json");
}

{
{
offsetAnimationDropdown.selectedIndex += 1;
}
else
{
offsetAnimationDropdown.selectedIndex = 0;
}
playCharacterAnimation(currentAnimationName, true);
}
{
{
offsetAnimationDropdown.selectedIndex -= 1;
}
else
{
offsetAnimationDropdown.selectedIndex = offsetAnimationDropdown.dataSource.size - 1;
}
playCharacterAnimation(currentAnimationName, true);
}

{



{
offsetAnimationDropdown.value = {id: targetLabel, text: targetLabel};

playCharacterAnimation(currentAnimationName, true);
}
else
{
playCharacterAnimation(currentAnimationName, false);
}
}

{
onionSkinChar.visible = !onionSkinChar.visible;
}

{
swagChar.flipX = !swagChar.flipX;
}

{
else offsetAnimationDropdown.value = {id: 'idle', text: 'idle'};

playCharacterAnimation(currentAnimationName, true);
}

{
playCharacterAnimation(currentAnimationName, false);
}

{




else if (FlxG.keys.justPressed.LEFT) coolValues[0] += 1 * multiplier;
else if (FlxG.keys.justPressed.UP) coolValues[1] += 1 * multiplier;
else if (FlxG.keys.justPressed.DOWN) coolValues[1] -= 1 * multiplier;

swagChar.animationOffsets.set(currentAnimationName, coolValues);
swagChar.playAnimation(animName);

txtOffsetShit.text = 'Offset: ' + coolValues;
txtOffsetShit.y = FlxG.height - 20 - txtOffsetShit.height;

}
}

function buildOutputStringOld():String
{

for (i in swagChar.animationOffsets.keys())
{
outputString += i + " " + swagChar.animationOffsets.get(i)[0] + " " + swagChar.animationOffsets.get(i)[1] + "\n";
}

outputString.trim();

}

function buildOutputStringNew():String
{

for (charDataAnim in charData.animations)
{
charDataAnim.offsets = swagChar.animationOffsets.get(animName);
}

}


/*
Called when animation dropdown is changed!
*/
function loadAnimShit(char:String)
{
{
offsetView.remove(swagChar);
swagChar.destroy();
}

{
offsetView.remove(onionSkinChar);
onionSkinChar.destroy();
}

swagChar = CharacterDataParser.fetchCharacter(char, true);
swagChar.x = 100;
swagChar.y = 100;

onionSkinChar = CharacterDataParser.fetchCharacter(char, true);
onionSkinChar.x = swagChar.x;
onionSkinChar.y = swagChar.y;

onionSkinChar.useRenderTexture = true;

offsetView.add(onionSkinChar);
offsetView.add(swagChar);

{
}

updateOnionSkin();
generateOutlines(swagChar.frames.frames);
bf.pixels = swagChar.pixels;

clearInfo();
addInfo(swagChar._data.assetPath, "");
addInfo('Width', bf.width);
addInfo('Height', bf.height);

characterAnimNames = [];

for (i in swagChar.animationOffsets.keys())
{
characterAnimNames.push(i);
}

offsetAnimationDropdown.dataSource.clear();

for (charAnim in characterAnimNames)
{
offsetAnimationDropdown.dataSource.add({id: charAnim, text: charAnim});
}

offsetAnimationDropdown.selectedIndex = 0;


offsetAnimationDropdown.onChange = function(event:UIEvent)
{
{
playCharacterAnimation(event.data.id, true);
}
}

txtOffsetShit.text = 'Offset: ' + swagChar.animOffsets;
txtOffsetShit.y = FlxG.height - 20 - txtOffsetShit.height;
dropDownSetup = true;
}


function playCharacterAnimation(str:String, setOnionSkin:Bool = true)
{

swagChar.playAnimation(animName, true); // trace();

txtOffsetShit.text = 'Offset: ' + swagChar.animOffsets;
txtOffsetShit.y = FlxG.height - 20 - txtOffsetShit.height;
}


function saveOffsets(saveString:String, fileName:String)
{
{
_file = new FileReference();
_file.addEventListener(Event.COMPLETE, onSaveComplete);
_file.addEventListener(Event.CANCEL, onSaveCancel);
_file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file.save(saveString, fileName);
}
}

function onSaveComplete(_):Void
{
_file.removeEventListener(Event.COMPLETE, onSaveComplete);
_file.removeEventListener(Event.CANCEL, onSaveCancel);
_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file = null;
}

/**
* Called when the save file dialog is cancelled.
*/
function onSaveCancel(_):Void
{
_file.removeEventListener(Event.COMPLETE, onSaveComplete);
_file.removeEventListener(Event.CANCEL, onSaveCancel);
_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file = null;
}

/**
* Called if there is an error while saving the gameplay recording.
*/
function onSaveError(_):Void
{
_file.removeEventListener(Event.COMPLETE, onSaveComplete);
_file.removeEventListener(Event.CANCEL, onSaveCancel);
_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file = null;
}
}

enum abstract ANIMDEBUGVIEW(String)
{
}
