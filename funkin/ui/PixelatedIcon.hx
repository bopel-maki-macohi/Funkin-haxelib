

/**
* The icon that gets used for Freeplay capsules and char select
* NOT to be confused with the HealthIcon class, which is for the in-game icons
*/
class PixelatedIcon extends FunkinSprite
{

public function new(x:Float, y:Float)
{


}

public function setCharacter(char:String):Void
{


for (i in 0...charIDParts.length)
{

{
}

}


{
}

this.char = char; // if we went past this its safe to assume the icon exists so we can assign it


{
}
else
{
}


switch (char)
{
case 'parents-christmas':
case 'sserafim-kazuha':
default:
}

{

this.animation.onFinish.add(function(name:String):Void
{

}
}
}
