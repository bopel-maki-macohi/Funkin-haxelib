package funkin.mobile.ui;


enum FunkinHintAlphaStyle
{
INVISIBLE_TILL_PRESS;
VISIBLE_TILL_PRESS;
}

/**
* The `FunkinHint` class represents a button with HSV color properties, allowing hue and saturation adjustments.
*/
class FunkinHint extends FunkinButton
{
/**
* A map defining different alpha styles for hint visibility during press and release states.
*
* Each style is represented as a key with an associated array of two alpha values:
* - The first value corresponds to the alpha when the hint is pressed.
* - The second value corresponds to the alpha when the hint is not pressed.
* - The third value corresponds to the duratuon it'll take to tween between the two values.
*/
Array<Float>> = [INVISIBLE_TILL_PRESS => [0.3, 0.00001, 0.01], VISIBLE_TILL_PRESS => [0.4, 0.2, 0.08]];

/**
* Indicates whether the hint is pixel.
*/

/**
* The direction of the note associated with the button.
*/

/**
* The label associated with the button.
*/

/**
* The tween used to animate the alpha changes of the button.
*/

/**
* The HSV shader used to adjust the hue and saturation of the button.
*/

/**
* The tween used to animate the alpha changes of the button.
*/



/**
* Creates a new `FunkinHint` object.
*
* @param x The x position of the button.
* @param y The y position of the button.
* @param noteDirection The direction of the note the button represents (e.g. left, right).
* @param label An graphic to display as the label on the button.
*/
public function new(x:Float, y:Float, noteDirection:NoteDirection, label:Null<FlxGraphic>):Void
{
super(x, y);

this.noteDirection = noteDirection;

{
this.label = new FunkinSprite(x, y);
this.label.loadGraphic(label);
}

hsvShader = new HSVShader();
hsvShader.hue = 1.0;
hsvShader.saturation = 1.0;
hsvShader.value = 1.0;
shader = hsvShader;
}

/**
* Initializes alpha tween animations for the button.
*
* @param style The alpha style to use.
*/
public function initTween(style:FunkinHintAlphaStyle):Void
{


function createTween(targetAlpha:Float, transitionTime:Float, isPressed:Bool):Void
{
alphaTween?.cancel();
alphaTween = FlxTween.tween(this, {alpha: targetAlpha}, transitionTime, {ease: FlxEase.circInOut});

{
labelAlphaTween?.cancel();
labelAlphaTween = FlxTween.tween(label, {alpha: (hintAlpha[0] + hintAlpha[1]) - targetAlpha}, transitionTime, {ease: FlxEase.circInOut});
}
}

onDown.add(createTween.bind(hintAlpha[swapValues ? 1 : 0], hintAlpha[2], true));
onUp.add(createTween.bind(hintAlpha[swapValues ? 0 : 1], hintAlpha[2], false));
onOut.add(createTween.bind(hintAlpha[swapValues ? 0 : 1], hintAlpha[2], false));

alpha = hintAlpha[swapValues ? 0 : 1];

}

/**
* Makes the hitbox follow the specified sprite.
*
* @param sprite The FunkinSprite instance that the hitbox should follow.
* @param followTargetSize A boolean indicating whether the hitbox should adjust to the target's size. Default is true.
*/
public function follow(sprite:FunkinSprite, followTargetSize:Bool = true):Void
{
this.followTargetSize = followTargetSize;
followTarget = sprite;
}

/**
* Desaturates the button, setting its saturation to 0.2.
*/
public function desaturate():Void
{
hsvShader.saturation = 0.2;
}

/**
* Sets the hue of the button.
*
* @param hue The new hue value.
*/
public function setHue(hue:Float):Void
{
hsvShader.hue = hue;
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{


{
setSize(followTarget.width * widthMultiplier + (isPixel ? 93.05 : 0), followTarget.height * heightMultiplier + (isPixel ? 118 : 0));
}

setPosition((followTarget.x - (followTarget.width * ((widthMultiplier - 1) / 2))) - xOffset, (followTarget.y - 220) - yOffset);
}
}

public override function draw():Void
{
super.draw();

{
label.cameras = _cameras;
label.draw();
}
}

public override function drawDebug():Void
{
super.drawDebug();

}

/**
* Cleans up memory used by the `FunkinHint`.
*/
public override function destroy():Void
{



super.destroy();
}

override function set_x(v:Float):Float
{
super.set_x(v);


}

override function set_y(v:Float):Float
{
super.set_y(v);


}
}

enum abstract FunkinHitboxControlSchemes(String) from String to String
{
}

/**
* This class represents a zone with four buttons, designed to be easily customizable in layout.
*/
class FunkinHitbox extends FlxTypedSpriteGroup<FunkinHint>
{
/**
* Indicates whether the hitbox is pixel.
*/

/**
* A `FlxTypedSignal` that triggers every time a button is pressed.
*/

/**
* A `FlxTypedSignal` that triggers every time a button is released.
*/

/**
* The list of tracked inputs for the hitbox.
*/

/**
* Creates a new `FunkinHitbox` object.
*/
public function new(?schemeOverride:String, ?showGradint:Bool = true, ?directionsOverride:Array<NoteDirection>, ?colorsOverride:Array<FlxColor>):Void
{
super();



switch (controlsScheme)
{
case FunkinHitboxControlSchemes.FourLanes:

for (i in 0...hintsNoteDirections.length)
{
add(createHintLane(i * hintWidth, 0, hintsNoteDirections[i % hintsNoteDirections.length], hintWidth, hintHeight,
hintsColors[i % hintsColors.length], true, showGradint));
}
case FunkinHitboxControlSchemes.DoubleThumbTriangle:

for (i in 0...2)
{

add(createHintTriangle(xOffset, 0, hintsNoteDirections[0], Math.floor(FlxG.width / 4), FlxG.height, hintsColors[0], showGradint));
add(createHintTriangle(xOffset, FlxG.height / 2, hintsNoteDirections[1], Math.floor(FlxG.width / 2), Math.floor(FlxG.height / 2), hintsColors[1],
showGradint));
add(createHintTriangle(xOffset, 0, hintsNoteDirections[2], Math.floor(FlxG.width / 2), Math.floor(FlxG.height / 2), hintsColors[2], showGradint));
add(createHintTriangle(xOffset + Math.floor(FlxG.width / 4), 0, hintsNoteDirections[3], Math.floor(FlxG.width / 4), FlxG.height, hintsColors[3],
showGradint));
}
case FunkinHitboxControlSchemes.DoubleThumbSquare:



for (i in 0...2)
{

for (j in 0...hintsNoteDirections.length)
{
{
add(createHintLane(xOffset + hintWidth, (j == 1) ? boxHeight : 0, hintsNoteDirections[j], boxWidth, boxHeight,
hintsColors[j % hintsColors.length], false, showGradint));
}
else
{
add(createHintLane(xOffset + (j == 0 ? 0 : hintWidth + boxWidth), 0, hintsNoteDirections[j], hintWidth, hintHeight,
hintsColors[j % hintsColors.length], false, showGradint));
}
}
}
case FunkinHitboxControlSchemes.DoubleThumbDPad:

for (i in 0...2)
{
for (j in 0...hintsAngles.length)
{

add(createHintCircle(i == 0 ? x + FullScreenScaleMode.gameNotchSize.x : x - FullScreenScaleMode.gameNotchSize.x, y,
hintsNoteDirections[j % hintsNoteDirections.length], hintSize, outlineThickness, hintsColors[j % hintsColors.length]));
}
}
case FunkinHitboxControlSchemes.Arrows:


for (i in 0...hintsNoteDirections.length)
{
add(createHintTransparentNote(xPos + i * hintWidth + noteSpacing * i, yPos, hintsNoteDirections[i % hintsNoteDirections.length], hintWidth,
hintHeight));
}
}

scrollFactor.set();

ControlsHandler.setupHitbox(PlayerSettings.player1.controls, this, trackedInputs);
}

public function getFirstHintByDirection(direction:NoteDirection):Null<FunkinHint>
{
forEachOfType(FunkinHint, function(hint:FunkinHint):Void
{
});

}

/**
* Creates a new `FunkinHint` lane button along side a graphic label with specified properties.
*
* @param x The x position of the button.
* @param y The y position of the button.
* @param noteDirection The direction of the note the button represents (e.g. left, right).
* @param width The width of the button.
* @param height The height of the button.
* @param id The ID of the button.
* @param color The color of the button.
* @return A new `FunkinHint` object.
*/
function createHintLane(x:Float, y:Float, noteDirection:NoteDirection, width:Int, height:Int, color:FlxColor = 0xFFFFFFFF, label:Bool = true,
gradient:Bool = true):FunkinHint
{
hint.loadGraphic(createHintLaneGraphic(width, height, color, gradient));
hint.onDown.add(onHintDown.dispatch.bind(hint));
hint.onUp.add(onHintUp.dispatch.bind(hint));
hint.onOut.add(onHintUp.dispatch.bind(hint));
hint.initTween(INVISIBLE_TILL_PRESS);
}

/**
* Creates a new `FunkinHint` triangle button with specified properties.
*
* @param x The x position of the triangle button.
* @param y The y position of the triangle button.
* @param noteDirection The direction of the note the button represents (e.g. left, right).
* @param size The size of the triangle (base length).
* @param upright A boolean indicating if the triangle is upright (true) or inverted (false).
* @param id The unique ID of the triangle button.
* @param color The color of the triangle button (default is white).
* @return A new `FunkinHint` triangle object.
*/
function createHintTriangle(x:Float, y:Float, noteDirection:NoteDirection, width:Int, height:Int, color:FlxColor = 0xFFFFFFFF,
gradient:Bool = true):FunkinHint
{
hint.loadGraphic(createHintTriangleGraphic(width, height, noteDirection, color, gradient));
hint.onDown.add(onHintDown.dispatch.bind(hint));
hint.onUp.add(onHintUp.dispatch.bind(hint));
hint.onOut.add(onHintUp.dispatch.bind(hint));
hint.initTween(INVISIBLE_TILL_PRESS);
hint.polygon = getTriangleVertices(width, height, noteDirection);
}

/**
* Creates a new `FunkinHint` circular button with specified properties.
*
* @param x The x position of the circular button.
* @param y The y position of the circular button.
* @param noteDirection The direction of the note the button represents (e.g., left, right).
* @param radius The radius of the circular button.
* @param outlineThickness The thickness of the outline for the circle.
* @param color The color of the circular button (default is white).
* @return A new `FunkinHint` circular object.
*/
function createHintCircle(x:Float, y:Float, noteDirection:NoteDirection, radius:Float, outlineThickness:Int, color:FlxColor = 0xFFFFFFFF):FunkinHint
{
hint.loadGraphic(createHintCircleGraphic(radius, outlineThickness, color));
hint.limitToBounds = false;
hint.radius = radius;
hint.onDown.add(onHintDown.dispatch.bind(hint));
hint.onUp.add(onHintUp.dispatch.bind(hint));
hint.onOut.add(onHintUp.dispatch.bind(hint));
hint.initTween(VISIBLE_TILL_PRESS);
}

/**
* Creates a new `FunkinHint` representing a transparent note corresponding to the note from the scene.
* @param x The x position of the button.
* @param y The y position of the button.
* @param noteDirection The direction of the note the button represents (e.g. left, right).
* @param width The width of the button.
* @param height The height of the button.
* @return A new `FunkinHint` object.
*/
function createHintTransparentNote(x:Float, y:Float, noteDirection:NoteDirection, width:Int, height:Int):FunkinHint
{
hint.alpha = 0;
hint.setSize(width, height);
hint.onDown.add(onHintDown.dispatch.bind(hint));
hint.onUp.add(onHintUp.dispatch.bind(hint));
hint.onOut.add(onHintUp.dispatch.bind(hint));

{
hint.frames = Paths.getSparrowAtlas(noteStyle.getStrumlineAssetPath() ?? '', noteStyle.getAssetLibrary(noteStyle.getStrumlineAssetPath(true)));
FlxAnimationUtil.addAtlasAnimations(hint, noteStyle.getStrumlineAnimationData(noteDirection));
}

hint.animation.play('static', true);

hint.onDown.add(() ->
{
hint.animation.play('press', true);
hint.centerOrigin();
hint.centerOffsets();
});

hint.onUp.add(() ->
{
hint.animation.play('static', true);
hint.centerOrigin();
hint.centerOffsets();
});

hint.onOut.add(() ->
{
hint.animation.play('static', true);
hint.centerOrigin();
hint.centerOffsets();
});

hint.centerOffsets();
hint.centerOrigin();

}

/**
* Creates a lane graphic for a hint button.
*
* @param width The width of the graphic.
* @param height The height of the graphic.
* @param baseColor The base color of the graphic.
* @return A `FlxGraphic` object representing the button graphic.
*/
function createHintLaneGraphic(width:Int, height:Int, baseColor:FlxColor = 0xFFFFFFFF, gradient:Bool = true):FlxGraphic
{

{
matrix.createGradientBox(width, height, 0, 0, 0);
shape.graphics.beginGradientFill(RADIAL, [baseColor.rgb, baseColor.rgb], [0, baseColor.alphaFloat], [60, 255], matrix, PAD, RGB, 0);
}
else
{
shape.graphics.beginFill(baseColor.rgb, baseColor.alphaFloat);
}

shape.graphics.drawRect(0, 0, width, height);
shape.graphics.endFill();

graphicData.draw(shape, true);
}

function createHintLaneLabelGraphic(width:Int, height:Int, labelHeight:Int, baseColor:FlxColor = 0xFFFFFFFF):FlxGraphic
{
shape.graphics.beginFill(0, 0);
shape.graphics.drawRect(0, 0, width, height);
shape.graphics.endFill();

matrix.createGradientBox(width, labelHeight, Math.PI / 2, 0, 0);
shape.graphics.beginGradientFill(LINEAR, [baseColor.rgb, baseColor.rgb], [baseColor.alphaFloat, 0], [0, 255], matrix);
shape.graphics.drawRect(0, 0, width, labelHeight);
shape.graphics.endFill();

matrix.createGradientBox(width, labelHeight, Math.PI / 2, 0, height - labelHeight);
shape.graphics.beginGradientFill(LINEAR, [baseColor.rgb, baseColor.rgb], [0, baseColor.alphaFloat], [0, 255], matrix);
shape.graphics.drawRect(0, height - labelHeight, width, labelHeight);
shape.graphics.endFill();

graphicData.draw(shape, true);
}

/**
* Creates a triangle graphic for a hint button.
*
* @param size The base length of the triangle.
* @param upright A boolean indicating if the triangle is upright (true) or inverted (false).
* @param baseColor The base color of the triangle graphic (default is white).
* @return A `FlxGraphic` object representing the triangle button graphic.
*/
function createHintTriangleGraphic(width:Int, height:Int, facing:NoteDirection, baseColor:FlxColor = 0xFFFFFFFF, gradient:Bool = true):FlxGraphic
{

{
matrix.createGradientBox(width, height, 0, 0, 0);
shape.graphics.beginGradientFill(RADIAL, [baseColor.rgb, baseColor.rgb], [0, baseColor.alphaFloat], [60, 255], matrix, PAD, RGB, 0);
}
else
{
shape.graphics.beginFill(baseColor.rgb, baseColor.alphaFloat);
}

shape.graphics.drawRect(width / 2, height / 2, width / 2, height / 2);
shape.graphics.drawTriangles(Vector.ofArray(getTriangleVertices(width, height, facing)), Vector.ofArray([0, 1, 2]));
shape.graphics.endFill();

graphicData.draw(shape, true);
}

/**
* Creates a circular graphic for a hint button.
*
* @param radius The radius of the circle.
* @param baseColor The base color of the circle graphic (default is white).
* @param outlineThickness The thickness of the outline for the circle.
* @return A `FlxGraphic` object representing the circular button graphic.
*/
function createHintCircleGraphic(radius:Float, outlineThickness:Int, baseColor:FlxColor = 0xFFFFFFFF):FlxGraphic
{
brightColor.brightness += 0.6;


shape.graphics.beginFill(baseColor.rgb, baseColor.alphaFloat);
shape.graphics.lineStyle(outlineThickness, brightColor.rgb, brightColor.alpha);
shape.graphics.drawCircle(radius, radius, radius);
shape.graphics.endFill();

matrix.translate(outlineThickness, outlineThickness);

graphicData.draw(shape, matrix, true);
}

/**
* Сalculates vertices in a given direction
* @param width width of triangle
* @param height height of triangle
* @param facing The side the triangle faces
* @return array of vertices
*/
function getTriangleVertices(width:Int, height:Int, facing:NoteDirection):Array<Float>
{
else if (facing == DOWN) facing = UP;

{
case UP: [width / 2, 0, 0, height, width, height];
case DOWN: [0, 0, width, 0, width / 2, height];
case LEFT: [0, 0, width, height / 2, 0, height];
case RIGHT: [width, 0, 0, height / 2, width, height];
}
}

/**
* Cleans up memory used by the `FunkinHitbox`.
*/
public override function destroy():Void
{

FlxDestroyUtil.destroy(onHintDown);
FlxDestroyUtil.destroy(onHintUp);

super.destroy();
}

function set_isPixel(value:Bool):Bool
{
isPixel = value;
forEachOfType(FunkinHint, function(hint:FunkinHint):Void
{
hint.isPixel = value;
});
}
}
