


/**
* Handles the Stage Props and Datas - being able to convert one to the other.
*/
class AssetDataHandler
{

public static function init(state:StageEditorState)
{
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
}

for (name => bit in state.bitmaps)
{
{
}
}


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
}
else if (areTheseBitmapsEqual(data.bitmap, getDefaultGraphic()))
{
}
else
{
}
}
else
{
{
{
}
else
{
}
}
else if (data.assetPath.startsWith("#"))
{
}
else
}


for (anim in data.animations)
{
object.addAnim(anim.name, anim.prefix, anim.offsets ?? [0, 0], anim.frameIndices ?? [], anim.frameRate ?? 24, anim.looped ?? false, anim.flipX ?? false,
}


switch (data.scale)
{
case Left(value):

case Right(values):
}


flixel.util.FlxTimer.wait(StageEditorState.TIME_BEFORE_ANIM_STOP, function()
{

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
}

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
