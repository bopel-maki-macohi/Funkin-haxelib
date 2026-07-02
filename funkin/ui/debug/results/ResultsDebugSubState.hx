

/**
* Debug substate to configure the results screen for testing purposes,
* allowing you to set the score, rank, character, and other parameters.
*/
class ResultsDebugSubState extends MusicBeatSubState
{

override function create():Void
{



}


function createItems():Void
{
createTextItem("TEST RESULTS SCREEN", function()
{
new FlxTimer().start(0.5, function(_)
{
{
resultState.closeCallback = function()
{
}
else
createToggleListItem("Character", PlayerRegistry.instance.listEntryIds(), function(result:String)
{
createToggleListItem("Results Mode", ["Debug", "Story", "Freeplay"], function(result:String)
{
resultsParams.storyMode = result == "Story"; // Debug overrides this, but if not using Debug, we will return to either Freeplay or Story menus
createToggleListItem("Ranking", DebugTallies.DEBUG_RANKS, function(result:String)
{
createToggleListItem("Force Rank Slam (Freeplay Only)", ["No", "Yes"], function(result:String)
{
}

function createTextItem(name:String, ?onChange:Void->Void):MenuTypedItem<FlxText>
{

}

function createCheckboxItem(name:String, ?onChange:Bool->Void):Void
{
menuItem.callback = function()
{
}

/**
* Toggles between different options in a list
* @param name
* @param toggleList
* @param onChange
* @return MenuTypedItem<FlxText>
*/
function createToggleListItem(name:String, toggleList:Array<String>, ?onChange:String->Void):MenuTypedItem<FlxText>
{

{

menuItem.callback = function()
{

}

function initResultsParams():Void
{
resultsParams = {
storyMode: false,
title: "Cum Song Erect by Kawai Sprite",
songId: "cum",
characterId: "bf",
difficultyId: "nightmare",
isNewHighscore: true,
isPracticeMode: true, // Invalidates achievements/scores.
isBotPlayMode: true, // Invalidates achievements/scores.
scoreData: {
score: 1_234_567_890,
tallies: {
sick: 130,
good: 60,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 140,
totalNotes: 190
}
},
}
}
