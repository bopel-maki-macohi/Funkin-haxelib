package funkin.util.file;


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
audioInstTrack = loadSoundFromFNFCZipEntries(mappedFileEntries, audioInstTrackName);
}
catch (e)
{
throw 'Could not load instrumental: $audioInstTrackName';
}


for (playerVocalId in playerVocalList)
{
try
{
audioVocalTrackGroup.addPlayerVoice(audioVocalTrack);
}
catch (e)
{
throw 'Could not load vocals: $audioVocalTrackName';
}
}

for (opponentVocalId in opponentVocalList)
{
try
{
audioVocalTrackGroup.addOpponentVoice(audioVocalTrack);
}
catch (e)
{
throw 'Could not load vocals: $audioVocalTrackName';
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
targetState.vocals = audioVocalTrackGroup;
});
}

static function loadSoundFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>, soundName:String):FunkinSound
{


}

static function loadChartManifestFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>):ChartManifestData
{



}

static function loadSongFromFNFCZipEntries(mappedFileEntries:Map<String, haxe.zip.Entry>, manifest:ChartManifestData):Song
{


baseMetadataVersion) ?? throw 'Could not read metadata (default).';

songMetadatas.set(Constants.DEFAULT_VARIATION, baseMetadata);


baseChartDataVersion) ?? throw 'Could not read chart data (default).';

songChartDatas.set(Constants.DEFAULT_VARIATION, baseChartData);



for (variation in variationList)
{

songMetadatas.set(variation, variMetadata);


songChartDatas.set(variation, variChartData);
}


}
}
