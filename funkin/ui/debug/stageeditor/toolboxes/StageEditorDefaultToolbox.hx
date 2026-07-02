package funkin.ui.debug.stageeditor.toolboxes;


class StageEditorDefaultToolbox extends CollapsibleDialog
{


private function new(stageEditorState:StageEditorState)
{
super();

this.stageEditorState = stageEditorState;

closable = true;
modal = true;
destroyOnClose = false;
}

/**
* Handles the Sound and Visibility
* @param on
*/
public function toggle(on:Bool)
{
else if (dialogVisible && !on) FunkinSound.playOnce(Paths.sound('chartingSounds/exitWindow'));

else
hide();

dialogVisible = on;
}

/**
* Override to implement this.
*/
public function refresh()
{
}
}
