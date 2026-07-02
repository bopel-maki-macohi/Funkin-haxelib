

/**
* A custom note kind which has custom functionality, preventing notes from being scored in the Results Screen.
*/
class NonScoreableNoteKind extends NoteKind
{
public function new()
{
}

public override function onNoteMiss(event:NoteScriptEvent):Void
{
}
}
