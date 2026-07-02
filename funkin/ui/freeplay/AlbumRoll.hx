package funkin.ui.freeplay;


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
this.albumId = value;
updateAlbum();
}

}





public function new()
{
super();

newAlbumArt = FunkinSprite.createTextureAtlas((FlxG.width + -360) - FullScreenScaleMode.gameNotchSize.x, 220, "freeplay/albumRoll/freeplayAlbum");
newAlbumArt.visible = false;

difficultyStars = new DifficultyStars((FlxG.width - 330) - FullScreenScaleMode.gameNotchSize.x, 209);
difficultyStars.visible = false;

add(newAlbumArt);
add(difficultyStars);

buildAlbumTitle("freeplay/albumRoll/volume1-text");

newAlbumArt.anim.onFinish.add(onAlbumFinish);
}

function onAlbumFinish(animName:String):Void
{
{
newAlbumArt.anim.play('idle', true);
newAlbumArt.anim.curAnim.looped = true;
}
}

/**
* Load the album data by ID and update the textures.
*/
function updateAlbum():Void
{
{
this.visible = false;
albumData = null;
}
else
this.visible = true;

albumData = AlbumRegistry.instance.fetchEntry(albumId);

{
};

newAlbumArt.replaceSymbolGraphic(ALBUM_ART_SYMBOL, albumGraphic);

buildAlbumTitle(albumData.getAlbumTitleAssetKey(), albumData.getAlbumTitleOffsets());
applyExitMovers();
refresh();
}

public function refresh():Void
{
sort(SortUtil.byZIndex, FlxSort.ASCENDING);
}

/**
* Apply exit movers for the album roll.
* @param exitMovers The exit movers to apply.
*/
public function applyExitMovers(?exitMovers:FreeplayState.ExitMoverData, ?exitMoversCharSel:FreeplayState.ExitMoverData):Void
{
{
exitMovers = _exitMovers;
}
else
{
_exitMovers = exitMovers;
}


{
exitMoversCharSel = _exitMoversCharSel;
}
else
{
_exitMoversCharSel = exitMoversCharSel;
}


exitMovers.set([newAlbumArt, difficultyStars], {
x: FlxG.width,
speed: 0.4,
wait: 0
});

exitMoversCharSel.set([newAlbumArt, difficultyStars], {
y: -175,
speed: 0.8,
wait: 0.1
});
}


/**
* Play the intro animation on the album art.
*/
public function playIntro():Void
{
this.visible = true;

newAlbumArt.visible = true;
newAlbumArt.anim.play('intro', true);

difficultyStars.visible = false;
difficultyStars.flameCheck();

new FlxTimer().start(0.75, function(_)
{
showTitle();
showStars();
});
}

public function skipIntro():Void
{
this.visible = true;
newAlbumArt.anim.play('switch', true);
}

public function showTitle():Void
{
}

public function buildAlbumTitle(assetKey:String, ?titleOffsets:Null<Array<Float>>):Void
{
{
remove(albumTitle);
albumTitle = null;
}

{
titleOffsets = [0, 0];
}

albumTitle = FunkinSprite.createSparrow((FlxG.width - 355) - FullScreenScaleMode.gameNotchSize.x, 500, assetKey);
albumTitle.visible = this.visible && (albumTitle.frames != null && newAlbumArt.visible) && difficultyStars.visible;
albumTitle.animation.addByPrefix('idle', 'idle0', 24, true);
albumTitle.animation.addByPrefix('switch', 'switch0', 24, false);
add(albumTitle);

albumTitle.animation.onFinish.add(function(name)
{
});
albumTitle.animation.play('idle');

albumTitle.zIndex = 1000;

albumTitle.x += titleOffsets[0];
albumTitle.y += titleOffsets[1];

x: FlxG.width,
speed: 0.4,
wait: 0
});

y: -190,
speed: 0.8,
wait: 0.1
});
}

public function setDifficultyStars(?difficulty:Int):Void
{
difficultyStars.difficulty = difficulty;
}

/**
* Make the album stars visible.
*/
public function showStars():Void
{
difficultyStars.visible = true;
difficultyStars.flameCheck();
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
newAlbumArt.replaceSymbolGraphic(ALBUM_ART_SYMBOL, null);

super.destroy();
}
}
