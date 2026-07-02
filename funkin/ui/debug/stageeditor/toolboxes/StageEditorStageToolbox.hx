

class StageEditorStageToolbox extends StageEditorDefaultToolbox
{

override public function new(state:StageEditorState)
{

stageNameText.onChange = function(_)
{
}

stageZoomStepper.onChange = function(_)
{
}


{
for (lib => idk in lime.utils.Assets.libraryPaths)
{
}
}
allLibs.sort(SortUtil.alphabetically); // this system is VERY stupid, it relies on the possibility that the future libraries will be named week(end)[x]

for (lib in allLibs)
{
}

stageLibraryDrop.onChange = function(_)
{
}


}

function onClose(event:UIEvent)
{
}

override public function refresh()
{
}
}
