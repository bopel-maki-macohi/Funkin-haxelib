package funkin.ui.debug.charting.toolboxes;


/**
* The toolbox which allows viewing the list of difficulties, switching to a specific one,
* and adding/removing variations and difficulties.
*/
class ChartEditorDifficultyToolbox extends ChartEditorBaseToolbox
{

public function new(chartEditorState2:ChartEditorState)
{
super(chartEditorState2);

initialize();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
chartEditorState.menubarItemToggleToolboxDifficulty.selected = false;
}

function initialize():Void
{
this.x = 150;
this.y = 250;

difficultyToolboxAddVariation.onClick = function(_:UIEvent)
{
chartEditorState.openAddVariationDialog(true);
};

difficultyToolboxAddDifficulty.onClick = function(_:UIEvent)
{
chartEditorState.openAddDifficultyDialog(true);
};

difficultyToolboxCloneDifficulty.onClick = function(_:UIEvent)
{
chartEditorState.openCloneDifficultyDialog(false, true);
};

difficultyToolboxMoveDifficulty.onClick = function(_:UIEvent)
{
chartEditorState.openCloneDifficultyDialog(true, true);
};

difficultyToolboxRemoveDifficulty.onClick = function(_:UIEvent)
{


{
switch (button)
{
case DialogButton.YES:
chartEditorState.removeDifficulty(currentVariation, currentDifficulty);
refresh();
case DialogButton.NO: // Do nothing.
default: // Do nothing.
}
}

Dialogs.messageBox("Are you sure? This cannot be undone.", "Remove Difficulty", MessageBoxType.TYPE_YESNO, callback);
};

difficultyToolboxSaveMetadata.onClick = function(_:UIEvent)
{
FileUtil.writeFileReference('${chartEditorState.currentSongId}$vari-metadata.json', chartEditorState.currentSongMetadata.serialize(),
function(notification:String)
{
switch (notification)
{
case "success":
chartEditorState.success("Saved Metadata", 'Successfully wrote file (${chartEditorState.currentSongId}$vari-metadata.json).');
case "info":
chartEditorState.info("Canceled Save Metadata", '(${chartEditorState.currentSongId}$vari-metadata.json)');
case "error":
chartEditorState.error("Failure", 'Failed to write file (${chartEditorState.currentSongId}$vari-metadata.json).');
}
});
};

difficultyToolboxSaveChart.onClick = function(_:UIEvent)
{
FileUtil.writeFileReference('${chartEditorState.currentSongId}$vari-chart.json', chartEditorState.currentSongChartData.serialize(),
function(notification:String)
{
switch (notification)
{
case "success":
chartEditorState.success("Saved Chart Data", 'Successfully wrote file (${chartEditorState.currentSongId}$vari-chart.json).');
case "info":
chartEditorState.info("Canceled Save Chart Data", '(${chartEditorState.currentSongId}$vari-chart.json)');
case "error":
chartEditorState.error("Failure", 'Failed to write file (${chartEditorState.currentSongId}$vari-chart.json).');
}
});
};

difficultyToolboxLoadMetadata.onClick = function(_:UIEvent)
{
FileUtil.browseFileReference(function(fileReference:FileReference)
{



SongRegistry.SONG_METADATA_VERSION_RULE)) songMetadata = SongRegistry.instance.parseEntryMetadataRawWithMigration(data, fileReference.name,
songMetadataVersion);

{
chartEditorState.currentSongMetadata = songMetadata;
chartEditorState.healthIconsDirty = true;
chartEditorState.playerPreviewDirty = true;
chartEditorState.opponentPreviewDirty = true;

chartEditorState.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
chartEditorState.success('Replaced Metadata', 'Replaced metadata with file (${fileReference.name})');
}
else
{
chartEditorState.error('Failure', 'Failed to load metadata file (${fileReference.name})');
}
});
};

difficultyToolboxLoadChart.onClick = function(_:UIEvent)
{
FileUtil.browseFileReference(function(fileReference:FileReference)
{



SongRegistry.SONG_CHART_DATA_VERSION_RULE)) songChartData = SongRegistry.instance.parseEntryChartDataRawWithMigration(data, fileReference.name,
songChartDataVersion);

{
chartEditorState.currentSongChartData = songChartData;
chartEditorState.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
updateTree();
refresh();
chartEditorState.success('Loaded Chart Data', 'Loaded chart data file (${fileReference.name})');
chartEditorState.noteDisplayDirty = true;
chartEditorState.notePreviewDirty = true;
chartEditorState.noteTooltipsDirty = true;
chartEditorState.notePreviewViewportBoundsDirty = true;
}
else
{
chartEditorState.error('Failure', 'Failed to load chart data file (${fileReference.name})');
}
});
};

refresh();
}

/**
* Clear the tree view and rebuild it with the current song metadata (variation and difficulty list).
*/
public function updateTree():Void
{
difficultyToolboxTree.clearNodes();

treeSong.expanded = true;

for (curVariation in chartEditorState.availableVariations)
{

id: 'stv_variation_$curVariation',
text: 'V: ${curVariation.toTitleCase()}'
});
treeVariation.expanded = true;


for (difficulty in difficultyList)
{
id: 'stv_difficulty_${curVariation}_$difficulty',
text: 'D: ${difficulty.toTitleCase()}'
});
}
}

difficultyToolboxTree.onChange = onTreeChange;
refreshTreeSelection();
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
'id');
}

/**
* Called when an item in the tree is selected. Updates the current variation/difficulty.
*/
function onTreeChange(event:UIEvent):Void
{

{
refreshTreeSelection();
}

switch (targetNode.data.id.split('_')[1])
{
case 'difficulty':

{

chartEditorState.performCommand(new SwitchDifficultyCommand(chartEditorState.selectedDifficulty, difficulty, chartEditorState.selectedVariation,

refreshTreeSelection();
}
default:
refreshTreeSelection();
chartEditorState.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
}
}

public override function refresh():Void
{
super.refresh();

refreshTreeSelection();
}

public static function build(chartEditorState:ChartEditorState):ChartEditorDifficultyToolbox
{
}
}
