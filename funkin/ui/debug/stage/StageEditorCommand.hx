package funkin.ui.debug.stage;


/**
* Very similar to eric's implementation
* see funkin.ui.debug.charting.ChartEditorCommand and ChartEditorState
* for more documentation since I am lazy to document!
*/
interface StageEditorCommand
{
public function execute(state:StageOffsetSubState):Void;
public function undo(state:StageOffsetSubState):Void;
public function toString():String;
}

class MovePropCommand implements StageEditorCommand
{

public function new(xDiff:Float = 0, yDiff:Float = 0, realMove:Bool = true)
{
this.xDiff = xDiff;
this.yDiff = yDiff;
this.realMove = realMove;
}

public function execute(state:StageOffsetSubState):Void
{
{
state.char.x += xDiff;
state.char.y += yDiff;
}
}

public function undo(state:StageOffsetSubState):Void
{
state.char.x -= xDiff;
state.char.y -= yDiff;
}

public function toString():String
{
}
}

class SelectPropCommand implements StageEditorCommand
{

public function new(prop:FlxSprite)
{
this.prop = prop;
}

public function execute(state:StageOffsetSubState):Void
{
this.prevProp = state.char;
state.char = prop;
}

public function undo(state:StageOffsetSubState):Void
{
state.char = this.prevProp;

}

public function toString():String
{
}
}
