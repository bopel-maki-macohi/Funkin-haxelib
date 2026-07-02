package funkin.ui.debug.stageeditor.handlers;


using StringTools;

class StageDataHandler
{
public static function checkForCharacter(char:BaseCharacter) return char != null;

public static function packShitToZip(state:StageEditorState)
{
endData.name = state.stageName;
endData.cameraZoom = state.stageZoom;
endData.directory = state.stageFolder;


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
});

}

endData.characters.bf.zIndex = state.charGroups[CharacterType.BF].zIndex;
endData.characters.dad.zIndex = state.charGroups[CharacterType.DAD].zIndex;
endData.characters.gf.zIndex = state.charGroups[CharacterType.GF].zIndex;

endData.characters.bf.scale = state.bf.scale.x / state.bf.getBaseScale();
endData.characters.dad.scale = state.dad.scale.x / state.dad.getBaseScale();
endData.characters.gf.scale = state.gf.scale.x / state.gf.getBaseScale();

endData.characters.bf.cameraOffsets = state.charCamOffsets[CharacterType.BF].copy();
endData.characters.gf.cameraOffsets = state.charCamOffsets[CharacterType.GF].copy();
endData.characters.dad.cameraOffsets = state.charCamOffsets[CharacterType.DAD].copy();

endData.characters.bf.alpha = state.bf.alpha;
endData.characters.gf.alpha = state.gf.alpha;
endData.characters.dad.alpha = state.dad.alpha;

endData.characters.bf.angle = state.bf.angle;
endData.characters.gf.angle = state.gf.angle;
endData.characters.dad.angle = state.dad.angle;

endData.characters.bf.scroll = [state.bf.scrollFactor.x, state.bf.scrollFactor.y];
endData.characters.gf.scroll = [state.gf.scrollFactor.x, state.gf.scrollFactor.y];
endData.characters.dad.scroll = [state.dad.scrollFactor.x, state.dad.scrollFactor.y];

endData.characters.bf.position = [state.bf.feetPosition.x - state.bf.globalOffsets[0], state.bf.feetPosition.y - state.bf.globalOffsets[1]];

endData.characters.gf.position = [state.gf.feetPosition.x - state.gf.globalOffsets[0], state.gf.feetPosition.y - state.gf.globalOffsets[1]];

endData.characters.dad.position = [state.dad.feetPosition.x - state.dad.globalOffsets[0], state.dad.feetPosition.y - state.dad.globalOffsets[1]];


state.removeUnusedBitmaps();
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

entryList.push(entry);
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

entryList.push(entry);
}

entryList.push({
fileName: formatStageId(endData.name) + ".json",
fileSize: stageBytes.length,
fileTime: Date.now(),
compressed: false,
dataSize: stageBytes.length,
data: stageBytes,
crc32: null
});

}

public static function unpackShitFromZip(state:StageEditorState, zip:Bytes)
{
state.clearAssets();
state.bitmaps.clear();



for (stuff in entries)
{

switch (ext)
{
case "png":
state.bitmaps.set(stuff.fileName.replace(".png", ""), data);

case "xml":
xmls.set(stuff.fileName.replace(".xml", ""), stuff.data.toString());

case "json":
stageData = StageRegistry.instance.parseEntryDataRaw(stuff.data.toString(), stuff.fileName);
}
}

{
loadDummyData(state);
}

state.stageName = stageData.name;
state.stageZoom = stageData.cameraZoom;
state.stageFolder = stageData.directory ?? "shared";

state.loadCharDatas(stageData);

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
});

state.add(spr);
}

state.updateArray();
state.sortAssets();
state.updateMarkerPos();
}

static function loadCharDatas(state:StageEditorState, data:StageData)
{
for (char in chars)
{

switch (char.characterType)
{
case CharacterType.BF:
charData = data.characters.bf;
case CharacterType.GF:
charData = data.characters.gf;
case CharacterType.DAD:
charData = data.characters.dad;
default: // nothing rip
}

char.resetCharacter(true);


char.x = charData.position[0] - char.characterOrigin.x;
char.y = charData.position[1] - char.characterOrigin.y;
state.charGroups[char.characterType].zIndex = charData.zIndex;

char.setScale(char.getBaseScale() * charData.scale);
char.cameraFocusPoint.x += charData.cameraOffsets[0];
char.cameraFocusPoint.y += charData.cameraOffsets[1];

char.alpha = charData.alpha;
char.angle = charData.angle;
char.scrollFactor.set(charData.scroll[0], charData.scroll[1]);

state.charCamOffsets[char.characterType] = charData.cameraOffsets.copy();
}
}

public static function loadFromDataRaw(state:StageEditorState, data:StageData)
{
state.clearAssets();
state.bitmaps.clear();

{
loadDummyData(state);
}
{
loadDummyData(state);
}

Paths.setCurrentLevel(data.directory);

{
OpenFLAssets.loadLibrary(data.directory).onComplete(function(_)
{
loadFromDataRaw(state, data);
});
}

state.stageName = data.name;
state.stageZoom = data.cameraZoom;
state.stageFolder = data.directory ?? "shared";

state.loadCharDatas(data);

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
});

state.add(spr);
}

state.updateArray();
state.updateMarkerPos();
}

public static function loadDummyData(state:StageEditorState)
{
state.clearAssets();

state.stageName = "Unnamed";
state.stageZoom = 1.0;
state.stageFolder = "shared";

state.charCamOffsets = StageEditorState.DEFAULT_CAMERA_OFFSETS.copy();
state.charPos = StageEditorState.DEFAULT_POSITIONS.copy();

state.gf.resetCharacter(true);
state.dad.resetCharacter(true);
state.bf.resetCharacter(true);

state.charGroups[CharacterType.BF].zIndex = 300;
state.charGroups[CharacterType.DAD].zIndex = 200;
state.charGroups[CharacterType.GF].zIndex = 100;

state.gf.x = state.charPos[CharacterType.GF][0] - state.gf.characterOrigin.x + state.gf.globalOffsets[0];
state.gf.y = state.charPos[CharacterType.GF][1] - state.gf.characterOrigin.y + state.gf.globalOffsets[1];
state.dad.x = state.charPos[CharacterType.DAD][0] - state.dad.characterOrigin.x + state.dad.globalOffsets[0];
state.dad.y = state.charPos[CharacterType.DAD][1] - state.dad.characterOrigin.y + state.dad.globalOffsets[1];
state.bf.x = state.charPos[CharacterType.BF][0] - state.bf.characterOrigin.x + state.bf.globalOffsets[0];
state.bf.y = state.charPos[CharacterType.BF][1] - state.bf.characterOrigin.y + state.bf.globalOffsets[1];

state.gf.setScale(state.gf.getBaseScale());
state.dad.setScale(state.dad.getBaseScale());
state.bf.setScale(state.bf.getBaseScale());

state.gf.cameraFocusPoint.x += state.charCamOffsets[CharacterType.GF][0];
state.gf.cameraFocusPoint.y += state.charCamOffsets[CharacterType.GF][1];
state.dad.cameraFocusPoint.x += state.charCamOffsets[CharacterType.DAD][0];
state.dad.cameraFocusPoint.y += state.charCamOffsets[CharacterType.DAD][1];
state.bf.cameraFocusPoint.x += state.charCamOffsets[CharacterType.BF][0];
state.bf.cameraFocusPoint.y += state.charCamOffsets[CharacterType.BF][1];


state.updateMarkerPos();
}

static function formatStageId(name:String)
{
name = name.sanitize();
name = name.charAt(0).toLowerCase() + name.substring(1);


}
}
