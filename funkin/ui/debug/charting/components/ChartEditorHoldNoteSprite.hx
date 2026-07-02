package funkin.ui.debug.charting.components;


/**
* A sprite that can be used to display the trail of a hold note in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorHoldNoteSprite extends SustainTrail
{
/**
* The ChartEditorState this note belongs to.
*/


function get_noteStyle():Null<String>
{
}

function set_noteStyle(value:Null<String>):Null<String>
{
this.noteStyle = value;
}


function set_overrideStepTime(value:Null<Float>):Null<Float>
{

overrideStepTime = value;
updateHoldNotePosition();
}


function set_overrideData(value:Null<Int>):Null<Int>
{

overrideData = value;
updateHoldNoteGraphic();
updateHoldNotePosition();
}

public function new(parent:ChartEditorState)
{

super(0, 100, noteStyle);

this.parentState = parent;
}

public function updateHoldNoteGraphic():Void
{
setupHoldNoteGraphic(bruhStyle);
}

override function setupHoldNoteGraphic(noteStyle:NoteStyle):Void
{
loadGraphic(graphicPath);

antialiasing = true;

this.isPixel = noteStyle.isHoldNotePixel();
{
endOffset = bottomClip = 1;
antialiasing = false;
}
else
{
endOffset = 0.5;
bottomClip = 0.9;
}

zoom = 1.0;
zoom *= noteStyle.fetchHoldNoteScale();
zoom *= 0.7;
zoom *= ChartEditorState.GRID_SIZE / Strumline.STRUMLINE_SIZE;

graphicWidth = graphic.width / 8 * zoom; // amount of notes * 2
graphicHeight = sustainLength * 0.45; // sustainHeight

flipY = false;

alpha = 1.0;

updateColorTransform();

updateClipping();

setup();
}

public override function updateHitbox():Void
{
width = ChartEditorState.GRID_SIZE;
height = graphicHeight;

offset.set(-xOffset, 0);
origin.set(width * 0.5, height * 0.5);
}

/**
* Set the height directly, to a value in pixels.
* @param h The desired height in pixels.
*/
public function setHeightDirectly(h:Float, lerp:Bool = false)
{
{
sustainLength = FlxMath.lerp(sustainLength, h / (getBaseScrollSpeed() * Constants.PIXELS_PER_MS), 0.25);
}
else
{
sustainLength = h / (getBaseScrollSpeed() * Constants.PIXELS_PER_MS);
}

fullSustainLength = sustainLength;
}

/**
* Call this to override how debug bounding boxes are drawn for this sprite.
*/
public override function drawDebugOnCamera(camera:flixel.FlxCamera):Void
{


debugBoundingBoxColor = 0xffFF66FF;
gfx.lineStyle(2, color, 0.5); // thickness, color, alpha
gfx.drawRect(rect.x, rect.y, rect.width, rect.height);
endDrawDebug(camera);
}

function setup():Void
{
strumTime = 999999999;
missedNote = false;
hitNote = false;
active = true;
visible = true;
alpha = 1.0;
graphicWidth = graphic.width / 8 * zoom; // amount of notes * 2

updateHitbox();
}

public override function revive():Void
{
super.revive();

setup();
}

public override function kill():Void
{
super.kill();

active = false;
visible = false;
noteData = null;
strumTime = 999999999;
noteDirection = 0;
sustainLength = 0;
fullSustainLength = 0;
}

/**
* Return whether this note is currently visible.
*/
public function isHoldNoteVisible(viewAreaBottom:Float, viewAreaTop:Float):Bool
{


}

/**
* Return whether a hold note, if placed in the scene, would be visible.
*/
public static function wouldHoldNoteBeVisible(viewAreaBottom:Float, viewAreaTop:Float, noteData:SongNoteData, ?origin:FlxObject):Bool
{



}

public function updateHoldNotePosition(?origin:FlxObject):Void
{


{
cursorColumn = (ChartEditorState.STRUMLINE_SIZE * 2 + 1);
}
else
{
{
cursorColumn -= ChartEditorState.STRUMLINE_SIZE;
}
else
{
cursorColumn += ChartEditorState.STRUMLINE_SIZE;
}
}

this.x = cursorColumn * ChartEditorState.GRID_SIZE;

inline this.noteData.getStepTime();
{
this.y = stepTime * ChartEditorState.GRID_SIZE;
}

this.x += ChartEditorState.GRID_SIZE / 2;
this.x -= this.graphicWidth / 2;

this.y += ChartEditorState.GRID_SIZE / 2;

{
this.x += origin.x;
this.y += origin.y;
}

this.x += this.offset.x;
}
}
