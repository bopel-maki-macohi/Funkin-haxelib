package funkin.ui;


/**
* The Codex class is what holds our `Page` objects together. Apologies for the potentially obtuse quirky name.
* Codex stands for "Collection Of Pages ex"... imagine P is rotated 180 degress now its a d :)
* I just wanted something not called "PageManager" grr...
*/
class Codex<T:PageName> extends FlxGroup
{


inline function get_currentPage():Page<T> return pages[currentName];

public function new(initPage:T)
{
super();
pages = new Map<T, Page<T>>();
currentName = initPage;
}

public function addPage<P:Page<T>>(name:T, page:P):P
{
page.onSwitch.add(switchPage);
page.codex = this;
pages[name] = page;
add(page);
page.exists = currentName == name;
}

public function setPage(name:T):Void
{
{
currentPage.exists = false;
currentPage.visible = false;
}

currentName = name;

{
currentPage.exists = true;
currentPage.visible = true;
}
}

public function switchPage(name:T):Void
{
setPage(name);
}
}
