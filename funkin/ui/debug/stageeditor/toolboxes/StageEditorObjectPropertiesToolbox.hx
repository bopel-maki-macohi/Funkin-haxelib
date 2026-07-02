package funkin.ui.debug.stageeditor.toolboxes;


class StageEditorObjectPropertiesToolbox extends StageEditorDefaultToolbox
{




override public function new(state:StageEditorState)
{
super(state);

DropDownBuilder.HANDLER_MAP.set("objTint", Type.getClassName(ObjectTintHandler));

objPosX.onChange = function(_)
{
}

objPosY.onChange = function(_)
{
}

objZIdx.max = StageEditorState.MAX_Z_INDEX;
objZIdx.onChange = function(_)
{
{
linkedObj.zIndex = Std.int(objZIdx.pos);
state.updateArray();
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
linkedObj.scale.x = objScaleX.pos;
linkedObj.updateHitbox();
}
}

objScaleY.onChange = function(_)
{
{
linkedObj.scale.y = objScaleY.pos;
linkedObj.updateHitbox();
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
linkedObj.blend = (objBlend.selectedItem?.text ?? "NONE") == "NONE" ? null : AssetDataHandler.blendFromString(objBlend.selectedItem.text);
}
}

objTint.onChange = function(_)
{
{
linkedObj.color = FlxColor.fromString(_.value) ?? 0xFFFFFFFF;
}
}

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stageEditorState.menubarItemWindowObjectProps.selected = false;
}

override public function refresh()
{
linkedObj = stageEditorState.selectedSprite;

objPosX.step = stageEditorState.moveStep;
objPosY.step = stageEditorState.moveStep;
objAngle.step = funkin.save.Save.instance.stageEditorAngleStep.value;

{
objPosX.pos = 0;
objPosY.pos = 0;
objZIdx.pos = 0;
objAlpha.pos = 1;
objAngle.pos = 0;
objScaleX.pos = 1;
objScaleY.pos = 1;
objScrollX.pos = 1;
objScrollY.pos = 1;
objDance.pos = 0;

objPixel.selected = true;
objFlipX.selected = false;
objFlipY.selected = false;

objBlend.selectedIndex = 0;
objTint.selectedItem = Color.fromString("white");

}




}
}


private class ObjectTintHandler extends DropDownHandler
{

private override function get_component()
{
{
_view = new ObjectTintView();
_view.dropdown = _dropdown;
_view.currentColor = _cachedSelectedColor;
_view.onChange = onColorChange;
}

}

public override function prepare(_)
{
super.prepare(_);
}


private override function get_selectedItem():Dynamic
{
}

private override function set_selectedItem(value:Dynamic):Dynamic
{
else
_cachedSelectedColor = value;


_dropdown.text = _cachedSelectedColor.toHex();

}

private function onColorChange(e:UIEvent)
{
{
_cachedSelectedColor = _view.currentColor;
}

_dropdown.text = _cachedSelectedColor.toHex();

event.value = _cachedSelectedColor.toHex();
_dropdown.dispatch(event);
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
picker.currentColor = value;
}

private function onCancel(_)
{
dropdown.hideDropDown();
}

private function onApply(_)
{
dropdown.text = currentColor.toHex();

event.value = currentColor.toHex();
dropdown.dispatch(event);
}
}
