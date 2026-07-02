package funkin.util;


using flixel.util.FlxStringUtil;

/**
* Utilities for working with inputs.
*/
class InputUtil
{
public static function format(id:Int, device:Device):String
{
{
case Keys: getKeyName(id);
case Gamepad(gamepadID): FlxG.gamepads.getByID(gamepadID) != null ? getButtonName(id, FlxG.gamepads.getByID(gamepadID)) : 'N/A';
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
case ZERO: "0";
case ONE: "1";
case TWO: "2";
case THREE: "3";
case FOUR: "4";
case FIVE: "5";
case SIX: "6";
case SEVEN: "7";
case EIGHT: "8";
case NINE: "9";
case PAGEUP: "PgUp";
case PAGEDOWN: "PgDown";
case BACKSPACE: "BckSpc";
case LBRACKET: "[";
case RBRACKET: "]";
case BACKSLASH: "\\";
case CAPSLOCK: "Caps";
case SEMICOLON: ";";
case QUOTE: "'";
case COMMA: ",";
case PERIOD: ".";
case SLASH: "/";
case GRAVEACCENT: "`";
case CONTROL: "Ctrl";
case ALT: "Alt";
case PRINTSCREEN: "PrtScrn";
case NUMPADZERO: "#0";
case NUMPADONE: "#1";
case NUMPADTWO: "#2";
case NUMPADTHREE: "#3";
case NUMPADFOUR: "#4";
case NUMPADFIVE: "#5";
case NUMPADSIX: "#6";
case NUMPADSEVEN: "#7";
case NUMPADEIGHT: "#8";
case NUMPADNINE: "#9";
case NUMPADMINUS: "#-";
case NUMPADPLUS: "#+";
case NUMPADPERIOD: "#.";
case NUMPADMULTIPLY: "#*";
default: titleCase(FlxKey.toStringMap[id] ?? '?');
}
}


inline static public function getButtonName(id:Int, gamepad:FlxGamepad):String
{
{
case null, "": shortenButtonName(FlxGamepadInputID.toStringMap[id]);
case label: shortenButtonName(label);
}
}

static function shortenButtonName(name:Null<String>)
{
{
case "": "[?]";
case dir if (dirReg.match(dir)):
dirReg.matched(1).toUpperCase() + " " + titleCase(dirReg.matched(2));
case label: titleCase(label);
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
case Keys: getAsset(null);
case Gamepad(id): getAsset(FlxG.gamepads.getByID(id));
}
}

static public function getAsset(gamepad:Null<FlxGamepad>):String
{


}

inline static public function getNameById(id:Int):ControllerName return getName(FlxG.gamepads.getByID(id));

inline static public function getName(gamepad:FlxGamepad):ControllerName return parseName(gamepad.name);

static public function parseName(name:String):ControllerName
{
name = name.toLowerCase().remove("-").remove("_");
|| name.contains("ps4")) PS4; else if (name.contains("logitech")) LOGI; else if (name.contains("xbox")) XBOX else if (name.contains("xinput"))
XINPUT; else if (name.contains("nintendo rvlcnt01tr")
|| name.contains("nintendo rvlcnt01")) WII; else if (name.contains("mayflash wiimote pc adapter")) WII; else if (name.contains("pro controller"))
PRO_CON; else if (name.contains("joycon l+r")) JOYCONS; else if (name.contains("joycon (l)")) JOYCON_L; else if (name.contains("joycon (r)"))
JOYCON_R; else if (name.contains("mfi")) MFI; else PAD;
}
}
