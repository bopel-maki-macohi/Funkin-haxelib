package funkin.ui.options;


/**
* The main options menu
* It mainly is controlled via the "optionsCodex" object,
* which handles paging and going to the different submenus
*/
class OptionsState extends MusicBeatState
{
/**
* Instance of the OptionsState
*/




override function create():Void
{
instance = this;

persistentUpdate = true;

drumsBG = FunkinSound.load(Paths.music('offsetsLoop/drumsLoop'), 0, true, false, false, false);

menuBG.shader = hsv;
menuBG.setGraphicSize(Std.int(FlxG.width * 1.1));
menuBG.updateHitbox();
menuBG.screenCenter();
menuBG.scrollFactor.set(0, 0);
add(menuBG);

optionsCodex = new Codex<OptionsMenuPageName>(Options);
add(optionsCodex);


options.addSaveDataOptionsItem(saveData);
options.addExitItem();

{
options.onExit.add(exitToMainMenu);
controls.onExit.add(exitControls);
preferences.onExit.add(optionsCodex.switchPage.bind(Options));
offsets.onExit.add(exitOffsets);
saveData.onExit.add(optionsCodex.switchPage.bind(Options));
}
else
{
preferences.onExit.add(exitToMainMenu);
optionsCodex.setPage(Preferences);
controls.onExit.add(exitToMainMenu);
optionsCodex.setPage(Controls);
}

super.create();
addHitbox();
hitbox.visible = false;
}

function exitOffsets():Void
{
{
drumsBG.fadeOut(0.5, 0);
}
{
FunkinSound.playMusic('freakyMenu', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,
persist: true
});
});
optionsCodex.switchPage(Options);
}

function exitControls():Void
{
PlayerSettings.reset();
PlayerSettings.init();

optionsCodex.switchPage(Options);
}

function exitToMainMenu()
{
optionsCodex.currentPage.enabled = false;
}
}

/**
* Our default Page when we enter the OptionsState, a bit of the root
*/
class OptionsMenu extends Page<OptionsMenuPageName>
{


/**
* Camera focus point
*/


public function new()
{
super();
add(items = new TextMenuList());

createItem("PREFERENCES", function() codex.switchPage(Preferences));
createItem("CONTROLS", function() codex.switchPage(Controls));
createItem("LAG ADJUSTMENT", function()
{
{
FunkinSound.playMusic('offsetsLoop', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,
loop: true
});
OptionsState.instance.drumsBG.play(true);
});

codex.switchPage(Offsets);
});
createItem("RESTORE PURCHASES", function()
{
InAppPurchasesUtil.restorePurchases();
});
createItem("OPEN DATA FOLDER", function()
{
funkin.external.android.DataFolderUtil.openDataFolder();
});
{
createItem("LOGOUT OF NG", function()
{
NewgroundsClient.instance.logout(function()
{
}, function()
{
});
});
}
else
{
createItem("LOGIN TO NG", function()
{
NewgroundsClient.instance.login(function()
{
}, function()
{
});
});
}

camFocusPoint = new FlxObject(0, 0, 140, 70);
add(camFocusPoint);


items.onChange.add(onMenuChange);

onMenuChange(items.members[0]);

items.selectItem(OptionsState.rememberedSelectedIndex);
}

public function addSaveDataOptionsItem(saveDataMenu:SaveDataMenu):Void
{
{
createItem("SAVE DATA OPTIONS", function()
{
codex.switchPage(SaveData);
});
}
else
{
createItem("CLEAR SAVE DATA", saveDataMenu.openSaveDataPrompt);
}
}

public function addExitItem():Void
{
createItem("EXIT", exit);
backButton = new FunkinBackButton(FlxG.width - 230, FlxG.height - 200, exit, 1.0);
backButton.onConfirmStart.add(function()
{
items.busy = true;
goingBack = true;
backButton.active = true;
});
add(backButton);
}

function onMenuChange(selected:TextMenuItem):Void
{
camFocusPoint.y = selected.y;
}

function createItem(name:String, callback:Void->Void, fireInstantly = false):TextMenuItem
{
item.fireInstantly = fireInstantly;
item.screenCenter(X);
}

override function update(elapsed:Float):Void
{
{
}

backButton.active = (!goingBack) ? !items.busy : true;
super.update(elapsed);
}

override function set_enabled(value:Bool):Bool
{
items.enabled = value;
}

/**
* True if this page has multiple options, excluding the exit option.
* If false, there's no reason to ever show this page.
*/
public function hasMultipleOptions():Bool
{
}
}

enum abstract OptionsMenuPageName(String) to PageName
{
}
