package funkin.ui.debug.stageeditor.handlers;


using StringTools;

/**
* Handles the Stage Props and Datas - being able to convert one to the other.
*/
class AssetDataHandler
{

public static function init(state:StageEditorState)
{
AssetDataHandler.state = state;
}

/**
* Turns an Object into Data.
* @param obj the Object whose data to read.
* @param useBitmaps Whether to Save object's BitmapData directly.
* @return Data of the Object
*/
public static function toData(obj:StageEditorObject, useBitmaps:Bool = false):StageEditorObjectData
{
name: obj.name,
assetPath: "",
position: [obj.x, obj.y],
zIndex: obj.zIndex,
isPixel: !obj.antialiasing,
scale: obj.scale.x == obj.scale.y ? Left(obj.scale.x) : Right([obj.scale.x, obj.scale.y]),
alpha: obj.alpha,
danceEvery: obj.animation.getNameList().length > 0 ? obj.danceEvery : 0,
scroll: [obj.scrollFactor.x, obj.scrollFactor.y],
animations: [for (n => d in obj.animDatas) d],
startingAnimation: obj.startingAnimation,
animType: "sparrow", // automatically making sparrow atlases yeah
angle: obj.angle,
flipX: obj.flipX,
flipY: obj.flipY,
blend: obj.blend == null ? "" : Std.string(obj.blend),
color: obj.color.toWebString(),
animData: ""
}

{
outputData.bitmap = obj.pixels.clone();
outputData.animData = obj.generateXML();
}

for (name => bit in state.bitmaps)
{
{
outputData.assetPath = name;
outputData.animData = obj.generateXML(name);
}
}

outputData.assetPath = "#FFFFFF";

}

/**
* Modifies an Object based on the Data.
* @param object Object to modify. Set to null to create a new one.
* @param data The Data used for the Object.
*/
public static function fromData(object:StageEditorObject, data:StageEditorObjectData)
{
{
{
object.frames = FlxAtlasFrames.fromSparrow(state.bitmaps[bitToLoad], data.animData);
}
else if (areTheseBitmapsEqual(data.bitmap, getDefaultGraphic()))
{
object.loadGraphic(getDefaultGraphic());
}
else
{
object.loadGraphic(state.bitmaps[bitToLoad]);
}
}
else
{
{
{
object.frames = FlxAtlasFrames.fromSparrow(state.bitmaps[data.assetPath].clone(), data.animData);
}
else
{
object.frames = FlxAtlasFrames.fromSpriteSheetPacker(state.bitmaps[data.assetPath].clone(), data.animData);
}
}
else if (data.assetPath.startsWith("#"))
{
object.loadGraphic(getDefaultGraphic());
object.color = FlxColor.fromString(data.assetPath);
}
else
object.loadGraphic(state.bitmaps[data.assetPath].clone());
}

object.name = data.name;
object.setPosition(data.position[0], data.position[1]);
object.zIndex = data.zIndex;
object.antialiasing = !data.isPixel;
object.alpha = data.alpha;
object.danceEvery = data.danceEvery;
object.scrollFactor.set(data.scroll[0], data.scroll[1]);
object.startingAnimation = data.startingAnimation;
object.angle = data.angle;
object.blend = blendFromString(data.blend);

for (anim in data.animations)
{
object.addAnim(anim.name, anim.prefix, anim.offsets ?? [0, 0], anim.frameIndices ?? [], anim.frameRate ?? 24, anim.looped ?? false, anim.flipX ?? false,
anim.flipY ?? false);
}


switch (data.scale)
{
case Left(value):
object.scale.set(value, value);

case Right(values):
object.scale.set(values[0], values[1]);
}
object.updateHitbox();

object.playAnim(object.startingAnimation);

flixel.util.FlxTimer.wait(StageEditorState.TIME_BEFORE_ANIM_STOP, function()
{
});

}

/**
* Returns a default BitmapData to be used for all the props.
* @return BitmapData
*/
public static function getDefaultGraphic():BitmapData
{
}

/**
* Returns OpenFL's BlendMode based on the Name.
* @param blend the BlendMode Name.
* @return BlendMode
*/
public static function blendFromString(blend:String):BlendMode
{
}

public static function generateXML(obj:StageEditorObject, bitmapName:String = "")
{


for (daFrame in obj.frames.frames)
{
xml += ' <SubTexture name="${daFrame.name}" x="${daFrame.frame.x}" y="${daFrame.frame.y}" width="${daFrame.frame.width}" height="${daFrame.frame.height}" frameX="${- daFrame.offset.x}" frameY="${- daFrame.offset.y}" frameWidth="${daFrame.sourceSize.x}" frameHeight="${daFrame.sourceSize.y}" flipX="${daFrame.flipX}" flipY="${daFrame.flipY}" rotated="${daFrame.angle == -90}"/>\n';
}

xml += "</TextureAtlas>";
}

static function areTheseBitmapsEqual(bitmap1:BitmapData, bitmap2:BitmapData)
{


for (i in 0...bytes1.length)
{
{
}
}

}
}

typedef StageEditorObjectData =
{
> StageDataProp,
}
