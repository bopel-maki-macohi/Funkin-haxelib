
/**
* Switch the current difficulty (and possibly variation) of the chart in the chart editor.
*/
class SwitchDifficultyCommand implements ChartEditorCommand
{

public function new(prevDifficulty:String, newDifficulty:String, prevVariation:String, newVariation:String)
{
}

/**
* Perform the difficulty switch.
* @param state The ChartEditorState to perform the action on.
*/
public function execute(state:ChartEditorState):Void
{

}

/**
* Reverse the difficulty switch.
* @param state The ChartEditorState to perform the action on.
*/
public function undo(state:ChartEditorState):Void
{

}

function markDirty(state:ChartEditorState):Void
{
}

/**
* @param state The ChartEditorState to perform the action on.
* @return Whether or not this instance of the command should be added to the history.
*   If the command didn't actually change anything, return `false` to prevent polluting the history.
*/
public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
