

class StageBuilderState extends MusicBeatState
{



override function create()
{

















{







new FlxTimer().start(0.2, function(tmr)
{







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
}

switch (curFocus)
{
case MOVEMENTS:
case ATTRIBUTES:
default:
}

{
}



{


{
}
}

{
}

{


}

}

function attributeControls():Void
{

{
{
}

{
}

}
}

function movementControls():Void
{

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


static public function changeTool(newTool:TOOLS)
{

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

}

function updateTextInfo()
{
}

function undoRedoCheck(daFunc:Dynamic->Void, daValue:Dynamic)
{
{
}
else
}

function sprDragShitFunc(spr:SprStage)
{


}

function moveSprPos(dumbArray:Array<Dynamic>)
{


{
}

}


function moveLayer(layerMovement:Int = 0):Void
{


}


function shakingScreen()
{
{
}
}

function sortSprGrp()
{

}

function daLayerSorting(order:Int = FlxSort.ASCENDING, layer1:SprStage, layer2:SprStage):Int
{
}
}

enum FOCUS
{
}

enum TOOLS
{
}
