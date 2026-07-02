

class StageEditorObjectPropertiesToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{


objPosX.onChange = function(_)
{
}

objPosY.onChange = function(_)
{
}

objZIdx.onChange = function(_)
{
{
}
}

objAlpha.onChange = function(_)
{
}

objAngle.onChange = function(_)
{
}

objScaleX.onChange = function(_)
{
{
}
}

objScaleY.onChange = function(_)
{
{
}
}

objScrollX.onChange = function(_)
{
}

objScrollY.onChange = function(_)
{
}

objDance.onChange = function(_)
{
}

objPixel.onChange = function(_)
{
}

objFlipX.onChange = function(_)
{
}

objFlipY.onChange = function(_)
{
}

objBlend.onChange = function(_)
{
{
}
}

objTint.onChange = function(_)
{
{
}
}

}

function onClose(event:UIEvent)
{
}

override public function refresh()
{

objAngle.step = funkin.save.Save.instance.stageEditorAngleStep.value;

{



}




}
}


private class ObjectTintHandler extends DropDownHandler
{

private override function get_component()
{
{
}

}

public override function prepare(_)
{
}


private override function get_selectedItem():Dynamic
{
}

private override function set_selectedItem(value:Dynamic):Dynamic
{
else



}

private function onColorChange(e:UIEvent)
{
{
}


}
}

<vbox style="spacing:0;padding:5px;">
<color-picker id="picker" />
<box id="cancelApplyButtons" style="padding-top: 5px;" width="100%">
<hbox horizontalAlign="right">
<button id="cancelButton" text="Cancel" styleName="text-small" style="padding: 4px 8px;" />
<button id="applyButton" text="Apply" styleName="text-small" style="padding: 4px 8px;" />
</hbox>
</box>
</vbox>
')
private class ObjectTintView extends VBox
{


private function get_currentColor():Null<Color>
{
}

private function set_currentColor(value:Null<Color>):Null<Color>
{
}

private function onCancel(_)
{
}

private function onApply(_)
{

}
}
