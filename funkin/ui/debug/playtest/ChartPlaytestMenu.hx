package funkin.ui.debug.playtest;


/**
* When playtesting from an FNFC file, we display a debug UI to choose a difficulty first.
*/
class ChartPlaytestMenu extends MusicBeatState
{




public function new(filePath:String)
{

super();


playtestCam = new FunkinCamera('playtestCam');
playtestCam.bgColor = 0x0;

blackBG.makeSolidColor(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
blackBG.scrollFactor.set();
blackBG.alpha = 0.4;
blackBG.cameras = [playtestCam];
add(blackBG);

this.filePath = filePath;

songName = new FlxText(0, FlxG.height * 0.1, 0, 'Loaded Song: ${targetSong.songName}',
30).setFormat(Paths.font('vcr.ttf'), 50, FlxColor.WHITE, FlxTextAlign.CENTER);
songName.screenCenter(X);
songName.cameras = [playtestCam];
add(songName);

{
currentVariation = value;
});
add(variationButton);

difficultyButton = new ChartPlaytestMenuButtonListToggle(0, FlxG.height * 0.45, "Difficulty",
targetSong.listDifficulties(null, targetSong.variations, true, true), function(value:String)
{
currentDifficulty = value;
difficultyButton.screenCenter(X);
});
difficultyButton.screenCenter(X);
difficultyButton.cameras = [playtestCam];
add(difficultyButton);

playtestButton = new ChartPlaytestMenuButton(0, FlxG.height * 0.8, "Playtest Song", function()
{
try
{
FNFCUtil.playSongFromFNFCPath(filePath, currentDifficulty, currentVariation);
}
catch (e)
{
}
});
playtestButton.screenCenter(X);
playtestButton.cameras = [playtestCam];
add(playtestButton);

FlxTween.tween(playtestCam, {alpha: 1}, 0.5);

Cursor.show();
}
}
