package funkin.ui.debug.stageeditor.toolboxes;


class StageEditorStageToolbox extends StageEditorDefaultToolbox
{

override public function new(state:StageEditorState)
{
super(state);

stageNameText.onChange = function(_)
{
state.stageName = stageNameText.text;
state.saved = false;
}

stageZoomStepper.onChange = function(_)
{
state.stageZoom = stageZoomStepper.pos;
state.updateMarkerPos();
state.saved = false;
}


{
for (lib => idk in lime.utils.Assets.libraryPaths)
{
}
}
allLibs.sort(SortUtil.alphabetically); // this system is VERY stupid, it relies on the possibility that the future libraries will be named week(end)[x]

for (lib in allLibs)
{
stageLibraryDrop.dataSource.add({text: lib});
}

stageLibraryDrop.onChange = function(_)
{
state.stageFolder = stageLibraryDrop.selectedItem.text;
}

refresh();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stageEditorState.menubarItemWindowStage.selected = false;
}

override public function refresh()
{
stageNameText.text = stageEditorState.stageName;
stageZoomStepper.pos = stageEditorState.stageZoom;
stageLibraryDrop.selectedItem = stageEditorState.stageFolder;
}
}
