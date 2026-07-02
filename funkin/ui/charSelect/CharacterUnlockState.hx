package funkin.ui.charSelect;


using flixel.util.FlxSpriteUtil;

/**
* When you want the player to unlock a character, call `CharacterUnlockState.unlock(characterName)`.
* It handles both the act of unlocking the character and displaying the dialog.
*/
class CharacterUnlockState extends MusicBeatState
{




public function new(targetPlayableCharacter:String, ?nextState:FlxState)
{
super();

this.targetCharacterId = targetPlayableCharacter;
this.targetCharacterData = PlayerRegistry.instance.fetchEntry(targetCharacterId);
this.nextState = nextState == null ? new MainMenuState() : nextState;
}

override function create():Void
{
super.create();

handleMusic();

bgColor = DIALOG_BG_COLOR;

add(dialogContainer);

dialogText.setFormat("VCR OSD Mono", 32, DIALOG_FONT_COLOR, LEFT);

dialogBG.makeGraphic(Std.int(dialogText.width + 32), Std.int(dialogText.height + 32), FlxColor.TRANSPARENT);
dialogBG.drawRoundRect(0, 0, dialogBG.width, dialogBG.height, 16, 16, DIALOG_COLOR);
dialogContainer.add(dialogBG);

dialogBG.screenCenter(XY);

dialogText.x = dialogBG.x + 16;
dialogText.y = dialogBG.y + 16;
dialogContainer.add(dialogText);

healthIcon.configure(baseCharacter?._data.healthIcon);
healthIcon.autoUpdate = false;
healthIcon.bopEvery = 0; // You can increase this number later once the animation is done.
healthIcon.size.set(0.5, 0.5);
healthIcon.x = dialogBG.x + 390;
healthIcon.y = dialogBG.y + 6;
healthIcon.flipX = true;
healthIcon.snapToTargetSize();
dialogContainer.add(healthIcon);

dialogContainer.scale.set(0, 0);
FlxTween.num(0.0, 1.0, 0.75, {
ease: FlxEase.elasticOut,
}, function(curScale)
{
dialogContainer.scale.set(curScale, curScale);
healthIcon.size.set(0.5 * curScale, 0.5 * curScale);
});

}

function handleMusic():Void
{
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{
busy = true;
startClose();
}
}

function startClose():Void
{
{
funkin.FunkinMemory.clearFreeplay();
else
funkin.FunkinMemory.purgeCache();
funkin.FunkinMemory.purgeCache(true);
});
}
}
