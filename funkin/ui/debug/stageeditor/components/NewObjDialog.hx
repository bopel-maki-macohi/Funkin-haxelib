

class NewObjDialog extends Dialog
{


override public function new(state:StageEditorState, img:BitmapData = null)
{


field.onChange = function(_)
{
}


}

public override function validateDialog(button:DialogButton, fn:Bool->Void)
{

{

{
NotificationManager.instance.addNotification({
title: "Problem Creating an Object",
body: objNames.contains(field.text) ? "Object with the Name " + field.text + " already exists!" : "Invalid Object Name!",
type: NotificationType.Error
}
else
{

{
}
else





NotificationManager.instance.addNotification({
title: "Object Creating Successful",
body: "Successfully created an Object with the Name " + field.text + "!",
type: NotificationType.Success
}
}
}
}
