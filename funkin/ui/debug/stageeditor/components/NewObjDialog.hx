package funkin.ui.debug.stageeditor.components;


class NewObjDialog extends Dialog
{


override public function new(state:StageEditorState, img:BitmapData = null)
{
super();

stageEditorState = state;
bitmap = img;

field.onChange = function(_)
{
field.removeClasses(["invalid-value", "valid-value"]);
}

buttons = DialogButton.CANCEL | "{{Create}}";
defaultButton = "{{Create}}";

destroyOnClose = true;
}

public override function validateDialog(button:DialogButton, fn:Bool->Void)
{

{

{
field.swapClass("invalid-value", "valid-value");
done = false;
NotificationManager.instance.addNotification({
title: "Problem Creating an Object",
body: objNames.contains(field.text) ? "Object with the Name " + field.text + " already exists!" : "Invalid Object Name!",
type: NotificationType.Error
});
}
else
{

{
spr.loadGraphic(stageEditorState.bitmaps[bitToLoad]);
}
else
spr.loadGraphic(AssetDataHandler.getDefaultGraphic());

spr.name = field.text;
spr.screenCenter();

spr.zIndex = sprArray.length == 0 ? 0 : (sprArray[sprArray.length - 1].zIndex + 1);

stageEditorState.selectedSprite = spr;
stageEditorState.createAndPushAction(OBJECT_CREATED);

stageEditorState.add(spr);
stageEditorState.updateArray();
stageEditorState.saved = false;

NotificationManager.instance.addNotification({
title: "Object Creating Successful",
body: "Successfully created an Object with the Name " + field.text + "!",
type: NotificationType.Success
});
}
}
fn(done);
}
}
