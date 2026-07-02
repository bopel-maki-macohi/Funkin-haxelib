

class LoadFromUrlDialog extends Dialog
{

override public function new(successCallback:Bytes->Void = null, failCallback:String->Void = null)
{



loader.addEventListener(Event.COMPLETE, function(event:Event)
{





loader.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent)
{


loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent)
{


}

override public function validateDialog(button:DialogButton, fn:Bool->Void)
{
{
}
else
{
}
}
}
