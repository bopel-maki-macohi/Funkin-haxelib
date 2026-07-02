

class UndoRedoHandler
{
public static function performLastAction(state:StageEditorState, redo:Bool = false):Void
{

switch (actionToDo.type)
{
case CHARACTER_MOVED:


for (char in state.getCharacters())
{
}



case OBJECT_MOVED:

for (obj in state.spriteArray)
{
}

{


}

case OBJECT_CREATED: // this removes the object

for (obj in state.spriteArray)
{
{




}
}

case OBJECT_DELETED: // this creates the object





case OBJECT_ROTATED: // primarily copied from OBJECT_MOVED

for (obj in state.spriteArray)
{
}

{
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
