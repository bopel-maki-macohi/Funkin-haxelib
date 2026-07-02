


class StageEditorObjectAnimsToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{

objFrameList.onChange = function(_)
{
}

objAnims.onChange = function(_)
{

{
}



}

objAnimSave.onClick = function(_)
{

{
}

{
}

}

objAnimDelete.onClick = function(_)
{




state.notifyChange("Animation Deletion Done", "Animation "
+ objAnims.selectedItem.text
+ " has been removed from the Object "
+ linkedObj.name


}

}

function onClose(event:UIEvent)
{
}


override public function refresh()
{

{
}


}

function updateFrameList()
{


for (fname in linkedObj.frames.frames)
{

}
}

function updateAnimList()
{


for (aname in linkedObj.animation.getNameList())
{
}

}

function addAnimation()
{
{
}


{

for (num in splitter)
}


linkedObj.addAnim(objAnimName.text, objAnimPrefix.text, [objAnimOffsetX.pos, objAnimOffsetY.pos], (shouldDoIndices ? indices : []),

{
}



flixel.util.FlxTimer.wait(StageEditorState.TIME_BEFORE_ANIM_STOP, function()
{
}
}
