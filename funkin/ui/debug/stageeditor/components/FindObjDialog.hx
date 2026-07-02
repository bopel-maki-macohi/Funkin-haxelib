package funkin.ui.debug.stageeditor.components;


class FindObjDialog extends Dialog
{



override public function new(state:StageEditorState, searchFor:String = "")
{
super();

stageEditorState = state;
nameField.text = searchFor;

this.field = nameField;
this.checkWord = wordCheck;
this.checkCaps = capsCheck;

field.onChange = function(_) updateIndicator();
indicator.hide();

top = 20;
left = FlxG.width - width - 20;

buttons = DialogButton.CANCEL | "{{Find Next}}";
defaultButton = "{{Find Next}}";
}

public function updateIndicator()
{

assets = [];

for (ass in stageEditorState.spriteArray)
{

{
name = name.toLowerCase();
checkFor = checkFor.toLowerCase();
}

}

{
stageEditorState.selectedSprite = assets[0];
}

{
indicator.text = "Selected: " + (assets.indexOf(stageEditorState.selectedSprite) + 1) + " / " + assets.length;
}
else
{
indicator.text = "No Matches Found";
}

else
indicator.hide();
}

public override function validateDialog(button:DialogButton, fn:Bool->Void)
{

{
done = false;

{
curSelected = assets.indexOf(stageEditorState.selectedSprite);
curSelected++;


stageEditorState.selectedSprite = assets[curSelected];
indicator.text = "Selected: " + (assets.indexOf(stageEditorState.selectedSprite) + 1) + " / " + assets.length;

stageEditorState.camFollow.x = assets[curSelected].getMidpoint().x;
stageEditorState.camFollow.y = assets[curSelected].getMidpoint().y;
}
}
fn(done);
}
}
