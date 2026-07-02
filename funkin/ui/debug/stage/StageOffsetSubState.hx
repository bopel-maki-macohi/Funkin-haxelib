package funkin.ui.debug.stage;


/**
* A substate dedicated to allowing the user to create and edit stages/props
* Built with HaxeUI for use by both developers and modders.
*
* All functionality is kept within this file to ruin my own sanity.
*
* @author ninjamuffin99
*/
class StageOffsetSubState extends HaxeUISubState
{



public function new()
{
super(STAGE_EDITOR_LAYOUT);
}

override function create()
{
super.create();


playState.pauseMusic();
playState.cancelAllCameraTweens();

setupUIListeners();




playState.persistentUpdate = true;
component.cameras = [playState.camHUD];

outlineShader = new StrokeShader(0xFFFFFFFF, 4, 4);


for (thing in playState.currentStage)
{
{
layerList.dataSource.add({
item: prop.name,
complete: true,
id: 'swag'
});
}

FlxMouseEvent.add(thing, spr ->
{


{
}
}, null, spr ->
{

{
spr.ID = 1;
spr.alpha = 0.5;
}
else
{
spr.ID = 0;
spr.alpha = 1;
}
}, spr ->
{
{
spr.ID = 0;
spr.alpha = 1;
}
});
}
}

function selectProp(propName:String)
{



performCommand(new SelectPropCommand(proptemp));

char.shader = outlineShader;

sprOld.x = char.x;
sprOld.y = char.y;

mosPosOld.x = FlxG.mouse.x;
mosPosOld.y = FlxG.mouse.y;

setUIValue('propXPos', char.x);
setUIValue('propYPos', char.y);
}

function setupUIListeners()
{
addUIClickListener('lol', saveCharacterCompile);
addUIClickListener('saveAs', saveStageFileRef);


addUIChangeListener('propXPos', (event:UIEvent) ->
{
{
char.x = event.value;
}
});

addUIChangeListener('propYPos', (event:UIEvent) ->
{
{
char.y = event.value;
}
});

addUIChangeListener('prop-layers', (event:UIEvent) ->
{
});

setUICheckboxSelected('complete', false);
}



override function update(elapsed:Float)
{
super.update(elapsed);

{
for (ind => cmd in commandStack)
{

}
}

{
setUIValue('propXPos', char.x);
setUIValue('propYPos', char.y);
}

{
{
char.x = sprOld.x - (mosPosOld.x - FlxG.mouse.x);
char.y = sprOld.y - (mosPosOld.y - FlxG.mouse.y);
}

{
performCommand(new MovePropCommand(-xDiff, -yDiff, false));
}
}

{

}


MouseUtil.mouseCamDrag();



{
for (thing in PlayState.instance.currentStage)
{
FlxMouseEvent.remove(thing);
thing.alpha = 1;
}


PlayState.instance.disableKeys = false;
PlayState.instance.resetCamera();
close();
}
}


function performCommand(command:StageEditorCommand):Void
{
command.execute(this);
commandStack.push(command);
curOperation++;
}

function undoCommand(command:StageEditorCommand):Void
{
command.undo(this);
curOperation--;
}

function undoLastCommand():Void
{
{
}

undoCommand(command);
}


function saveStageFileRef(_):Void
{

_file = new FileReference();
_file.addEventListener(Event.COMPLETE, onSaveComplete);
_file.addEventListener(Event.CANCEL, onSaveCancel);
_file.addEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file.save(jsonStr, PlayState.instance.currentStageId + ".json");
}

function onSaveComplete(_)
{
fileRemoveListens();
}

function onSaveCancel(_)
{
fileRemoveListens();
}

function onSaveError(_)
{
fileRemoveListens();
}

function fileRemoveListens()
{
_file.removeEventListener(Event.COMPLETE, onSaveComplete);
_file.removeEventListener(Event.CANCEL, onSaveCancel);
_file.removeEventListener(IOErrorEvent.IO_ERROR, onSaveError);
_file = null;
}

function saveCharacterCompile(_):Void
{

sys.io.File.saveContent('./assets/data/stages/' + PlayState.instance.currentStageId + '.json', outputJson);

sys.io.File.saveContent('../../../../assets/preload/data/stages/' + PlayState.instance.currentStageId + '.json', outputJson);
}

function prepStageStuff():String
{

{
}

for (prop in stageLol.props)
{

prop.position[0] = posStuff.x;
prop.position[1] = posStuff.y;
}

stageLol.characters.bf.position[0] = Std.int(bfPos.x);
stageLol.characters.bf.position[1] = Std.int(bfPos.y);


stageLol.characters.dad.position[0] = Std.int(dadPos.x);
stageLol.characters.dad.position[1] = Std.int(dadPos.y);

stageLol.characters.gf.position[0] = Std.int(GF_FEET_SNIIIIIIIIIIIIIFFFF.x);
stageLol.characters.gf.position[1] = Std.int(GF_FEET_SNIIIIIIIIIIIIIFFFF.y);

}
}
