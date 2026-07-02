


class ChartEditorBaseDialog extends Dialog
{


public function new(chartEditorState:ChartEditorState, params:DialogParams)
{



}

public override function showDialog(modal:Bool = true):Void
{
}

private override function onReady():Void
{
}

/**
* Called when the dialog is closed.
* Override this to add custom behavior.
*/
public function onClose(event:DialogEvent):Void
{
}

/**
* Locks this dialog from interaction.
* Use this when you want to prevent dialog interaction while another dialog is open.
*/
public function lock():Void
{

}

/**
* Unlocks the dialog for interaction.
*/
public function unlock():Void
{

}


function fadeInDialogOverlay():Void
{
{
}

{
}

}

function fadeInComponent(component:Component, fadeTo:Float = 1):Void
{
builder.setPosition(0, "opacity", 0, true); // 0% absolute

}
}

typedef DialogParams =
{
?closable:Bool,
?modal:Bool

typedef DialogDropTarget =
{
component:Component,
handler:String->Void
}
