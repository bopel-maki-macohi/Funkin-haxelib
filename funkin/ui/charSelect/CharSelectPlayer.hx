package funkin.ui.charSelect;


class CharSelectPlayer extends FunkinSprite implements IBPMSyncedScriptedClass
{



public function new(x:Float, y:Float)
{
initialX = x;
initialY = y;

super(x, y);

loadTextureAtlas(DEFAULT_PATH, {
applyStageMatrix: true,
swfMode: true
});

anim.onFinish.add(function(animLabel:String)
{
switch (animLabel)
{
case "slidein":
{
anim.play("slidein idle point", true);
}
else
{
anim.play("idle", true);
anim.curAnim.looped = true;
}
case "deselect":
anim.play("deselect loop start", true);
case "slidein idle point", "cannot select Label", "unlock":
anim.play("idle", true);
case "idle":

{
{
anim.curAnim.looped = true;
}
}
}
});
}

public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
//
{
anim.play("idle", true);
}
};

public function switchChar(str:String, playSlideAnim:Bool = true):Void
{

{
frames = texture;
}
else
{
}

anim.play(animName, true);

updateHitbox();
}

public function onScriptEvent(event:ScriptEvent):Void
{
};

public function onCreate(event:ScriptEvent):Void
{
};

public function onDestroy(event:ScriptEvent):Void
{
};

public function onUpdate(event:UpdateScriptEvent):Void
{
};
}
