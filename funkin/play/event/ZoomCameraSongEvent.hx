package funkin.play.event;


/**
* This class handles song events which change the zoom level of the camera.
*
* Example: Zoom to 1.3x:
* ```
* {
*   'e': 'ZoomCamera',
*   'v': 1.3
* }
* ```
*/
class ZoomCameraSongEvent extends SongEvent
{
public function new()
{
super('ZoomCamera', {
processOldEvents: true
});
}

public static final DEFAULT_ZOOM:Float = 1.0;
public static final DEFAULT_WIDESCREEN_SCALE:Float = 0.0;
public static final DEFAULT_DURATION:Float = 4.0;
public static final DEFAULT_MODE:String = 'direct';

public override function handleEvent(data:SongEventData):Void
{









switch (ease)
{
case 'INSTANT':
PlayState.instance.tweenCameraZoom(scaledZoom, 0, isDirectMode);
default:
{
}

PlayState.instance.tweenCameraZoom(scaledZoom, durSeconds, isDirectMode, easeFunction);
}
}

function calculateScale(wideScale:FlxPoint, scale:FlxPoint)
{
}

public override function getTitle():String
{
}

/**
* ```
* {
*   'zoom': FLOAT, // Target zoom level.
*   'duration': FLOAT, // Duration in steps.
*   'mode': ENUM, // Whether zoom is relative to the stage or absolute zoom.
*   'ease': ENUM, // Easing function.
*   'easeDir': ENUM, // Easing function direction (In, Out, InOut).
* }
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: 'zoom',
title: 'Zoom Level',
defaultValue: DEFAULT_ZOOM,
min: 0,
step: 0.05,
type: SongEventFieldType.FLOAT,
units: 'x'
}, {
name: 'duration',
title: 'Duration',
defaultValue: DEFAULT_DURATION,
min: 0,
step: 0.5,
type: SongEventFieldType.FLOAT,
units: 'steps'
}, {
name: 'ease',
title: 'Easing Type',
defaultValue: SongEvent.DEFAULT_EASE,
type: SongEventFieldType.ENUM,
keys: ['Linear' => 'linear', 'Instant (Ignores duration)' => 'INSTANT', 'Sine' => 'sine', 'Quad' => 'quad', 'Cube' => 'cube', 'Quart' => 'quart', 'Quint' => 'quint', 'Expo' => 'expo', 'Smooth Step' => 'smoothStep', 'Smoother Step' => 'smootherStep', 'Elastic' => 'elastic', 'Back' => 'back', 'Bounce' => 'bounce', 'Circ ' => 'circ',]
}, {
name: 'easeDir',
title: 'Easing Direction',
defaultValue: SongEvent.DEFAULT_EASE_DIR,
type: SongEventFieldType.ENUM,
keys: ['In' => 'In', 'Out' => 'Out', 'In/Out' => 'InOut']
}, {
name: 'advanced',
title: 'Advanced',
type: SongEventFieldType.FRAME,
collapsible: true,
children: [{
name: 'mode',
title: 'Mode',
defaultValue: DEFAULT_MODE,
type: SongEventFieldType.ENUM,
keys: ['Stage zoom' => 'stage', 'Absolute zoom' => 'direct']
}, {
name: 'widescreenScaleX',
title: 'Widescreen Scale X',
defaultValue: DEFAULT_WIDESCREEN_SCALE,
min: 0,
max: 1,
type: SongEventFieldType.FLOAT,
units: 'x'
}, {
name: 'widescreenScaleY',
title: 'Widescreen Scale Y',
defaultValue: DEFAULT_WIDESCREEN_SCALE,
min: 0,
max: 1,
type: SongEventFieldType.FLOAT,
units: 'x'
}]
}]);
}
}
