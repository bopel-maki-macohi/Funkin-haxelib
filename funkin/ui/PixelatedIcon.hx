package funkin.ui;


/**
* The icon that gets used for Freeplay capsules and char select
* NOT to be confused with the HealthIcon class, which is for the in-game icons
*/
class PixelatedIcon extends FunkinSprite
{

public function new(x:Float, y:Float)
{
super(x, y);

this.char = '';

this.makeGraphic(32, 32, 0x00000000);
this.antialiasing = false;
this.active = false;
}

public function setCharacter(char:String):Void
{


for (i in 0...charIDParts.length)
{
iconName += charIDParts[i];

{
lastValidIconName = iconName;
}

}

charPath += '${lastValidIconName}pixel';

{
this.visible = false;
}

this.visible = true;
this.char = char; // if we went past this its safe to assume the icon exists so we can assign it


{
this.frames = Paths.getSparrowAtlas(charPath);
}
else
{
this.loadGraphic(Paths.image(charPath));
}

this.scale.x = this.scale.y = 2;

switch (char)
{
case 'parents-christmas':
this.origin.x = 140;
case 'sserafim-kazuha':
this.origin.x = 195;
default:
this.origin.x = 100;
}

{
this.active = true;
this.animation.addByPrefix('idle', 'idle0', 10, true);
this.animation.addByPrefix('confirm', 'confirm0', 10, false);
this.animation.addByPrefix('confirm-hold', 'confirm-hold0', 10, true);

this.animation.onFinish.add(function(name:String):Void
{
});

this.animation.play('idle');
}
}
}
