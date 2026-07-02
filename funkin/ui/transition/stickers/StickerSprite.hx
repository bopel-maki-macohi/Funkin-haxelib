package funkin.ui.transition.stickers;


class StickerSprite extends FunkinSprite
{

public function new(x:Float, y:Float, filePath:String):Void
{
super(x, y);
loadTexture(filePath);
updateHitbox();
scrollFactor.set();
}
}
