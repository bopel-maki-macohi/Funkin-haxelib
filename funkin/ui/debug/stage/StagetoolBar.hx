package funkin.ui.debug.stage;

#if FEATURE_STAGE_EDITOR

class StagetoolBar extends FlxGroup
{
  var icons:Array<StageBuilderState.TOOLS> = [SELECT, MOVE, GRAB, BOYFRIEND];
  var iconSprs:Array<String> = ['cursorSelect', 'cursorGrab', 'cursorMove', 'toolbarBF'];

  public function new()
  {
    super();
  }
}
#end
