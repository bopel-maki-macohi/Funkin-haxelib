package funkin.ui.options;


class ColorsMenu extends Page<OptionsState.OptionsMenuPageName>
{


public function new()
{
super();

grpNotes = new FlxTypedGroup<NoteSprite>();
add(grpNotes);

for (i in 0...4)
{

note.x = (100 * i) + i;
note.screenCenter(Y);

add(_effectSpr);
_effectSpr.y = 0;
_effectSpr.x = i * 130;
_effectSpr.scale.x = _effectSpr.scale.y = 0.7;
_effectSpr.height = note.height;
_effectSpr.width = note.width;


grpNotes.add(note);
}
}

override function update(elapsed:Float)
{


{
}

{
}

super.update(elapsed);
}
}
