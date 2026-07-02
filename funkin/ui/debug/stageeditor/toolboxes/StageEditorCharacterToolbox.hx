


class StageEditorCharacterToolbox extends StageEditorDefaultToolbox
{


override public function new(state:StageEditorState)
{

charPosX.onChange = charPosY.onChange = function(_)
{
}

charZIdx.onChange = function(_)
{
}

charCamX.onChange = charCamY.onChange = function(_)
{
}

charScale.onChange = function(_)
{
}

charAlpha.onChange = function(_)
{
}

charAngle.onChange = function(_)
{
}

charScrollX.onChange = charScrollY.onChange = function(_)
{
}

charType.onClick = function(_)
{
Screen.instance.addComponent(charMenu);
}


}

function onClose(event:UIEvent)
{
}

override public function refresh()
{

charAngle.step = funkin.save.Save.instance.stageEditorAngleStep.value;


{
}


}

public function repositionCharacter()
{

}
}

<menu id="iconSelector" width="410" height="185" padding="8">
<vbox width="100%" height="100%">
<scrollview id="charSelectScroll" width="390" height="150" contentWidth="100%" />
<label id="charIconName" text="(choose a character)" />
</vbox>
</menu>
')
class StageEditorCharacterMenu extends Menu // copied from chart editor
{
override public function new(state:StageEditorState, parent:StageEditorCharacterToolbox)
{

this.x = Screen.instance.currentMouseX;
this.y = Screen.instance.currentMouseY;




for (charIndex => charId in charIds)
{


{

}


charButton.onClick = _ ->
{
{

switch (index)
{
case 0:
case 1:
case 2:
}
}

for (member in group.members)
{
}


{
}





switch (type)
{
case BF:
Save.instance.stageBoyfriendChar = charId;
case GF:
Save.instance.stageGirlfriendChar = charId;
case DAD:
Save.instance.stageDadChar = charId;
default:
}

charButton.onMouseOver = _ ->
{
charButton.onMouseOut = _ ->
{
}


}
}
