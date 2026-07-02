package funkin.ui.debug.charting.dialogs;


/**
* Builds and opens a dialog letting the user create a new chart, open a recent chart, or load from a template.
* Opens when the chart editor first opens.
*/
class ChartEditorWelcomeDialog extends ChartEditorBaseDialog
{
/**
* @param closable Whether the dialog can be closed by the user.
* @param modal Whether the dialog is locked to the center of the screen (with a dark overlay behind it).
*/
public function new(state2:ChartEditorState, params2:DialogParams)
{
super(state2, params2);

this.splashBrowse.onClick = _ -> onClickButtonBrowse();
this.splashCreateFromSongBasicOnly.onClick = _ -> onClickLinkCreateBasicOnly();
this.splashCreateFromSongErectOnly.onClick = _ -> onClickLinkCreateErectOnly();
this.splashCreateFromSongBasicErect.onClick = _ -> onClickLinkCreateBasicErect();
this.splashImportChartLegacy.onClick = _ -> onClickLinkImport("legacy");
this.splashImportChartOsuMania.onClick = _ -> onClickLinkImport("osumania");
this.splashImportChartStepMania.onClick = _ -> onClickLinkImport('stepmania');

for (chartPath in chartEditorState.previousWorkingFilePaths)
{
this.addRecentFilePath(chartEditorState, chartPath);
}
this.addHTML5RecentFileMessage();

this.buildTemplateSongList(chartEditorState);
}

/**
* @param state The current state of the chart editor.
* @return A newly created `ChartEditorWelcomeDialog`.
*/
public static function build(chartEditorState:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorWelcomeDialog
{
closable: closable ?? false,
modal: modal ?? true
});

dialog.showDialog(modal ?? true);

}

public override function onClose(event:DialogEvent):Void
{
super.onClose(event);
}

/**
* Add a file path to the "Open Recent" scroll box on the left.
* @param path
*/
public function addRecentFilePath(state:ChartEditorState, chartPath:String):Void
{

linkRecentChart.text = fileName;

linkRecentChart.tooltip = chartPath;

{
linkRecentChart.disabled = true;
}
else
{
linkRecentChart.tooltip += "\n" + lastModified;
}

linkRecentChart.onClick = function(_event)
{
linkRecentChart.hide();

this.hideDialog(DialogButton.CANCEL);

{
chartEditorState.success('Loaded Chart',
result.length == 0 ? 'Loaded chart (${chartPath.toString()})' : 'Loaded chart (${chartPath.toString()})\n${result.join("\n")}');
}
else
{
chartEditorState.error('Failed to Load Chart', 'Failed to load chart (${chartPath.toString()})');
}
}

splashRecentContainer.addComponent(linkRecentChart);
}

/**
* Add a string message to the "Open Recent" scroll box on the left.
* Only displays on platforms which don't support direct file system access.
*/
public function addHTML5RecentFileMessage():Void
{
webLoadLabel.text = 'Click the button below to load a chart file (.fnfc) from your computer.';

splashRecentContainer.addComponent(webLoadLabel);
}

/**
* Add all the links to the "Create From Template" scroll box on the right.
*/
public function buildTemplateSongList(state:ChartEditorState):Void
{
songList.sort(SortUtil.alphabetically);

for (targetSongId in songList)
{

{
continue;
}

this.addTemplateSong(songName, targetSongId, (_) ->
{
this.hideDialog(DialogButton.CANCEL);

chartEditorState.loadSongAsTemplate(targetSongId);
});
}
}

/**
* @param loadTemplateCb The callback to call when the user clicks the link. The callback should load the song ID from the template.
*/
public function addTemplateSong(songName:String, songId:String, onClickCb:(MouseEvent) -> Void):Void
{
linkTemplateSong.text = songName;
linkTemplateSong.onClick = onClickCb;

this.splashTemplateContainer.addComponent(linkTemplateSong);
}

/**
* Called when the user clicks the "Browse Chart" button in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickButtonBrowse():Void
{
this.hideDialog(DialogButton.CANCEL);

chartEditorState.openBrowseFNFC(false);
}

/**
* Called when the user clicks the "Create From Template: Easy/Normal/Hard Only" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateBasicOnly():Void
{
this.hideDialog(DialogButton.CANCEL);

//
//
chartEditorState.openCreateSongWizardBasicOnly(false);
}

/**
* Called when the user clicks the "Create From Template: Erect/Nightmare Only" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateErectOnly():Void
{
this.hideDialog(DialogButton.CANCEL);

//
//
chartEditorState.openCreateSongWizardErectOnly(false);
}

/**
* Called when the user clicks the "Create From Template: Easy/Normal/Hard/Erect/Nightmare" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateBasicErect():Void
{
this.hideDialog(DialogButton.CANCEL);

//
//
chartEditorState.openCreateSongWizardBasicErect(false);
}

/**
* Called when the user clicks on any "Import Chart" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkImport(format:String):Void
{
this.hideDialog(DialogButton.CANCEL);

chartEditorState.openImportChartWizard(format, false);
}
}
