

class LoadingState extends MusicBeatSubState
{




function new(target:NextState, stopMusic:Bool, ?playParams:PlayStateParams)
{

}

override function create():Void
{



initSongsManifest().onComplete(function(lib)
{

{
{
}


{
}

for (voicePath in voicesPaths)
{
}
}


}

function checkLoadSong(path:String):Void
{
{
Assets.loadSound(path).onComplete(function(_)
{
}
}

function checkLibrary(library:String):Void
{
{

Assets.loadLibrary(library).onComplete(function(_)
{
}
}

override function beatHit():Bool
{


}


override function update(elapsed:Float):Void
{


{
}

{

{
}
}
}

function onLoad():Void
{
{
}

{
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



{

{
playStateCtor = function()
{
}

{
}
{
}
else
{
}
{
}

{
}


{

{
}

{


for (sprite in spritesToCache)
{
{
}
}

for (sound in soundsToCache)
{
new Future<String>(function()
{
}
}
}

{
}
else
{
{
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

}

static function initSongsManifest():Future<AssetLibrary>
{


{
}


{
}
else
{
{
}
else
{
}
}

AssetManifest.loadFromFile(path, rootPath).onComplete(function(manifest)
{
{
}


{
}
else
{
}
}).onError(function(_)
{

}

public static function transitionToState(state:NextState, stopMusic:Bool = false):Void
{
}
}

class MultiCallback
{


public function new(callback:Void->Void, ?logId:String)
{
}

public function add(id = 'untitled'):Void->Void
{
{
{


{
}
}
else
}
}

inline function log(msg):Void
{
}



/**
* Perform an FlxG.switchState with a nice transition
* @param state
* @param transitionTex
* @param time
*/
public static function coolSwitchState(state:NextState, transitionTex:String = "shaderTransitionStuff/coolDots", time:Float = 2)
{

FlxTween.tween(screenWipeShit, {daAlphaShit: 1}, time, {
ease: FlxEase.quadInOut,
onComplete: function(twn)
{
}
}
}
