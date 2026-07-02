

class StageEditorObjectGraphicToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{

objLoad.onClick = function(_)
{

Dialogs.openBinaryFile("Open Image File", FileDialogTypes.IMAGES, function(selectedFile)
{

ToolkitAssets.instance.imageFromBytes(selectedFile.bytes, function(imageInfo)
{





}

objLoadNet.onClick = function(_)
{

state.createURLDialog(function(bytes:lime.utils.Bytes)
{



}

objReset.onClick = function(_)
{



}

objResetFrames.onClick = function(_)
{

}

objLoadFrames.onClick = function(_)
{
Dialogs.openTextFile("Open Text File", FileDialogTypes.TEXTS, function(selectedFile)
{


}



objSplit.onClick = function(_)
{


for (i in 0...linkedObj.frames.frames.length)
{

}


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

/**
* Set the linked object's frames based on its graphic and loaded text.
* @param usePacker
*/
function setObjFrames(usePacker:Bool)
{

try
{
{
}
else
{
}
}
catch (e)
{
}


}
}
