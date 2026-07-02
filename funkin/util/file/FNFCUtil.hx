

/**
* Utility functions for interacting with .FNFC files.
*/
class FNFCUtil
{
/**
* Loads a song from
* @param fnfcPath The absolute file path to the .FNFC file to load.
*/
public static function loadSongFromFNFCPath(fnfcPath:String):Song
{


}

/**
* Open a song's chart from a .FNFC file and play it in the Play State.
* @param fnfcPath The absolute file path to the .FNFC file to load.
* @param difficulty The difficulty level to play.
* @param variation The variation of the song to play, such as "default", "erect", or "pico".
*/
public static function playSongFromFNFCPath(fnfcPath:String, difficulty:String, variation:String):Void
{





try
{
}
catch (e)
{
}


for (playerVocalId in playerVocalList)
{
try
{
}
catch (e)
{
}
}

for (opponentVocalId in opponentVocalList)
{
try
{
}
catch (e)
{
}
}

LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: difficulty,
targetVariation: variation,
practiceMode: false,
botPlayMode: false,
minimalMode: false,
startTimestamp: 0,
playbackRate: 1,
overrideMusic: true,
}, false, true, function(targetState)
{
}

static function loadSoundFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>, soundName:String):FunkinSound
{


}

static function loadChartManifestFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>):ChartManifestData
{



}

static function loadSongFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>, manifest:ChartManifestData):Song
{









for (variation in variationList)
{



}


}
}
