package funkin.ui.debug.charting.components;


/**
* A sprite that can be used to display a note in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorNoteSprite extends FlxSprite
{
/**
* The list of available note skin to validate against.
*/
public static final NOTE_STYLES:Array<String> = ['funkin', 'pixel'];

/**
* The ChartEditorState this note belongs to.
*/

/**
* The note data that this sprite represents.
* You can set this to null to kill the sprite and flag it for recycling.
*/

/**
* The name of the note style currently in use.
*/


function set_overrideStepTime(value:Null<Float>):Null<Float>
{

overrideStepTime = value;
updateNotePosition();
}


function set_overrideData(value:Null<Int>):Null<Int>
{

overrideData = value;
playNoteAnimation();
}


/**
* An indicator if the note is a note kind different than Default ("").
*/

public function new(parent:ChartEditorState, isGhost:Bool = false)
{
super();

this.parentState = parent;
this.isGhost = isGhost;
this.tooltip = HaxeUIUtil.buildTooltip('N/A');


{
buildEmptyFrameCollection();

for (entry in entries)
{
addNoteStyleFrames(fetchNoteStyle(entry));
}
}


this.frames = noteFrameCollection;

for (entry in entries)
{
addNoteStyleAnimations(fetchNoteStyle(entry));
}

kindIndicator.setFormat("VCR OSD Mono", 24, FlxColor.YELLOW, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
}


function fetchNoteStyle(noteStyleId:String):NoteStyle
{
}

static function addNoteStyleFrames(noteStyle:NoteStyle):Void
{

{
}
for (frame in frameCollection.frames)
{
clonedFrame.name = '$prefix${clonedFrame.name}';
noteFrameCollection.pushFrame(clonedFrame);
}
}

function addNoteStyleAnimations(noteStyle:NoteStyle):Void
{

this.animation.addByPrefix('tapLeft$suffix', '$prefix${leftData.prefix}', leftData.frameRate, leftData.looped, leftData.flipX, leftData.flipY);

this.animation.addByPrefix('tapDown$suffix', '$prefix${downData.prefix}', downData.frameRate, downData.looped, downData.flipX, downData.flipY);

this.animation.addByPrefix('tapUp$suffix', '$prefix${upData.prefix}', upData.frameRate, upData.looped, upData.flipX, upData.flipY);

this.animation.addByPrefix('tapRight$suffix', '$prefix${rightData.prefix}', rightData.frameRate, rightData.looped, rightData.flipX, rightData.flipY);
}

static function buildEmptyFrameCollection():Void
{
noteFrameCollection = new FlxFramesCollection(null, ATLAS, null);
}

function set_noteData(value:Null<SongNoteData>):Null<SongNoteData>
{
this.noteData = value;

{
this.kill();
updateTooltipPosition();
}

this.visible = true;

playNoteAnimation();

updateNotePosition();
updateTooltipText();
}

public function updateNotePosition(?origin:FlxObject):Void
{


cursorColumn = ChartEditorState.noteDataToGridColumn(cursorColumn);

this.x = cursorColumn * ChartEditorState.GRID_SIZE;

{
this.y = stepTime * ChartEditorState.GRID_SIZE;
}

{
this.x += origin.x;
this.y += origin.y;
}

this.updateTooltipPosition();
}

public function updateTooltipText():Void
{
this.tooltip.tipData = {text: this.noteData.buildTooltip()};
}

public function updateTooltipPosition():Void
{

{
ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}
else
{
this.tooltip.left = this.x;
this.tooltip.top = this.y;
this.tooltip.width = this.width;
this.tooltip.height = this.height;

ToolTipManager.instance.registerTooltipRegion(this.tooltip);
}
}

override public function draw()
{
super.draw();


kindIndicator.x = this.x;
kindIndicator.y = this.y;
kindIndicator.draw();
}

override public function kill()
{
super.kill();

ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}

function get_noteStyle():Null<String>
{
{
}
}

function set_noteStyle(value:Null<String>):Null<String>
{
this.noteStyle = value;
this.playNoteAnimation();
}

public function playNoteAnimation():Void
{



this.animation.play(animationName);


switch (baseAnimationName)
{
case 'tap':
this.setGraphicSize(ChartEditorState.GRID_SIZE, 0);
this.updateHitbox();
}

this.antialiasing = !bruhStyle._data?.assets?.note?.isPixel ?? true;
}

/**
* Return whether this note (or its parent) is currently visible.
*/
public function isNoteVisible(viewAreaBottom:Float, viewAreaTop:Float):Bool
{


}

/**
* Return whether a note, if placed in the scene, would be visible.
* This function should be made HYPER EFFICIENT because it's called a lot.
*/
public static function wouldNoteBeVisible(viewAreaBottom:Float, viewAreaTop:Float, noteData:SongNoteData, ?origin:FlxObject):Bool
{



}
}
