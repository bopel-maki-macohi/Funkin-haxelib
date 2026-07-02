


class DebugBoundingState extends FlxState
{
/*
TODAY'S TO-DO
- Cleaner UI
*/









function get_currentAnimationName():String
{
}

function get_haxeUIFocused():Bool
{
}

override function create():Void
{





viewDropdown.onChange = function(e:UIEvent)
{








}


function initSpritesheetView():Void
{







}

function generateOutlines(frameShit:Array<FlxFrame>):Void
{

for (i in frameShit)
{


}
}

function updateOnionSkin():Void
{


{
}
else if (onionSkinChar.hasAnimation("danceLeft"))
{
}
else if (onionSkinChar.hasAnimation("danceRight"))
{
}
else
{
}
}

function initOffsetView():Void
{



for (char in characters)
{
}

charDropdown.onChange = function(e:UIEvent)
{
}


function mouseOffsetMovement()
{
{
{
}


{


}

{
}

{
}
}
}

function addInfo(str:String, value:Dynamic)
{

for (text in txtGrp.members)
{
}

}

function clearInfo()
{
}

function checkLibrary(library:String)
{
{

Assets.loadLibrary(library).onComplete(function(_)
{
}
}

override function update(elapsed:Float)
{
{
}

{
{
}
}

switch (curView)
{
case SPRITESHEET:
case ANIMATIONS:
}






}

override function destroy()
{


}

function offsetControls():Void
{
{
}

{
{
}
else
{
}
}
{
{
}
else
{
}
}

{



{

}
else
{
}
}

{
}

{
}

{

}

{
}

{







}
}

function buildOutputStringOld():String
{

for (i in swagChar.animationOffsets.keys())
{
}


}

function buildOutputStringNew():String
{

for (charDataAnim in charData.animations)
{
}

}


/*
Called when animation dropdown is changed!
*/
function loadAnimShit(char:String)
{
{
}

{
}





{
}




for (i in swagChar.animationOffsets.keys())
{
}


for (charAnim in characterAnimNames)
{
}



offsetAnimationDropdown.onChange = function(event:UIEvent)
{
{
}
}

}


function playCharacterAnimation(str:String, setOnionSkin:Bool = true)
{


}


function saveOffsets(saveString:String, fileName:String)
{
{
}
}

function onSaveComplete(_):Void
{
}

/**
* Called when the save file dialog is cancelled.
*/
function onSaveCancel(_):Void
{
}

/**
* Called if there is an error while saving the gameplay recording.
*/
function onSaveError(_):Void
{
}
}

enum abstract ANIMDEBUGVIEW(String)
{
}
