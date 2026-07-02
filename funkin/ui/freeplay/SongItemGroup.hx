package funkin.ui.freeplay;


/**
* A FlxTypedGroup for capsules that does drawing in batches. This prevents memory leaks due to too many assets being rendered.
*/
class SongItemGroup extends FlxTypedGroup<SongMenuItem>
{

override function recycle(?cls:Class<Dynamic>, ?factory:Void->Dynamic, force:Bool = false, revive:Bool = true):SongMenuItem
override function recycle(?cls:Class<SongMenuItem>, ?factory:Void->SongMenuItem, force:Bool = false, revive:Bool = true):SongMenuItem
{

capsule.fakeBlurredRanking.shader = rankBlurredShader;
capsule.blurredRanking.shader = rankBlurredShader;
capsule.favIconBlurred.shader = favIconBlurredShader;

capsule.weekText.filters = [weekTextFilter];

}

override function draw():Void
{
{
FlxCamera._defaultCameras = _cameras;
}


for (capsule in this.members)
{
{
capsulesToRender.push(capsule);
}
}


for (i in 0...memberCount)
{
for (capsule in capsulesToRender)
{

member.draw();
}
}

FlxCamera._defaultCameras = oldDefaultCameras;
}
}
