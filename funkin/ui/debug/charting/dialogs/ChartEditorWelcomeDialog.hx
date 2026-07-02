

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


for (chartPath in chartEditorState.previousWorkingFilePaths)
{
}

}

/**
* @param state The current state of the chart editor.
* @return A newly created `ChartEditorWelcomeDialog`.
*/
public static function build(chartEditorState:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorWelcomeDialog
{
closable: closable ?? false,
modal: modal ?? true


}

public override function onClose(event:DialogEvent):Void
{
}

/**
* Add a file path to the "Open Recent" scroll box on the left.
* @param path
*/
public function addRecentFilePath(state:ChartEditorState, chartPath:String):Void
{



{
}
else
{
}

linkRecentChart.onClick = function(_event)
{


{
chartEditorState.success('Loaded Chart',
}
else
{
}
}

}

/**
* Add a string message to the "Open Recent" scroll box on the left.
* Only displays on platforms which don't support direct file system access.
*/
public function addHTML5RecentFileMessage():Void
{

}

/**
* Add all the links to the "Create From Template" scroll box on the right.
*/
public function buildTemplateSongList(state:ChartEditorState):Void
{

for (targetSongId in songList)
{

{
}

this.addTemplateSong(songName, targetSongId, (_) ->
{

}
}

/**
* @param loadTemplateCb The callback to call when the user clicks the link. The callback should load the song ID from the template.
*/
public function addTemplateSong(songName:String, songId:String, onClickCb:(MouseEvent) -> Void):Void
{

}

/**
* Called when the user clicks the "Browse Chart" button in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickButtonBrowse():Void
{

}

/**
* Called when the user clicks the "Create From Template: Easy/Normal/Hard Only" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateBasicOnly():Void
{

//
//
}

/**
* Called when the user clicks the "Create From Template: Erect/Nightmare Only" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateErectOnly():Void
{

//
//
}

/**
* Called when the user clicks the "Create From Template: Easy/Normal/Hard/Erect/Nightmare" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkCreateBasicErect():Void
{

//
//
}

/**
* Called when the user clicks on any "Import Chart" link in the dialog.
* Reassign this function to change the behavior.
*/
public function onClickLinkImport(format:String):Void
{

}
}
