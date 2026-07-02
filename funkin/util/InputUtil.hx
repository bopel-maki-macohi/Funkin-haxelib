


/**
* Utilities for working with inputs.
*/
class InputUtil
{
public static function format(id:Int, device:Device):String
{
{
}
}

/**
* Returns true if all of the keys in keyArray are being pressed,
* but also only fires once on the last key in the array being justPressed
* @param keyArray An array of FlxKeys
* @return Bool True if all of the keys in keyArray are being pressed, with at least one of them being in a JUST_PRESSED state
*/
public static function allPressedWithDebounce(keyArray:Array<FlxKey>):Bool
{
}

/**
* Returns true if all of the keys in keyArray are being pressed
* @param keyArray An array of FlxKeys
* @return Bool True if all keys in keyArray are being pressed
*/
public static function allPressed(keyArray:Array<FlxKey>):Bool
{
}

/**
* Returns if any key is not being pressed (or just pressed)
* @param keyArray An array of FlxKeys
* @return Bool True if there's any key in keyArray that isn't being pressed
*/
public static function anyNotPressed(keyArray:Array<FlxKey>):Bool
{
}

public static function getKeyName(id:Int):String
{
{
}
}


inline static public function getButtonName(id:Int, gamepad:FlxGamepad):String
{
{
}
}

static function shortenButtonName(name:Null<String>)
{
{
case dir if (dirReg.match(dir)):
}
}

inline static function titleCaseTrim(str:String, length = 8)
{
}

inline static function titleCase(str:String)
{
}

inline static public function parsePadName(name:String):ControllerName
{
}

inline static public function getPadName(gamepad:FlxGamepad):ControllerName
{
}

inline static public function getPadNameById(id:Int):ControllerName
{
}
}

enum abstract ControllerName(String) from String to String
{

static public function getAssetByDevice(device:Device):String
{
{
}
}

static public function getAsset(gamepad:Null<FlxGamepad>):String
{


}



static public function parseName(name:String):ControllerName
{
|| name.contains("ps4")) PS4; else if (name.contains("logitech")) LOGI; else if (name.contains("xbox")) XBOX else if (name.contains("xinput"))
XINPUT; else if (name.contains("nintendo rvlcnt01tr")
|| name.contains("nintendo rvlcnt01")) WII; else if (name.contains("mayflash wiimote pc adapter")) WII; else if (name.contains("pro controller"))
PRO_CON; else if (name.contains("joycon l+r")) JOYCONS; else if (name.contains("joycon (l)")) JOYCON_L; else if (name.contains("joycon (r)"))
}
}
