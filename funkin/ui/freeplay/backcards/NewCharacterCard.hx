

class NewCharacterCard extends BackingCard
{



public override function applyExitMovers(?exitMovers:FreeplayState.ExitMoverData, ?exitMoversCharSel:FreeplayState.ExitMoverData):Void
{
exitMovers.set([friendFoe], {
x: FlxG.width * 2,
speed: 0.4,
exitMovers.set([newUnlock1], {
x: -newUnlock1.width * 2,
y: newUnlock1.y,
speed: 0.4,
wait: 0
exitMovers.set([waiting], {
x: FlxG.width * 2,
speed: 0.4,
exitMovers.set([newUnlock2], {
x: -newUnlock2.width * 2,
speed: 0.5,
exitMovers.set([friendFoe2], {
x: FlxG.width * 2,
speed: 0.4
exitMovers.set([newUnlock3], {
x: -newUnlock3.width * 2,
speed: 0.3

exitMoversCharSel.set([friendFoe, newUnlock1, waiting, newUnlock2, friendFoe2, newUnlock3, multiplyBar], {
y: -60,
speed: 0.8,
wait: 0.1
}

public override function introDone():Void
{


}

public override function enterCharSel():Void
{
}

public override function onCreate(event:ScriptEvent):Void
{













lightLayer = new FlxSprite((FreeplayState.CUTOUT_WIDTH * FreeplayState.DJ_POS_MULTI) + -360,



lightLayer2 = new FlxSprite((FreeplayState.CUTOUT_WIDTH * FreeplayState.DJ_POS_MULTI) + -360,


lightLayer3 = new FlxSprite((FreeplayState.CUTOUT_WIDTH * FreeplayState.DJ_POS_MULTI) + -360,



}


override public function update(elapsed:Float):Void
{




{
instance.angleMaskShader.extraColor = FlxColor.interpolate(0xFF2E2E46, 0xFF60607B, sinTest);
}
}

public override function disappear():Void
{


}
}
