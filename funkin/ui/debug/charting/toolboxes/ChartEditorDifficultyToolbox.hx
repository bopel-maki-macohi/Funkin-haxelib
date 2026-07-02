

/**
* The toolbox which allows viewing the list of difficulties, switching to a specific one,
* and adding/removing variations and difficulties.
*/
class ChartEditorDifficultyToolbox extends ChartEditorBaseToolbox
{

public function new(chartEditorState2:ChartEditorState)
{


}

function onClose(event:UIEvent)
{
}

function initialize():Void
{

difficultyToolboxAddVariation.onClick = function(_:UIEvent)
{

difficultyToolboxAddDifficulty.onClick = function(_:UIEvent)
{

difficultyToolboxCloneDifficulty.onClick = function(_:UIEvent)
{

difficultyToolboxMoveDifficulty.onClick = function(_:UIEvent)
{

difficultyToolboxRemoveDifficulty.onClick = function(_:UIEvent)
{


{
switch (button)
{
case DialogButton.YES:
case DialogButton.NO: // Do nothing.
default: // Do nothing.
}
}


difficultyToolboxSaveMetadata.onClick = function(_:UIEvent)
{
FileUtil.writeFileReference('${chartEditorState.currentSongId}$vari-metadata.json', chartEditorState.currentSongMetadata.serialize(),
function(notification:String)
{
switch (notification)
{
case "success":
case "info":
case "error":
}

difficultyToolboxSaveChart.onClick = function(_:UIEvent)
{
FileUtil.writeFileReference('${chartEditorState.currentSongId}$vari-chart.json', chartEditorState.currentSongChartData.serialize(),
function(notification:String)
{
switch (notification)
{
case "success":
case "info":
case "error":
}

difficultyToolboxLoadMetadata.onClick = function(_:UIEvent)
{
FileUtil.browseFileReference(function(fileReference:FileReference)
{



SongRegistry.SONG_METADATA_VERSION_RULE)) songMetadata = SongRegistry.instance.parseEntryMetadataRawWithMigration(data, fileReference.name,

{

}
else
{
}

difficultyToolboxLoadChart.onClick = function(_:UIEvent)
{
FileUtil.browseFileReference(function(fileReference:FileReference)
{



SongRegistry.SONG_CHART_DATA_VERSION_RULE)) songChartData = SongRegistry.instance.parseEntryChartDataRawWithMigration(data, fileReference.name,

{
}
else
{
}

}

/**
* Clear the tree view and rebuild it with the current song metadata (variation and difficulty list).
*/
public function updateTree():Void
{


for (curVariation in chartEditorState.availableVariations)
{

id: 'stv_variation_$curVariation',
text: 'V: ${curVariation.toTitleCase()}'


for (difficulty in difficultyList)
{
id: 'stv_difficulty_${curVariation}_$difficulty',
text: 'D: ${difficulty.toTitleCase()}'
}
}

}

/**
* Set the selected item in the tree to the current variation/difficulty.
*
* @param targetNode The node to select. If null, the current variation/difficulty will be used.
*/
public function refreshTreeSelection():Void
{
}

/**
* Get the node in the tree representing the current variation/difficulty.
*/
function getCurrentTreeNode():TreeViewNode
{
difficultyToolboxTree.findNodeByPath('stv_song/stv_variation_$chartEditorState.selectedVariation/stv_difficulty_${chartEditorState.selectedVariation}_$chartEditorState.selectedDifficulty',
}

/**
* Called when an item in the tree is selected. Updates the current variation/difficulty.
*/
function onTreeChange(event:UIEvent):Void
{

{
}

switch (targetNode.data.id.split('_')[1])
{
case 'difficulty':

{

chartEditorState.performCommand(new SwitchDifficultyCommand(chartEditorState.selectedDifficulty, difficulty, chartEditorState.selectedVariation,

}
default:
}
}

public override function refresh():Void
{

}

public static function build(chartEditorState:ChartEditorState):ChartEditorDifficultyToolbox
{
}
}
