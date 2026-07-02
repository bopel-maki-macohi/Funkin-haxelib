package funkin.ui.story;


class LevelProp extends Bopper
{

function set_propData(value:LevelPropData):LevelPropData
{
{
this.propData = value;

this.visible = this.propData != null;
danceEvery = this.propData?.danceEvery ?? 1.0;

applyData();
}

}

public function new(propData:LevelPropData)
{
super(propData.danceEvery);
this.propData = propData;
}

public function playConfirm():Void
{
}

function applyData():Void
{
{
this.visible = false;
}
else
{
this.visible = true;
}

this.shouldAlternate = null;

{
this.frames = Paths.getSparrowAtlas(propData.assetPath);
}
else
{
this.loadGraphic(Paths.image(propData.assetPath));

this.active = false;
}

{
}

this.scale.set(scale, scale);
this.antialiasing = !propData.isPixel;
this.alpha = propData.alpha;
this.x = propData.offsets[0];
this.y = propData.offsets[1];
this.flipX = propData.flipX;
this.flipY = propData.flipY;

FlxAnimationUtil.addAtlasAnimations(this, propData.animations);
for (propAnim in propData.animations)
{
this.setAnimationOffsets(propAnim.name, propAnim.offsets[0], propAnim.offsets[1]);
}

{
this.playAnimation(propData.startingAnimation, true);
}
else
{
this.dance();
this.animation.paused = true;
}
}

public static function build(propData:Null<LevelPropData>):Null<LevelProp>
{

}
}
