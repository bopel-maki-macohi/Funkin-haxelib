

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
}

override function create()
{










for (thing in playState.currentStage)
{
{
layerList.dataSource.add({
item: prop.name,
complete: true,
id: 'swag'
}

FlxMouseEvent.add(thing, spr ->
{


{
}
}, null, spr ->
{

{
}
else
{
}
}, spr ->
{
{
}
}
}

function selectProp(propName:String)
{







}

function setupUIListeners()
{


addUIChangeListener('propXPos', (event:UIEvent) ->
{
{
}

addUIChangeListener('propYPos', (event:UIEvent) ->
{
{
}

addUIChangeListener('prop-layers', (event:UIEvent) ->
{

}



override function update(elapsed:Float)
{

{
for (ind => cmd in commandStack)
{

}
}

{
}

{
{
}

{
}
}

{

}





{
for (thing in PlayState.instance.currentStage)
{
}


PlayState.instance.disableKeys = false;
PlayState.instance.resetCamera();
}
}


function performCommand(command:StageEditorCommand):Void
{
}

function undoCommand(command:StageEditorCommand):Void
{
}

function undoLastCommand():Void
{
{
}

}


function saveStageFileRef(_):Void
{

_file.save(jsonStr, PlayState.instance.currentStageId + ".json");
}

function onSaveComplete(_)
{
}

function onSaveCancel(_)
{
}

function onSaveError(_)
{
}

function fileRemoveListens()
{
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

}





}
}
