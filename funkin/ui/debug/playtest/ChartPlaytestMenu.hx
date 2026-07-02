

/**
* When playtesting from an FNFC file, we display a debug UI to choose a difficulty first.
*/
class ChartPlaytestMenu extends MusicBeatState
{




public function new(filePath:String)
{






songName = new FlxText(0, FlxG.height * 0.1, 0, 'Loaded Song: ${targetSong.songName}',

{

difficultyButton = new ChartPlaytestMenuButtonListToggle(0, FlxG.height * 0.45, "Difficulty",
targetSong.listDifficulties(null, targetSong.variations, true, true), function(value:String)
{

playtestButton = new ChartPlaytestMenuButton(0, FlxG.height * 0.8, "Playtest Song", function()
{
try
{
}
catch (e)
{
}


}
}
