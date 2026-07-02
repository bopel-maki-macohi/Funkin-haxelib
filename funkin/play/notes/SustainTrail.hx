package funkin.play.notes;


/**
* This is based heavily on the `FlxStrip` class. It uses `drawTriangles()` to clip a sustain note
* trail at a certain time.
* The whole `FlxGraphic` is used as a texture map. See the `NOTE_hold_assets.fla` file for specifics
* on how it should be constructed.
*
* @author MtH
*/
class SustainTrail extends FlxSprite
{
/**
* The triangles corresponding to the hold, followed by the endcap.
* `top left, top right, bottom left`
* `top left, bottom left, bottom right`
*/



/**
* The note data associated with this hold note sprite.
* This is used to store the strum time, length, and other properties.
*/

/**
* Set this to `false` to disable scoring for this note.
* The note will no longer count towards ratings, points, or accuracy.
* @default `true` to enable scoring.
*/

/**
* The Y Offset of the note.
*/

/**
* Set to `true` if the user hit the note and is currently holding the sustain.
* Should display associated effects.
*/

/**
* Set to `true` if the user missed the note or released the sustain.
* Should make the trail transparent.
*/

/**
* Set to `true` after handling additional logic for missing notes.
*/


/**
* A `Vector` of floats where each pair of numbers is treated as a coordinate location (an x, y pair).
*/

/**
* A `Vector` of integers or indexes, where every three indexes define a triangle.
*/

/**
* A `Vector` of normalized coordinates used to apply texture mapping.
*/


/**
* What part of the trail's end actually represents the end of the note.
* This can be used to have a little bit sticking out.
*/

/**
* At what point the bottom for the trail's end should be clipped off.
* Used in cases where there's an extra bit of the graphic on the bottom to avoid antialiasing issues with overflow.
*/

/**
* Whether the note will recieve custom vertex data
*/



/**
* Normally you would take strumTime:Float, noteData:Int, sustainLength:Float, parentNote:Note (?)
* @param NoteData
* @param SustainLength Length in milliseconds.
* @param fileName
*/
public function new(noteDirection:NoteDirection, sustainLength:Float, noteStyle:NoteStyle)
{
super(0, 0);

setupHoldNoteGraphic(noteStyle);
noteStyleOffsets = noteStyle.getHoldNoteOffsets();

this.sustainLength = sustainLength;
this.fullSustainLength = sustainLength;
this.noteDirection = noteDirection;

setIndices(TRIANGLE_VERTEX_INDICES);

this.active = true; // This NEEDS to be true for the note to be drawn!
}

/**
* Sets the indices for the triangles.
* @param indices The indices to set.
*/
public function setIndices(indices:Array<Int>):Void
{
{
for (i in 0...indices.length)
{
this.indices[i] = indices[i];
}
}
else
{
this.indices = new DrawData<Int>(indices.length, false, indices);
}
}

/**
* Sets the vertices for the triangles.
* @param vertices The vertices to set.
*/
public function setVertices(vertices:Array<Float>):Void
{
{
for (i in 0...vertices.length)
{
this.vertices[i] = vertices[i];
}
}
else
{
this.vertices = new DrawData<Float>(vertices.length, false, vertices);
}
}

/**
* Sets the UV data for the triangles.
* @param uvtData The UV data to set.
*/
public function setUVTData(uvtData:Array<Float>):Void
{
{
for (i in 0...uvtData.length)
{
this.uvtData[i] = uvtData[i];
}
}
else
{
this.uvtData = new DrawData<Float>(uvtData.length, false, uvtData);
}
}

/**
* Creates hold note graphic and applies correct zooming
* @param noteStyle The note style
*/
public function setupHoldNoteGraphic(noteStyle:NoteStyle):Void
{
loadGraphic(noteStyle.getHoldNoteAssetPath());

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

graphicWidth = graphic.width / 8 * zoom; // amount of notes * 2
graphicHeight = sustainHeight(sustainLength, parentStrumline?.scrollSpeed ?? 1.0);

flipY = Preferences.downscroll #if mobile
|| (Preferences.controlsScheme == FunkinHitboxControlSchemes.Arrows
&& !funkin.mobile.input.ControlsHandler.hasExternalInputDevice) #end;

alpha = 1.0;
updateColorTransform();

updateClipping();
}

function getBaseScrollSpeed()
{
}


override function update(elapsed)
{
super.update(elapsed);
{
triggerRedraw();
}
previousScrollSpeed = parentStrumline?.scrollSpeed ?? 1.0;
}

/**
* Calculates height of a sustain note for a given length (milliseconds) and scroll speed.
* @param	susLength	The length of the sustain note in milliseconds.
* @param	scroll		The current scroll speed.
*/
public static inline function sustainHeight(susLength:Float, scroll:Float)
{
}

function set_sustainLength(s:Float):Float
{

this.sustainLength = s;
triggerRedraw();
}

function triggerRedraw()
{
graphicHeight = sustainHeight(sustainLength, parentStrumline?.scrollSpeed ?? 1.0);
updateClipping();
updateHitbox();
}

public override function updateHitbox():Void
{
width = graphicWidth;
height = graphicHeight;
offset.set(noteStyleOffsets[0], noteStyleOffsets[1]);
origin.set(width * 0.5, height * 0.5);
}

/**
* Sets up new vertex and UV data to clip the trail.
* If flipY is true, top and bottom bounds swap places.
* @param songTime	The time to clip the note at, in milliseconds.
*/
public function updateClipping(songTime:Float = 0):Void
{
{
}

{
visible = false;
}
else
{
visible = true;
}


vertices[0 * 2] = 0.0; // Inline with left side
vertices[0 * 2 + 1] = flipY ? clipHeight : graphicHeight - clipHeight;

vertices[1 * 2] = graphicWidth;
vertices[1 * 2 + 1] = vertices[0 * 2 + 1]; // Inline with top left vertex

vertices[2 * 2] = 0.0; // Inline with left side
vertices[2 * 2 + 1] = if (partHeight > 0)
{
flipY ? 0.0 + bottomHeight : vertices[1] + partHeight;
}
else
{
vertices[0 * 2 + 1]; // Inline with top left vertex (no partHeight available)
}

vertices[3 * 2] = graphicWidth;
vertices[3 * 2 + 1] = vertices[2 * 2 + 1]; // Inline with bottom left vertex



uvtData[0 * 2] = 1 / 4 * (noteDirection % 4); // 0%/25%/50%/75% of the way through the image
uvtData[0 * 2 + 1] = (-partHeight) / graphic.height / zoom; // top bound

uvtData[1 * 2] = uvtData[0 * 2] + 1 / 8; // 12.5%/37.5%/62.5%/87.5% of the way through the image (1/8th past the top left)
uvtData[1 * 2 + 1] = uvtData[0 * 2 + 1]; // top bound

uvtData[2 * 2] = uvtData[0 * 2]; // 0%/25%/50%/75% of the way through the image
uvtData[2 * 2 + 1] = 0.0; // bottom bound

uvtData[3 * 2] = uvtData[1 * 2]; // 12.5%/37.5%/62.5%/87.5% of the way through the image (1/8th past the top left)
uvtData[3 * 2 + 1] = uvtData[2 * 2 + 1]; // bottom bound

vertices[4 * 2] = vertices[2 * 2]; // Inline with bottom left vertex of hold
vertices[4 * 2 + 1] = vertices[2 * 2 + 1]; // Inline with bottom left vertex of hold

vertices[5 * 2] = vertices[3 * 2]; // Inline with bottom right vertex of hold
vertices[5 * 2 + 1] = vertices[3 * 2 + 1]; // Inline with bottom right vertex of hold

vertices[6 * 2] = vertices[2 * 2]; // Inline with left side
vertices[6 * 2 + 1] = flipY ? (graphic.height * (-bottomClip + endOffset) * zoom) : (graphicHeight + graphic.height * (bottomClip - endOffset) * zoom);

vertices[7 * 2] = vertices[3 * 2]; // Inline with right side
vertices[7 * 2 + 1] = vertices[6 * 2 + 1]; // Inline with bottom of end cap

uvtData[4 * 2] = uvtData[2 * 2] + 1 / 8; // 12.5%/37.5%/62.5%/87.5% of the way through the image (1/8th past the top left of hold)
uvtData[4 * 2 + 1] = if (partHeight > 0)
{
0;
}
else
{
(bottomHeight - clipHeight) / zoom / graphic.height;
};

uvtData[5 * 2] = uvtData[4 * 2] + 1 / 8; // 25%/50%/75%/100% of the way through the image (1/8th past the top left of cap)
uvtData[5 * 2 + 1] = uvtData[4 * 2 + 1]; // top bound

uvtData[6 * 2] = uvtData[4 * 2]; // 12.5%/37.5%/62.5%/87.5% of the way through the image (1/8th past the top left of hold)
uvtData[6 * 2 + 1] = bottomClip; // bottom bound

uvtData[7 * 2] = uvtData[5 * 2]; // 25%/50%/75%/100% of the way through the image (1/8th past the top left of cap)
uvtData[7 * 2 + 1] = uvtData[6 * 2 + 1]; // bottom bound
}

override public function draw():Void
{

for (camera in cameras)
{

getScreenPosition(_point, camera).subtractPoint(offset);
camera.drawTriangles(graphic, vertices, indices, uvtData, null, _point, blend, true, antialiasing, colorTransform, shader);
}

}

public override function kill():Void
{
super.kill();

strumTime = 0;
noteDirection = 0;
sustainLength = 0;
fullSustainLength = 0;
noteData = null;

hitNote = false;
missedNote = false;
}

public override function revive():Void
{
super.revive();

strumTime = 0;
noteDirection = 0;
sustainLength = 0;
fullSustainLength = 0;
noteData = null;

hitNote = false;
missedNote = false;
handledMiss = false;
}

override public function destroy():Void
{
vertices = null;
indices = null;
uvtData = null;

super.destroy();
}
}
