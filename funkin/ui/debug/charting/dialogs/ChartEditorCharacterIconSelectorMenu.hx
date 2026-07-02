

class ChartEditorCharacterIconSelectorMenu extends ChartEditorBaseMenu
{


public function new(chartEditorState2:ChartEditorState, charType:CharacterType, lockPosition:Bool = false)
{

FlxTween.tween(this, {alpha: 1, y: this.y + 10}, 0.2, {
ease: FlxEase.quartOut,
onComplete: function(_)
{
else
}
}

function initialize(charType:CharacterType, lockPosition:Bool)
{
currentCharId = switch (charType)
{

{

{

}
else
{
this.x = Screen.instance.currentMouseX;
this.y = Screen.instance.currentMouseY;
}



charIds.insert(0, ""); // Add none/null/NuN character option


for (charIndex => charId in charIds)
{


{


}


charButton.onClick = _ ->
{
switch (charType)
{
case BF:
case DAD:



charButton.onMouseOver = _ ->
{
charButton.onMouseOut = _ ->
{
}

}

public static function build(chartEditorState:ChartEditorState, charType:CharacterType, lockPosition:Bool = false):ChartEditorCharacterIconSelectorMenu
{

Screen.instance.addComponent(menu);

}
}
