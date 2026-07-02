package funkin.ui.debug.stageeditor.toolboxes;


using StringTools;

class StageEditorObjectAnimsToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{
super(state);

objFrameList.onChange = function(_)
{
objAnimPrefix.text = objFrameList.selectedItem.name;
}

objAnims.onChange = function(_)
{

{
objAnimName.text = objAnimPrefix.text = objAnimIndices.text = "";
objAnimLooped.selected = objAnimFlipX.selected = objAnimFlipY.selected = objAnimStart.selected = false;
objAnimFramerate.pos = 24;
objAnimOffsetX.pos = objAnimOffsetY.pos = 0;
}

objAnimName.text = objAnims.selectedItem.text;
objAnimPrefix.text = animData.prefix ?? "";
objAnimIndices.text = (animData.frameIndices?.join(", ") ?? "");

objAnimLooped.selected = animData.looped ?? false;
objAnimFlipX.selected = animData.flipX ?? false;
objAnimFlipY.selected = animData.flipY ?? false;
objAnimFramerate.pos = animData.frameRate ?? 24;
objAnimStart.selected = objAnimName.text == linkedObj.startingAnimation;

objAnimOffsetX.pos = (animData.offsets[0] ?? 0);
objAnimOffsetY.pos = (animData.offsets[1] ?? 0);
}

objAnimSave.onClick = function(_)
{

{
state.notifyChange("Animation Saving Error", "The Animation Name is missing.", true);
}

{
state.notifyChange("Animation Saving Error", "The Animation Prefix is missing.", true);
}

addAnimation();
}

objAnimDelete.onClick = function(_)
{

linkedObj.animation.pause();
linkedObj.animation.stop();
linkedObj.animation.curAnim = null;


linkedObj.animation.remove(daAnim);
linkedObj.animDatas.remove(daAnim);
linkedObj.offset.set();

state.notifyChange("Animation Deletion Done", "Animation "
+ objAnims.selectedItem.text
+ " has been removed from the Object "
+ linkedObj.name
+ ".");

updateAnimList();

objAnims.selectedIndex = objAnims.dataSource.size - 1;
}

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stageEditorState.menubarItemWindowObjectAnims.selected = false;
}


override public function refresh()
{
linkedObj = stageEditorState.selectedSprite;

{
updateFrameList();
updateAnimList();
objAnims.selectedIndex = -1;
}


}

function updateFrameList()
{
previousFrames = [];
objFrameList.dataSource = new ArrayDataSource();


for (fname in linkedObj.frames.frames)
{

previousFrames.push(fname.name);
}
}

function updateAnimList()
{
objAnims.dataSource.clear();
previousAnims = [];


for (aname in linkedObj.animation.getNameList())
{
objAnims.dataSource.add({text: aname});
previousAnims.push(aname);
}

}

function addAnimation()
{
{
linkedObj.animation.remove(objAnimName.text);
}


{

for (num in splitter)
indices.push(Std.parseInt(num));
}


linkedObj.addAnim(objAnimName.text, objAnimPrefix.text, [objAnimOffsetX.pos, objAnimOffsetY.pos], (shouldDoIndices ? indices : []),
Std.int(objAnimFramerate.pos), objAnimLooped.selected, objAnimFlipX.selected, objAnimFlipY.selected);

{
stageEditorState.notifyChange("Animation Saving Error", "Could not build Animation by the provided Frames.", true);
}

linkedObj.playAnim(objAnimName.text);

stageEditorState.notifyChange("Animation Saving Done", "Animation " + objAnimName.text + " has been saved to the Object " + linkedObj.name + ".");
updateAnimList();

flixel.util.FlxTimer.wait(StageEditorState.TIME_BEFORE_ANIM_STOP, function()
{
});
}
}
