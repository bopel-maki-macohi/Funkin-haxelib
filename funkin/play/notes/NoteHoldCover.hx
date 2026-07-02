package funkin.play.notes;


class NoteHoldCover extends FlxTypedSpriteGroup<FlxSprite>
{




public function new(noteStyle:NoteStyle)
{
super(0, 0);

setupHoldNoteCover(noteStyle);
}

/**
* Add ALL the animations to this sprite. We will recycle and reuse the FlxSprite multiple times.
*/
function setupHoldNoteCover(noteStyle:NoteStyle):Void
{
glow = new FlxSprite();
add(glow);

noteStyle.buildHoldCoverSprite(this);

glow.animation.onFinish.add(this.onAnimationFinished);

{
}
}

public override function update(elapsed):Void
{
super.update(elapsed);
}

public function playStart():Void
{
glow.setPosition(this.x, this.y);
glow.animation.play('holdCoverStart${direction.colorName.toTitleCase()}');
}

public function playContinue():Void
{
glow.animation.play('holdCover${direction.colorName.toTitleCase()}');
}

public function playEnd():Void
{
glow.animation.play('holdCoverEnd${direction.colorName.toTitleCase()}');
}

public override function kill():Void
{
super.kill();

this.visible = false;

holdNote.cover = null;

}

public override function revive():Void
{
super.revive();

this.visible = true;
this.alpha = 1.0;

}

public function onAnimationFinished(animationName:String):Void
{
{
playContinue();
}
{
this.visible = false;
this.kill();
}
}
}
