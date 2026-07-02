package funkin.ui.debug.stageeditor.toolboxes;


class StageEditorObjectGraphicToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{
super(state);

objLoad.onClick = function(_)
{

Dialogs.openBinaryFile("Open Image File", FileDialogTypes.IMAGES, function(selectedFile)
{
objImage.resource = null;

ToolkitAssets.instance.imageFromBytes(selectedFile.bytes, function(imageInfo)
{

objImage.resource = imageInfo.data;
linkedObj.frame = imageInfo.data;

linkedObj.loadGraphic(state.bitmaps[bitToLoad]);
linkedObj.updateHitbox();

state.removeUnusedBitmaps();

refresh();
objImageWidth.pos = objImageWidth.max;
objImageHeight.pos = objImageHeight.max;

state.notifyChange("Object Graphic Loaded", "The Image File " + selectedFile.name + " has been loaded.");
});
});
}

objLoadNet.onClick = function(_)
{

state.createURLDialog(function(bytes:lime.utils.Bytes)
{
linkedObj.loadGraphic(state.bitmaps[bitToLoad]);
linkedObj.updateHitbox();

state.removeUnusedBitmaps();

refresh();

stageEditorState.updateDialog(OBJECT_ANIMS);
});
}

objReset.onClick = function(_)
{

linkedObj.loadGraphic(AssetDataHandler.getDefaultGraphic());
linkedObj.updateHitbox();

state.removeUnusedBitmaps();

refresh();
stageEditorState.updateDialog(OBJECT_ANIMS);
}

objResetFrames.onClick = function(_)
{

linkedObj.loadGraphic(linkedObj.graphic);
refresh();
stageEditorState.updateDialog(OBJECT_ANIMS);
}

objLoadFrames.onClick = function(_)
{
Dialogs.openTextFile("Open Text File", FileDialogTypes.TEXTS, function(selectedFile)
{

objFrameTxt.text = selectedFile.text;

state.notifyChange("Frame Text Loaded", "The Text File " + selectedFile.name + " has been loaded.");
});
}

objSetSparrow.onClick = function(_) setObjFrames(false);

objSetPacker.onClick = function(_) setObjFrames(true);

objSplit.onClick = function(_)
{

linkedObj.loadGraphic(linkedObj.graphic, true, Std.int(objImageWidth.pos), Std.int(objImageHeight.pos));
linkedObj.updateHitbox();

for (i in 0...linkedObj.frames.frames.length)
{
linkedObj.frames.framesByName.set('Frame$i', linkedObj.frames.frames[i]);

linkedObj.frames.frames[i].name = 'Frame$i';
}

refresh();

stageEditorState.updateDialog(OBJECT_ANIMS);
}

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stageEditorState.menubarItemWindowObjectGraphic.selected = false;
}

override public function refresh()
{
linkedObj = stageEditorState.selectedSprite;

{
objImage.resource = null;
}

}

/**
* Set the linked object's frames based on its graphic and loaded text.
* @param usePacker
*/
function setObjFrames(usePacker:Bool)
{

try
{
{
linkedObj.frames = FlxAtlasFrames.fromSpriteSheetPacker(linkedObj.graphic, objFrameTxt.text);
}
else
{
linkedObj.frames = FlxAtlasFrames.fromSparrow(linkedObj.graphic, objFrameTxt.text);
}
}
catch (e)
{
stageEditorState.notifyChange("Frame Setup Error", e.toString(), true);
}

linkedObj.animDatas.clear();
linkedObj.animation.destroyAnimations();
linkedObj.updateHitbox();
refresh();

stageEditorState.notifyChange("Frame Setup Done", "Finished the Frame Setup for the Object " + linkedObj.name + ".");
stageEditorState.updateDialog(OBJECT_ANIMS);
}
}
