package funkin.ui.debug.charting.handlers;


/**
* Static functions which handle building themed UI elements for a provided ChartEditorState.
*/
class ChartEditorToolboxHandler
{
public static function setToolboxState(state:ChartEditorState, id:String, shown:Bool):Void
{
{
showToolbox(state, id);
}
else
{
hideToolbox(state, id);
}
}

public static function showToolbox(state:ChartEditorState, id:String):Void
{


{
toolbox.showDialog(false);

state.playSound(Paths.sound('chartingSounds/openWindow'));

switch (id)
{
case ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYTEST_PROPERTIES_LAYOUT:
onShowToolboxPlaytestProperties(state, toolbox);
case ChartEditorState.CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_FREEPLAY_LAYOUT:
cast(toolbox, ChartEditorBaseToolbox).refresh();
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT:
onShowToolboxPlayerPreview(state, toolbox);
case ChartEditorState.CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT:
onShowToolboxOpponentPreview(state, toolbox);
default:
}
}
else
{
}
}

public static function hideToolbox(state:ChartEditorState, id:String):Void
{


{
toolbox.hideDialog(DialogButton.CANCEL);

state.playSound(Paths.sound('chartingSounds/exitWindow'));

switch (id)
{
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYTEST_PROPERTIES_LAYOUT:
onHideToolboxPlaytestProperties(state, toolbox);
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT:
onHideToolboxPlayerPreview(state, toolbox);
case ChartEditorState.CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT:
onHideToolboxOpponentPreview(state, toolbox);
default:
}
}
else
{
}
}

public static function refreshToolbox(state:ChartEditorState, id:String):Void
{


{
toolbox.refresh();
}
else
{
}
}

public static function rememberOpenToolboxes(state:ChartEditorState):Void
{
}

public static function openRememberedToolboxes(state:ChartEditorState):Void
{
}

public static function hideAllToolboxes(state:ChartEditorState):Void
{
for (toolbox in state.activeToolboxes.values())
{
toolbox.hideDialog(DialogButton.CANCEL);
}
}

public static function minimizeToolbox(state:ChartEditorState, id:String):Void
{


toolbox.minimized = true;
}

public static function maximizeToolbox(state:ChartEditorState, id:String):Void
{


toolbox.minimized = false;
}

public static function initToolbox(state:ChartEditorState, id:String):Null<CollapsibleDialog>
{
switch (id)
{
case ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT:
toolbox = buildToolboxNoteDataLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT:
toolbox = buildToolboxEventDataLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYTEST_PROPERTIES_LAYOUT:
toolbox = buildToolboxPlaytestPropertiesLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT:
toolbox = buildToolboxDifficultyLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT:
toolbox = buildToolboxMetadataLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT:
toolbox = buildToolboxOffsetsLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_FREEPLAY_LAYOUT:
toolbox = buildToolboxFreeplayLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT:
toolbox = buildToolboxPlayerPreviewLayout(state);
case ChartEditorState.CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT:
toolbox = buildToolboxOpponentPreviewLayout(state);
default:
toolbox = null;
}


toolbox.destroyOnClose = false;
state.activeToolboxes.set(id, toolbox);

}

/**
* Retrieve a toolbox by its layout's asset ID.
* @param state The ChartEditorState instance.
* @param id The asset ID of the toolbox layout.
* @return The toolbox.
*/
public static function getToolboxUnCast(state:ChartEditorState, id:String):Null<CollapsibleDialog>
{



}

public static function getToolbox(state:ChartEditorState, id:String):Null<ChartEditorBaseToolbox>
{



}

static function buildToolboxNoteDataLayout(state:ChartEditorState):Null<CollapsibleDialog>
{


}

static function onShowToolboxPlaytestProperties(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}

static function onHideToolboxPlaytestProperties(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}

static function buildToolboxPlaytestPropertiesLayout(state:ChartEditorState):Null<CollapsibleDialog>
{


toolbox.onDialogClosed = function(_)
{
state.menubarItemToggleToolboxPlaytestProperties.selected = false;
}


checkboxPracticeMode.selected = state.playtestPracticeMode;

checkboxPracticeMode.onClick = _ ->
{
state.playtestPracticeMode = checkboxPracticeMode.selected;
};

throw 'ChartEditorToolboxHandler.buildToolboxPlaytestPropertiesLayout() - Could not find playtestStartTimeCheckbox component.';

checkboxStartTime.selected = state.playtestStartTime;

checkboxStartTime.onClick = _ ->
{
state.playtestStartTime = checkboxStartTime.selected;
};


checkboxBotPlay.selected = state.playtestBotPlayMode;

checkboxBotPlay.onClick = _ ->
{
state.playtestBotPlayMode = checkboxBotPlay.selected;
};

throw 'ChartEditorToolboxHandler.buildToolboxPlaytestPropertiesLayout() - Could not find playtestShowResultsCheckbox component.';

checkboxShowResults.selected = state.playtestShowResults;

checkboxShowResults.onClick = _ ->
{
state.playtestShowResults = checkboxShowResults.selected;
};


throw 'ChartEditorToolboxHandler.buildToolboxPlaytestPropertiesLayout() - Could not find playtestSongScriptsCheckbox component.';

state.playtestSongScripts = checkboxSongScripts.selected;

checkboxSongScripts.onClick = _ ->
{
state.playtestSongScripts = checkboxSongScripts.selected;
};


throw 'ChartEditorToolboxHandler.buildToolboxPlaytestPropertiesLayout() - Could not find playtestAudioSettingsCheckbox component.';

state.playtestAudioSettings = checkboxAudioSettings.selected;

checkboxAudioSettings.onClick = _ ->
{
state.playtestAudioSettings = checkboxAudioSettings.selected;
};

}

static function buildToolboxDifficultyLayout(state:ChartEditorState):Null<ChartEditorBaseToolbox>
{


}

static function buildToolboxMetadataLayout(state:ChartEditorState):Null<ChartEditorBaseToolbox>
{


}

static function buildToolboxOffsetsLayout(state:ChartEditorState):Null<ChartEditorBaseToolbox>
{


}

static function buildToolboxFreeplayLayout(state:ChartEditorState):Null<ChartEditorBaseToolbox>
{


}

static function buildToolboxEventDataLayout(state:ChartEditorState):Null<ChartEditorBaseToolbox>
{


}

static function buildToolboxPlayerPreviewLayout(state:ChartEditorState):Null<CollapsibleDialog>
{


toolbox.x = 700;
toolbox.y = 150;

toolbox.onDialogClosed = function(event:DialogEvent)
{
state.menubarItemToggleToolboxPlayerPreview.selected = false;
}

charPlayer.loadCharacter('bf');
charPlayer.characterType = CharacterType.BF;
charPlayer.flip = true;
charPlayer.targetScale = 0.5;

}

static function onShowToolboxPlayerPreview(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}

static function onHideToolboxPlayerPreview(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}

static function buildToolboxOpponentPreviewLayout(state:ChartEditorState):Null<CollapsibleDialog>
{


toolbox.x = 200;
toolbox.y = 150;

toolbox.onDialogClosed = (event:DialogEvent) ->
{
state.menubarItemToggleToolboxOpponentPreview.selected = false;
}

charPlayer.loadCharacter('dad');
charPlayer.characterType = CharacterType.DAD;
charPlayer.flip = false;
charPlayer.targetScale = 0.5;

}

static function onShowToolboxOpponentPreview(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}

static function onHideToolboxOpponentPreview(state:ChartEditorState, toolbox:CollapsibleDialog):Void
{
}
}
