package funkin.ui.debug.stage;


class StageBuilderState extends MusicBeatState
{



override function create()
{
hudCam = new FlxCamera();
hudCam.bgColor.alpha = 0;


super.create();









add(bg);

sprGrp = new FlxTypedGroup<SprStage>();
add(sprGrp);

hudGrp = new FlxGroup();
hudGrp.cameras = [hudCam];
add(hudGrp);

textInfo = new FlxText(10, 80, 0, "", 24);
textInfo.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
textInfo.scrollFactor.set();
hudGrp.add(textInfo);

hudGrp.add(imgBtn);

hudGrp.add(saveSceneBtn);

{




sys.io.File.copy(path, './' + Paths.image('stageBuild/stageTempImg'));


fo.write(sys.io.File.getBytes(path));

new FlxTimer().start(0.2, function(tmr)
{
awesomeImg.loadGraphic(Paths.image('stageBuild/stageTempImg'), false, 0, 0, true);

awesomeImg.layer = sprGrp.members.length;
awesomeImg.imgName = fileName;

sprGrp.add(awesomeImg);

curFocus = MOVEMENTS;
});




});
}


function loadImage():Void
{
}

function saveScene():Void
{
}



override function update(elapsed:Float)
{

{
else
curFocus = ATTRIBUTES;
}

switch (curFocus)
{
case MOVEMENTS:
movementControls();
case ATTRIBUTES:
attributeControls();
default:
}

{
}

MouseUtil.mouseCamDrag();


{

shakeIntensity -= 30 * elapsed;

{
isShaking = false;
shakeIntensity = 60;
}
}

{
moveSprPos([curSelectedSpr.x - curSelectedSpr.oldPos.x, curSelectedSpr.y - curSelectedSpr.oldPos.y]);
}

{
isUndoRedo = true;


daFunc(daValue);
}

super.update(elapsed);
}

function attributeControls():Void
{
textInfo.alpha = 1;

{
{
curSelectedSpr.scrollFactor.x -= 0.1;
curSelectedSpr.scrollFactor.y -= 0.1;
}

{
curSelectedSpr.scrollFactor.x += 0.1;
curSelectedSpr.scrollFactor.y += 0.1;
}

updateTextInfo();
}
}

function movementControls():Void
{
textInfo.alpha = 0.5;

{
tempTool = curTool;

changeTool(SELECT);
}
{
changeTool(tempTool);
}

{
changeTool(SELECT);
}

{
shakingScreen();


}


{
}

{
}
}


static public function changeTool(newTool:TOOLS)
{
curTool = newTool;

switch (curTool)
{
case SELECT:
case GRABBING:
case GRAB:
default:
}
}

function changeCurSelected(spr:SprStage)
{
undoRedoCheck(changeCurSelected, curSelectedSpr);
curSelectedSpr = spr;

updateTextInfo();
}

function updateTextInfo()
{
textInfo.text = curSelectedSpr.imgName;
textInfo.text += ' - parallax: ' + curSelectedSpr.scrollFactor;
}

function undoRedoCheck(daFunc:Dynamic->Void, daValue:Dynamic)
{
{
actionQueue.push(daFunc);
posQueue.push(daValue);
}
else
isUndoRedo = false;
}

function sprDragShitFunc(spr:SprStage)
{

spr.mousePressing = true;

spr.mouseOffset.set(FlxG.mouse.x - spr.x, FlxG.mouse.y - spr.y);
spr.oldPos.set(spr.x, spr.y);
}

function moveSprPos(dumbArray:Array<Dynamic>)
{


{
curSelectedSpr.x += xDiff;
curSelectedSpr.y += yDiff;
}

undoRedoCheck(moveSprPos, [-xDiff, -yDiff, true]);
}


function moveLayer(layerMovement:Int = 0):Void
{

curSelectedSpr.layer -= layerMovement;
sprGrp.members[curSelectedSpr.layer].layer += layerMovement;

sortSprGrp();
undoRedoCheck(moveLayer, layerMovement * -1);
}


function shakingScreen()
{
{
isShaking = true;
shakePos.set(FlxG.stage.window.x, FlxG.stage.window.y);
}
}

function sortSprGrp()
{
sprGrp.sort(daLayerSorting, FlxSort.ASCENDING);

FlxMouseEvent.reorder();
}

function daLayerSorting(order:Int = FlxSort.ASCENDING, layer1:SprStage, layer2:SprStage):Int
{
}
}

enum FOCUS
{
ATTRIBUTES;
MOVEMENTS;
TOOLBAR;
}

enum TOOLS
{
SELECT;
MOVE;
GRAB;
GRABBING;
BOYFRIEND;
}
