


class StageDataHandler
{

public static function packShitToZip(state:StageEditorState)
{


for (obj in state.spriteArray)
{
endData.props.push({
name: data.name,
assetPath: data.assetPath.startsWith("#") ? data.color : data.assetPath,
position: data.position.copy(),
zIndex: data.zIndex,
isPixel: data.isPixel,
scale: data.scale,
alpha: data.alpha,
danceEvery: data.danceEvery,
scroll: data.scroll.copy(),
animations: data.animations,
startingAnimation: data.startingAnimation,
animType: data.animType,
flipX: data.flipX,
flipY: data.flipY,
angle: data.angle,
blend: data.blend,
color: data.assetPath.startsWith("#") ? "#FFFFFF" : data.color

}











for (name => img in state.bitmaps)
{

fileName: name + ".png",
fileSize: bytes.length,
fileTime: Date.now(),
compressed: false,
dataSize: bytes.length,
data: bytes,
crc32: null // apparently fileutil.hx does not like crc32, idk why but i dont even know what crc32 is
}

}

for (path => xml in xmlMap)
{

fileName: path + ".xml",
fileSize: bytes.length,
fileTime: Date.now(),
compressed: false,
dataSize: bytes.length,
data: bytes,
crc32: null
}

}

entryList.push({
fileName: formatStageId(endData.name) + ".json",
fileSize: stageBytes.length,
fileTime: Date.now(),
compressed: false,
dataSize: stageBytes.length,
data: stageBytes,
crc32: null

}

public static function unpackShitFromZip(state:StageEditorState, zip:Bytes)
{



for (stuff in entries)
{

switch (ext)
{
case "png":

case "xml":

case "json":
stageData = StageRegistry.instance.parseEntryDataRaw(stuff.data.toString(), stuff.fileName);
}
}

{
}



for (objData in stageData.props)
{
spr.fromData({
name: objData.name ?? "Unnamed",
assetPath: objData.assetPath,
animations: objData.animations.copy(),
scale: objData.scale,
position: objData.position,
alpha: objData.alpha,
angle: objData.angle,
zIndex: objData.zIndex,
danceEvery: objData.danceEvery,
isPixel: objData.isPixel,
scroll: objData.scroll.copy(),
color: objData.color,
blend: objData.blend,
flipX: objData.flipX,
flipY: objData.flipY,
startingAnimation: objData.startingAnimation,
animData: xmls[objData.assetPath] ?? ""

}

}

static function loadCharDatas(state:StageEditorState, data:StageData)
{
for (char in chars)
{

switch (char.characterType)
{
case CharacterType.BF:
case CharacterType.GF:
case CharacterType.DAD:
default: // nothing rip
}






}
}

public static function loadFromDataRaw(state:StageEditorState, data:StageData)
{

{
}
{
}


{
OpenFLAssets.loadLibrary(data.directory).onComplete(function(_)
{
}



for (objData in data.props)
{


spr.fromData({
name: objData.name ?? "Unnamed",
assetPath: objData.assetPath,
animations: objData.animations.copy(),
scale: objData.scale,
position: objData.position,
alpha: objData.alpha,
angle: objData.angle,
zIndex: objData.zIndex,
danceEvery: objData.danceEvery,
isPixel: objData.isPixel,
scroll: objData.scroll.copy(),
color: objData.color,
blend: objData.blend,
flipX: objData.flipX,
flipY: objData.flipY,
startingAnimation: objData.startingAnimation,
animData: animText

}

}

public static function loadDummyData(state:StageEditorState)
{









}

static function formatStageId(name:String)
{


}
}
