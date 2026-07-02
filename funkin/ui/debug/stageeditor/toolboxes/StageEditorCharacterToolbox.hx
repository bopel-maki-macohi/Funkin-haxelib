package funkin.ui.debug.stageeditor.toolboxes;


using StringTools;

class StageEditorCharacterToolbox extends StageEditorDefaultToolbox
{


override public function new(state:StageEditorState)
{
super(state);

charPosX.onChange = charPosY.onChange = function(_)
{
repositionCharacter();
}

charZIdx.max = StageEditorState.MAX_Z_INDEX;
charZIdx.onChange = function(_)
{
state.charGroups[state.selectedChar.characterType].zIndex = Std.int(charZIdx.pos);
state.sortAssets();
}

charCamX.onChange = charCamY.onChange = function(_)
{
state.charCamOffsets[state.selectedChar.characterType] = [charCamX.pos ?? 0, charCamY.pos ?? 0];
state.updateMarkerPos();
}

charScale.onChange = function(_)
{
state.selectedChar.setScale(state.selectedChar.getBaseScale() * charScale.pos);
repositionCharacter();
}

charAlpha.onChange = function(_)
{
state.selectedChar.alpha = charAlpha.pos;
}

charAngle.onChange = function(_)
{
state.selectedChar.angle = charAngle.pos;
}

charScrollX.onChange = charScrollY.onChange = function(_)
{
state.selectedChar.scrollFactor.set(charScrollX.pos, charScrollY.pos);
}

charType.onClick = function(_)
{
charMenu = new StageEditorCharacterMenu(state, this);
Screen.instance.addComponent(charMenu);
}

refresh();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stageEditorState.menubarItemWindowCharacter.selected = false;
}

override public function refresh()
{

charPosX.step = charPosY.step = stageEditorState.moveStep;
charCamX.step = charCamY.step = stageEditorState.moveStep;
charAngle.step = funkin.save.Save.instance.stageEditorAngleStep.value;


{
}

charType.icon = (charData == null ? null : CharacterDataParser.getCharPixelIconAsset(curChar?.characterId));
charType.text = (charData == null ? "None" : charData.name.length > 6 ? '${charData.name.substr(0, 6)}.' : '${charData.name}');

}

public function repositionCharacter()
{
stageEditorState.selectedChar.x = charPosX.pos - stageEditorState.selectedChar.characterOrigin.x;
stageEditorState.selectedChar.y = charPosY.pos - stageEditorState.selectedChar.characterOrigin.y;

stageEditorState.selectedChar.setScale(stageEditorState.selectedChar.getBaseScale() * charScale.pos);
stageEditorState.updateMarkerPos();
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
super();

this.x = Screen.instance.currentMouseX;
this.y = Screen.instance.currentMouseY;

charGrid.columns = 5;
charGrid.width = this.width;
charSelectScroll.addComponent(charGrid);

charIds.sort(SortUtil.alphabetically);


for (charIndex => charId in charIds)
{

charButton.width = 70;
charButton.height = 70;
charButton.padding = 8;
charButton.iconPosition = "top";

{
charSelectScroll.hscrollPos = Math.floor(charIndex / 5) * 80;
charButton.selected = true;

defaultText = '${charData.name} [${charId}]';
}

charButton.icon = CharacterDataParser.getCharPixelIconAsset(charId);
charButton.text = charData.name.length > LIMIT ? '${charData.name.substr(0, LIMIT)}.' : '${charData.name}';

charButton.onClick = _ ->
{
{

switch (index)
{
case 0:
type = CharacterType.GF;
case 1:
type = CharacterType.DAD;
case 2:
type = CharacterType.BF;
}
}

group.killMembers();
for (member in group.members)
{
member.kill();
group.remove(member, true);
member.destroy();
}
group.clear();


{
state.notifyChange("Switch Character", "Couldn't find character " + charId + ". Switching to default.", true);
newChar = CharacterDataParser.fetchCharacter(Constants.DEFAULT_CHARACTER, true);
}

newChar.characterType = type;

newChar.resetCharacter(true);
newChar.flipX = type == CharacterType.BF ? !newChar.getDataFlipX() : newChar.getDataFlipX();
newChar.alpha = parent.charAlpha.pos;
newChar.angle = parent.charAngle.pos;
newChar.scrollFactor.x = parent.charScrollX.pos;
newChar.scrollFactor.y = parent.charScrollY.pos;

state.selectedChar = newChar;
group.add(newChar);

parent.repositionCharacter();
group.zIndex = Std.int(parent.charZIdx.pos ?? 0);

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
};

charButton.onMouseOver = _ ->
{
charIconName.text = '${charData.name} [${charId}]';
};
charButton.onMouseOut = _ ->
{
charIconName.text = defaultText;
};
charGrid.addComponent(charButton);
}

charIconName.text = defaultText;

this.alpha = 0;
this.y -= 10;
FlxTween.tween(this, {alpha: 1, y: this.y + 10}, 0.2, {ease: FlxEase.quartOut});
}
}
