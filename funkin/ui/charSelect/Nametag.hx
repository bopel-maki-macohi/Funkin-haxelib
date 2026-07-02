

class Nametag extends FlxSprite
{


public function new(?x:Float = 0, ?y:Float = 0, character:String)
{


else
}

public function updatePosition():Void
{

}

public function switchChar(str:String, playMosaicSequence:Bool = true):Void
{


{

new FlxTimer().start(2 / 30, _ ->
{
}
else
{
}
}

function shaderEffect(fadeOut:Bool = false):Void
{

{
}

{
currentMosaicSequence = new Sequence([{
time: 0 / 30,
callback: () -> mosaicShader.setBlockSize(1, 1)
}, {
time: 1 / 30,
callback: () -> mosaicShader.setBlockSize(width / 27, height / 26)
}, {
time: 2 / 30,
callback: () -> mosaicShader.setBlockSize(width / 10, height / 10)
}
else
{
currentMosaicSequence = new Sequence([{
time: 0 / 30,
callback: () -> mosaicShader.setBlockSize(width / 10, height / 10)
}, {
time: 1 / 30,
callback: () -> mosaicShader.setBlockSize(width / 73, height / 6)
}
}

function setBlockTimer(frame:Int, ?forceX:Float, ?forceY:Float):Void
{

FlxTimer.wait(frame / 30, () ->
{
}

function set_midpointX(val:Float):Float
{
}

function set_midpointY(val:Float):Float
{
}
}
