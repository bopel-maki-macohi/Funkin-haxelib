package funkin.ui.freeplay.components;


/**
* The sprite for the difficulty
*/
class DifficultySprite extends FlxSprite
{

public function new(diffId:String)
{
super();

this.difficultyId = diffId;

{
assetDiffIdParts.pop();
{
};
assetDiffId = assetDiffIdParts.join('-');
}

{
this.frames = Paths.getSparrowAtlas('freeplay/freeplay${assetDiffId}');
this.animation.addByPrefix('idle', 'idle0', 24, true);
}
else
{
this.loadGraphic(Paths.image('freeplay/freeplay' + assetDiffId));
}
}
}
