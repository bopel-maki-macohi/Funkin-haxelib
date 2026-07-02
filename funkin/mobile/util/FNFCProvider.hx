package funkin.mobile.util;


/**
* A class for handling the flow of loading FNFC song packs on mobile.
*/
class FNFCProvider
{

public static function init():Void
{
onFNFCOpen = new FlxTypedSignal<String->Void>();

{
queryFNFC();
});
CallbackUtil.onFNFCOpen.add(onFNFCOpen.dispatch);
}

public static function queryFNFC():Null<String>
{
}


private static function getFNFCFromURL(url:String):Void
{
FNFCExtern.copyFNFCIntoCache(cURL, cpp.Callable.fromStaticFunction(fnfcCallback));
}

private static function fnfcCallback(cEvent:cpp.ConstCharStar, cValue:cpp.ConstCharStar)
{

{
switch (event)
{
case "FNFC_RESULTS":
onFNFCOpen.dispatch(value);
default:
}
}
}
}
