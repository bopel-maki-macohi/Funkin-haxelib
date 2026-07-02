package funkin.ui.transition;


class LoadingState extends MusicBeatSubState
{
inline static var MIN_TIME = 1.0;




function new(target:NextState, stopMusic:Bool, ?playParams:PlayStateParams)
{
super();
this.target = target;
this.playParams = playParams;
this.stopMusic = stopMusic;

this.loadBar = new FunkinSprite(0, FlxG.height - 20).makeSolidColor(0, 10, 0xFFff16d2);
this.funkay = FunkinSprite.create('funkay');
}

override function create():Void
{
add(bg);

funkay.setGraphicSize(0, FlxG.height);
funkay.updateHitbox();
add(funkay);
funkay.scrollFactor.set();
funkay.screenCenter();

add(loadBar);

initSongsManifest().onComplete(function(lib)
{
callbacks = new MultiCallback(onLoad);

{
{
throw 'Invalid parameter: Target song should not be null';
}

playParams.targetSong.cacheCharts(true);

{
throw 'Couldn\'t retrieve chart data for song "${playParams.targetSong.songName}" on difficulty "$difficulty" and variation "$variation"';
}

checkLoadSong(instPath);
for (voicePath in voicesPaths)
{
checkLoadSong(voicePath);
}
}

checkLibrary('shared');
checkLibrary('videos');
checkLibrary(stageDirectory);
checkLibrary('tutorial');

new FlxTimer().start(fadeTime + MIN_TIME, function(_) introComplete());
});
}

function checkLoadSong(path:String):Void
{
{
Assets.loadSound(path).onComplete(function(_)
{
});
}
}

function checkLibrary(library:String):Void
{
{

Assets.loadLibrary(library).onComplete(function(_)
{
});
}
}

override function beatHit():Bool
{

danceLeft = !danceLeft;

}


override function update(elapsed:Float):Void
{
super.update(elapsed);

funkay.setGraphicSize(Std.int(FlxMath.lerp(FlxG.width * 0.88, funkay.width, 0.9)));
funkay.updateHitbox();

{
funkay.setGraphicSize(Std.int(funkay.width + 60));
funkay.updateHitbox();
}

{
targetShit = FlxMath.remapToRange(callbacks.numRemaining / callbacks.length, 1, 0, 0, 1);

{
loadBar.setGraphicSize(lerpWidth, loadBar.height);
loadBar.updateHitbox();
}
}
}

function onLoad():Void
{
{
}

{
this.close();
}
else
{
}
}

static function getSongPath():String
{
}


/**
* Starts the transition to a new `PlayState` to start a new song.
* First switches to the `LoadingState` if assets need to be loaded.
* @param params The parameters for the next `PlayState`.
* @param asSubState Whether to open as a substate rather than switching to the `PlayState`.
* @param shouldStopMusic Whether to stop the current music while loading.
*/
public static function loadPlayState(params:PlayStateParams, shouldStopMusic = false, asSubState = false, ?onConstruct:PlayState->Void):Void
{
params.targetVariation ?? Constants.DEFAULT_VARIATION);

stageDirectory = daStage?._data?.directory ?? "shared";
Paths.setCurrentLevel(stageDirectory);


{
};

{
playStateCtor = function()
{
onConstruct(result);
};
}

{
result.asSubState = asSubState;
}
{
}
else
{
}
{
}

{
params.targetSong.cacheCharts(true);
}


{
preloadLevelAssets();

{
FunkinMemory.cacheNoteStyle(noteStyle);
}

{


for (sprite in spritesToCache)
{
funkin.FunkinMemory.cacheTexture(path);
{
openfl.Assets.getBitmapData(path, true);
}
}

for (sound in soundsToCache)
{
new Future<String>(function()
{
funkin.FunkinMemory.cacheSound(path);
}, true);
}
}
}

{
}
else
{
{
funkin.FunkinMemory.clearFreeplay();
funkin.FunkinMemory.purgeCache(true);
});
}
}

static function isSoundLoaded(path:String):Bool
{
}

static function isLibraryLoaded(library:String):Bool
{
}
static function preloadLevelAssets():Void
{









}

override function destroy():Void
{
super.destroy();

callbacks = null;
}

static function initSongsManifest():Future<AssetLibrary>
{


{
}


{
path = libraryPaths[id] ?? path;
rootPath = Path.directory(path);
}
else
{
{
rootPath = path;
path += '/library.json';
}
else
{
rootPath = Path.directory(path);
}
path = LimeAssets.__cacheBreak(path);
}

AssetManifest.loadFromFile(path, rootPath).onComplete(function(manifest)
{
{
promise.error('Cannot parse asset manifest for library \'' + id + '\'');
}


{
promise.error('Cannot open library \'' + id + '\'');
}
else
{
LimeAssets.libraries.set(id, library);
library.onChange.add(LimeAssets.onChange.dispatch);
promise.completeWith(Future.withValue(library));
}
}).onError(function(_)
{
promise.error('There is no asset library with an ID of \'' + id + '\'');
});

}

public static function transitionToState(state:NextState, stopMusic:Bool = false):Void
{
}
}

class MultiCallback
{


public function new(callback:Void->Void, ?logId:String)
{
this.callback = callback;
this.logId = logId;
}

public function add(id = 'untitled'):Void->Void
{
id = '$length:$id';
length++;
numRemaining++;
{
{
unfired.remove(id);
fired.push(id);
numRemaining--;


{
callback();
}
}
else
log('already fired $id');
}
unfired[id] = func;
}

inline function log(msg):Void
{
}

public function getFired():Array<String> return fired.copy();

public function getUnfired():Array<Void->Void> return unfired.array();

/**
* Perform an FlxG.switchState with a nice transition
* @param state
* @param transitionTex
* @param time
*/
public static function coolSwitchState(state:NextState, transitionTex:String = "shaderTransitionStuff/coolDots", time:Float = 2)
{

screenWipeShit.funnyShit.input = screenShit.pixels;
FlxTween.tween(screenWipeShit, {daAlphaShit: 1}, time, {
ease: FlxEase.quadInOut,
onComplete: function(twn)
{
screenShit.destroy();
}
});
}
}
