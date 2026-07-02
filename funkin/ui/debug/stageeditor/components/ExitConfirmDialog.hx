package funkin.ui.debug.stageeditor.components;


class ExitConfirmDialog extends Dialog
{

override public function new(onComp:Void->Void)
{
super();

onComplete = onComp;

buttons = DialogButton.CANCEL | "{{Proceed}}";
defaultButton = "{{Proceed}}";

destroyOnClose = true;
}

public override function validateDialog(button:DialogButton, fn:Bool->Void)
{
{
onComplete();
}

fn(true);
}
}
