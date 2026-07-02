package funkin.util;


/**
* the name is a bit of a mouthful, but this adds a button to the
* FlxDebugger Interaction window, which when pressed will open a
* tracking window corresponding to whatever currently selected objects are
*/
class TrackerToolButtonUtil extends Tool
{
override function init(brain:Interaction):Tool
{
super.init(brain);

_name = "Add Tracker";
setButton(GraphicCursorCross);

button.upHandler = function()
{
brain.selectedItems.forEach(function(item)
{
});
};

button.toggleMode = false;

}
}
