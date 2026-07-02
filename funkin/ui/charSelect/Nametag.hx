package funkin.ui.charSelect;


class Nametag extends FlxSprite
{


public function new(?x:Float = 0, ?y:Float = 0, character:String)
{
super(x, y);

mosaicShader = new MosaicEffect();
shader = mosaicShader;

else
switchChar(Constants.DEFAULT_CHARACTER, false);
}

public function updatePosition():Void
{

x -= offsetX;
y -= offsetY;
}

public function switchChar(str:String, playMosaicSequence:Bool = true):Void
{

loadGraphic(Paths.image("charSelect/" + path + "Nametag"));
updateHitbox();
scale.set(0.77, 0.77);
updatePosition();

{
mosaicShader.setBlockSize(1, 1);
shaderEffect();

new FlxTimer().start(2 / 30, _ ->
{
shaderEffect(true);
});
}
else
{
mosaicShader.setBlockSize(1, 1);
}
}

function shaderEffect(fadeOut:Bool = false):Void
{

{
mosaicShader.setBlockSize(1, 1);
currentMosaicSequence.destroy();
currentMosaicSequence = null;
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
}, {time: 3 / 30, callback: () -> mosaicShader.setBlockSize(1, 1)},]);
}
else
{
currentMosaicSequence = new Sequence([{
time: 0 / 30,
callback: () -> mosaicShader.setBlockSize(width / 10, height / 10)
}, {
time: 1 / 30,
callback: () -> mosaicShader.setBlockSize(width / 73, height / 6)
}, {time: 2 / 30, callback: () -> mosaicShader.setBlockSize(width / 10, height / 10)},]);
}
}

function setBlockTimer(frame:Int, ?forceX:Float, ?forceY:Float):Void
{

FlxTimer.wait(frame / 30, () ->
{
mosaicShader.setBlockSize(daX, daY);
});
}

function set_midpointX(val:Float):Float
{
this.midpointX = val;
updatePosition();
}

function set_midpointY(val:Float):Float
{
this.midpointY = val;
updatePosition();
}
}
