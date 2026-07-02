


/**
* When you want the player to unlock a character, call `CharacterUnlockState.unlock(characterName)`.
* It handles both the act of unlocking the character and displaying the dialog.
*/
class CharacterUnlockState extends MusicBeatState
{




public function new(targetPlayableCharacter:String, ?nextState:FlxState)
{

this.targetCharacterData = PlayerRegistry.instance.fetchEntry(targetCharacterId);
}

override function create():Void
{








healthIcon.bopEvery = 0; // You can increase this number later once the animation is done.

FlxTween.num(0.0, 1.0, 0.75, {
ease: FlxEase.elasticOut,
}, function(curScale)
{

}

function handleMusic():Void
{
}

override function update(elapsed:Float):Void
{

{
}
}

function startClose():Void
{
{
else
}
}
