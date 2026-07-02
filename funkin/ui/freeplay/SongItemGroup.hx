

/**
* A FlxTypedGroup for capsules that does drawing in batches. This prevents memory leaks due to too many assets being rendered.
*/
class SongItemGroup extends FlxTypedGroup<SongMenuItem>
{

override function recycle(?cls:Class<Dynamic>, ?factory:Void->Dynamic, force:Bool = false, revive:Bool = true):SongMenuItem
override function recycle(?cls:Class<SongMenuItem>, ?factory:Void->SongMenuItem, force:Bool = false, revive:Bool = true):SongMenuItem
{



}

override function draw():Void
{
{
}


for (capsule in this.members)
{
{
}
}


for (i in 0...memberCount)
{
for (capsule in capsulesToRender)
{

}
}

}
}
