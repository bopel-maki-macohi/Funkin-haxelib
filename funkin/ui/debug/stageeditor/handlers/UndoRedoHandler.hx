package funkin.ui.debug.stageeditor.handlers;


class UndoRedoHandler
{
public static function performLastAction(state:StageEditorState, redo:Bool = false):Void
{

switch (actionToDo.type)
{
case CHARACTER_MOVED:
createAndPushAction(state, actionToDo.type, !redo);


for (char in state.getCharacters())
{
}

state.selectedChar.x = pos[0] - state.selectedChar.characterOrigin.x + state.selectedChar.globalOffsets[0];
state.selectedChar.y = pos[1] - state.selectedChar.characterOrigin.y + state.selectedChar.globalOffsets[1];

state.updateMarkerPos();
state.updateDialog(StageEditorDialogType.CHARACTER);

case OBJECT_MOVED:

for (obj in state.spriteArray)
{
}

{
createAndPushAction(state, actionToDo.type, !redo);

state.selectedSprite.x = pos[0];
state.selectedSprite.y = pos[1];

state.updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
}

case OBJECT_CREATED: // this removes the object

for (obj in state.spriteArray)
{
{
state.selectedSprite = obj;
createAndPushAction(state, OBJECT_DELETED, !redo);

state.selectedSprite = null;

obj.kill();
state.remove(obj, true);
obj.destroy();

state.updateArray();
state.updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
state.updateDialog(StageEditorDialogType.OBJECT_ANIMS);
state.updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);

continue;
}
}

case OBJECT_DELETED: // this creates the object


obj.ID = id;
state.selectedSprite = obj;

createAndPushAction(state, OBJECT_CREATED, !redo);
state.add(obj);

state.updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
state.updateDialog(StageEditorDialogType.OBJECT_ANIMS);
state.updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
state.updateArray();

case OBJECT_ROTATED: // primarily copied from OBJECT_MOVED

for (obj in state.spriteArray)
{
}

{
createAndPushAction(state, actionToDo.type, !redo);
state.selectedSprite.angle = angle;
state.updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
}

default: // do nothing dumbass
}
}

public static function createAndPushAction(state:StageEditorState, action:UndoActionType, redo:Bool = false)
{



switch (action)
{
case CHARACTER_MOVED:

case OBJECT_MOVED:

case OBJECT_CREATED:

case OBJECT_DELETED:
ID: state.selectedSprite.ID,
data: state.selectedSprite.toData(true)
}

case OBJECT_ROTATED:

default: // nop
}


else if (!redo) state.undoArray.push(finalAction);
}
}

typedef UndoAction =
{
/**
* The Type of Undo Action to store.
*/

/**
* The added Data of the Action.
*/
}

enum abstract UndoActionType(String) from String
{
/**
* Triggerred when an Object is deleted.
*/

/**
* Triggerred when an Object is created.
*/

/**
* Triggerred when an Object is moved.
*/

/**
* Triggerred when a Character is moved.
*/

/**
* Triggerred when an Object is rotated.
*/
}
