

/**
* The graphic for the album roll in the FreeplayState.
* Simply set `albumID` to fetch the required data and update the textures.
*/
class AlbumRoll extends FlxSpriteGroup
{
/**
* The ID of the album to display.
* Modify this value to automatically update the album art and title.
*/

function set_albumId(value:Null<String>):Null<String>
{
{
}

}





public function new()
{





}

function onAlbumFinish(animName:String):Void
{
{
}
}

/**
* Load the album data by ID and update the textures.
*/
function updateAlbum():Void
{
{
}
else

albumData = AlbumRegistry.instance.fetchEntry(albumId);

{


}

public function refresh():Void
{
}

/**
* Apply exit movers for the album roll.
* @param exitMovers The exit movers to apply.
*/
public function applyExitMovers(?exitMovers:FreeplayState.ExitMoverData, ?exitMoversCharSel:FreeplayState.ExitMoverData):Void
{
{
}
else
{
}


{
}
else
{
}


exitMovers.set([newAlbumArt, difficultyStars], {
x: FlxG.width,
speed: 0.4,
wait: 0

exitMoversCharSel.set([newAlbumArt, difficultyStars], {
y: -175,
speed: 0.8,
wait: 0.1
}


/**
* Play the intro animation on the album art.
*/
public function playIntro():Void
{



new FlxTimer().start(0.75, function(_)
{
}

public function skipIntro():Void
{
}

public function showTitle():Void
{
}

public function buildAlbumTitle(assetKey:String, ?titleOffsets:Null<Array<Float>>):Void
{
{
}

{
}


albumTitle.animation.onFinish.add(function(name)
{



x: FlxG.width,
speed: 0.4,
wait: 0

y: -190,
speed: 0.8,
wait: 0.1
}

public function setDifficultyStars(?difficulty:Int):Void
{
}

/**
* Make the album stars visible.
*/
public function showStars():Void
{
}

/**
* Returns the name for the OST associated with the album.
* If not specified, returns the default name if this is a base game album.
* @return Null<String>
*/
public function getOSTNameOverride():Null<String>
{
{
}
else if (albumId == null || AlbumRegistry.instance.listBaseGameEntryIds().contains(albumId))
{
}

}

override function destroy():Void
{

}
}
