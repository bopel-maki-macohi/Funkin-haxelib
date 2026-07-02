package funkin.ui.debug.charting.dialogs;



class ChartEditorBaseDialog extends Dialog
{


public function new(chartEditorState:ChartEditorState, params:DialogParams)
{
super();

this.chartEditorState = chartEditorState;
this.params = params;

this.destroyOnClose = true;
this.closable = params.closable ?? false;

this.onDialogClosed = event -> onClose(event);
}

public override function showDialog(modal:Bool = true):Void
{
super.showDialog(modal);
fadeInComponent(this, 1);
}

private override function onReady():Void
{
_overlay.opacity = 0;
fadeInDialogOverlay();
}

/**
* Called when the dialog is closed.
* Override this to add custom behavior.
*/
public function onClose(event:DialogEvent):Void
{
chartEditorState.isHaxeUIDialogOpen = false;
}

/**
* Locks this dialog from interaction.
* Use this when you want to prevent dialog interaction while another dialog is open.
*/
public function lock():Void
{
this.locked = true;

this.closable = false;
}

/**
* Unlocks the dialog for interaction.
*/
public function unlock():Void
{
this.locked = false;

this.closable = params.closable ?? false;
}


function fadeInDialogOverlay():Void
{
{
}

{
}

fadeInComponent(_overlay, 0.5);
}

function fadeInComponent(component:Component, fadeTo:Float = 1):Void
{
builder.setPosition(0, "opacity", 0, true); // 0% absolute
builder.setPosition(100, "opacity", fadeTo, true);

builder.play();
}
}

typedef DialogParams =
{
?closable:Bool,
?modal:Bool
};

typedef DialogDropTarget =
{
component:Component,
handler:String->Void
}
