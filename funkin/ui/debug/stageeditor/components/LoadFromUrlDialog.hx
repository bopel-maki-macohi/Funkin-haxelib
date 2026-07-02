package funkin.ui.debug.stageeditor.components;


class LoadFromUrlDialog extends Dialog
{

override public function new(successCallback:Bytes->Void = null, failCallback:String->Void = null)
{
super();
destroyOnClose = true;

loader = new URLLoader();
loader.dataFormat = BINARY;

urlField.text = "";

loader.addEventListener(Event.COMPLETE, function(event:Event)
{



loader.__removeAllListeners();

hideDialog(DialogButton.CANCEL);
});

loader.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent)
{

});

loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent)
{

});

buttons = DialogButton.CANCEL | "{{Load}}";
defaultButton = "{{Load}}";
}

override public function validateDialog(button:DialogButton, fn:Bool->Void)
{
{
fn(true);
}
else
{
loader.load(new URLRequest(urlField.text));
}
}
}
