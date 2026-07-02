

class TitleState extends MusicBeatState
{
/**
* Only play the credits once per session.
*/



override public function create():Void
{



{
else
}



function startIntro():Void
{








titleText = FunkinSprite.createTextureAtlas(#if mobile 50 #else 100 #end + (FullScreenScaleMode.gameCutoutSize.x / 2), FlxG.height * 0.8, titleTextPath, {
cacheOnLoad: true


{
}




{
}
else if (FlxG.random.bool(30))
{
}
else
{
}

{
}



else

}

/**
* After sitting on the title screen for a while, transition to the attract screen.
*/
function moveToAttract():Void
{
{
}

function playMenuMusic():Void
{
FunkinSound.playMusic('freakyMenu', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: false,
persist: true
}

function getIntroTextShit():Array<Array<String>>
{


for (i in firstArray)
{
}

}


override function update(elapsed:Float):Void
{

{
}

Conductor.instance.update();


{
}




{
}

{
}

{



new FlxTimer().start(2, function(tmr:FlxTimer)
{
}

{
}

}

function moveToMainMenu():Void
{
{
}

}

override function draw()
{
}


function cheatCodeShit():Void
{
}

function codePress(input:Int):Void
{
{
}
else
}

function startCheat():Void
{

FunkinSound.playMusic('girlfriendsRingtone', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: true



}

function createCoolText(textArray:Array<String>):Void
{

for (i in 0...textArray.length)
{
}
}

function addMoreText(text:String):Void
{


}

function deleteCoolText():Void
{

{
}
}


override function beatHit():Bool
{

{
{
for (i in lastBeat...Conductor.instance.currentBeat)
{
switch (i + 1)
{
case 1:
case 3:
case 4:
case 5:
case 7:
case 8:
case 9:
case 11:
case 12:
case 13:
case 14:

else
case 15:
case 16:
}
}
}
lastBeat = Conductor.instance.currentBeat;
}

{



{
else
}
}

}

function skipIntro():Void
{
{


}
}
}
