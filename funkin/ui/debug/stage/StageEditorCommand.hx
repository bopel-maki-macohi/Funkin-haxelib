

/**
* Very similar to eric's implementation
* see funkin.ui.debug.charting.ChartEditorCommand and ChartEditorState
* for more documentation since I am lazy to document!
*/
interface StageEditorCommand
{
}

class MovePropCommand implements StageEditorCommand
{

public function new(xDiff:Float = 0, yDiff:Float = 0, realMove:Bool = true)
{
}

public function execute(state:StageOffsetSubState):Void
{
{
}
}

public function undo(state:StageOffsetSubState):Void
{
}

public function toString():String
{
}
}

class SelectPropCommand implements StageEditorCommand
{

public function new(prop:FlxSprite)
{
}

public function execute(state:StageOffsetSubState):Void
{
}

public function undo(state:StageOffsetSubState):Void
{

}

public function toString():String
{
}
}
