

class Cursor
{
/**
* The current cursor mode.
* Set this value to change the cursor graphic.
*/

/**
* Show the cursor.
*/
public static inline function show():Void
{
}

/**
* Hide the cursor.
*/
public static inline function hide():Void
{
}

public static inline function toggle():Void
{
{
}
else
{
}
}

public static final CURSOR_DEFAULT_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-default.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_CROSS_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-cross.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_ERASER_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-eraser.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_GRABBING_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-grabbing.png",
scale: 1.0,
offsetX: -8,
offsetY: 0,

public static final CURSOR_HOURGLASS_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-hourglass.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_POINTER_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-pointer.png",
scale: 1.0,
offsetX: -8,
offsetY: 0,

public static final CURSOR_TEXT_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-text.png",
scale: 0.2,
offsetX: 0,
offsetY: 0,

public static final CURSOR_TEXT_VERTICAL_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-text-vertical.png",
scale: 0.2,
offsetX: 0,
offsetY: 0,

public static final CURSOR_ZOOM_IN_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-zoom-in.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_ZOOM_OUT_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-zoom-out.png",
scale: 1.0,
offsetX: 0,
offsetY: 0,

public static final CURSOR_CROSSHAIR_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-crosshair.png",
scale: 1.0,
offsetX: -16,
offsetY: -16,

public static final CURSOR_CELL_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-cell.png",
scale: 1.0,
offsetX: -16,
offsetY: -16,

public static final CURSOR_SCROLL_PARAMS:CursorParams = {
graphic: "assets/images/cursor/cursor-scroll.png",
scale: 0.2,
offsetX: -15,
offsetY: -15,

static function set_cursorMode(value:Null<CursorMode>):Null<CursorMode>
{
{
}
}

/**
* Loads the cursor graphic synchronously.
*
* @param value The cursor mode to load. If null, the cursor is unloaded.
*/
static function loadCursorGraphicSync(?value:CursorMode = null):Void
{
}

/**
* Loads the cursor graphic asynchronously.
*
* @param value The cursor mode to load. If null, the cursor is unloaded.
*/
static function loadCursorGraphicAsync(?value:CursorMode = null):Void
{
}

static function applyCursorParams(mode:Null<CursorMode>, async:Bool = false)
{
{
}

{
}

{
}

{
}

{
future.onComplete((bmp:BitmapData) -> {
}
else
{
}
}

private static inline function applyGraphic(graphic:BitmapData, params:CursorParams):Void
{
}

static function onCursorError(cursorMode:CursorMode, error:String):Void
{
}

public static function registerHaxeUICursors():Void
{
}

public static function registerHaxeUICursor(id:String, params:CursorParams):Void
{
}
}

enum CursorMode
{
}

/**
* Static data describing how a cursor should be rendered.
*/
typedef CursorParams =
{
graphic:String,
scale:Float,
offsetX:Int,
offsetY:Int,
}
