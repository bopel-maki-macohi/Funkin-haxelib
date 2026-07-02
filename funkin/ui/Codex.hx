

/**
* The Codex class is what holds our `Page` objects together. Apologies for the potentially obtuse quirky name.
* Codex stands for "Collection Of Pages ex"... imagine P is rotated 180 degress now its a d :)
* I just wanted something not called "PageManager" grr...
*/
class Codex<T:PageName> extends FlxGroup
{



public function new(initPage:T)
{
}

public function addPage<P:Page<T>>(name:T, page:P):P
{
}

public function setPage(name:T):Void
{
{
}


{
}
}

public function switchPage(name:T):Void
{
}
}
