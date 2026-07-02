package funkin.ui.charSelect;


class CharSelectGF extends FunkinSprite implements IBPMSyncedScriptedClass
{



public function new(x:Float, y:Float)
{
super(x, y);
this.applyStageMatrix = true;

switchGF(Constants.DEFAULT_CHARACTER);
}

public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
{
anim.play("idle", true);
}
};

override public function draw()
{
super.draw();
}

function drawFFT()
{
{
analyzerLevelsCache = analyzer.getLevels(analyzerLevelsCache);

for (i in 0...len)
{


animFrame = Math.floor(Math.min(12, animFrame));
animFrame = Math.floor(Math.max(0, animFrame));

animFrame = Std.int(Math.abs(animFrame - 12)); // shitty dumbass flip, cuz dave got da shit backwards lol!

convertedSymbol.firstFrame = animFrame;

elements[i] = convertedSymbol;
}
}
}

/**
* For switching between "GFs" such as gf, nene, etc
* @param bf Which BF we are selecting, so that we know the accompyaning GF
*/
public function switchGF(bf:String):Void
{


currentGFPath = assetPath;

{
this.visible = false;
}
else if (previousGFPath != currentGFPath)
{
this.visible = true;

{
frames = texture;
}
else
{
this.visible = false;
currentGFPath = "";
}

enableVisualizer = gfData?.visualizer ?? false;
}

anim.play("idle", true);

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
