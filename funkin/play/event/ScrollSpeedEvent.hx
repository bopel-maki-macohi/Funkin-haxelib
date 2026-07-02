

/**
* This class handles song events which change the scroll speed of the chart.
* This affects the speed at which the notes move towards the strums.
*
* Example: Scroll speed change of both strums from 1x to 1.3x:
* ```
* {
*   'e': 'ScrollSpeed',
*   "v": {
*      "scroll": "1.3",
*      "duration": "4",
*      "ease": "linear",
*      "strumline": "both",
*      "absolute": false
*    }
* }
* ```
*/
class ScrollSpeedEvent extends SongEvent
{
public function new()
{
super('ScrollSpeed', {
processOldEvents: true
}


public override function handleEvent(data:SongEventData):Void
{








{
scroll = scroll * (PlayState.instance?.currentChart?.scrollSpeed ?? 1.0);
}

switch (strumline)
{
case 'both':
default:
}
switch (ease)
{
case 'INSTANT':
PlayState.instance.tweenScrollSpeed(scroll, 0, null, strumlineNames);
default:
{
}

PlayState.instance.tweenScrollSpeed(scroll, durSeconds, easeFunction, strumlineNames);
}
}

public override function getTitle():String
{
}

/**
* ```
* {
*   'scroll': FLOAT, // Target scroll level.
*   'duration': FLOAT, // Duration in steps.
*   'ease': ENUM, // Easing function.
*   'easeDir': ENUM, // Easing function direction (In, Out, InOut).
*   'strumline': ENUM, // Which strumline to change
*   'absolute': BOOL, // True to set the scroll speed to the target level, false to set the scroll speed to (target level x base scroll speed)
* }
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: 'scroll',
title: 'Target Value',
defaultValue: DEFAULT_SCROLL,
min: 0.1,
step: 0.1,
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
name: 'strumline',
title: 'Target Strumline',
defaultValue: DEFAULT_STRUMLINE,
type: SongEventFieldType.ENUM,
keys: ['Both' => 'both', 'Player' => 'player', 'Opponent' => 'opponent']
}, {
name: 'absolute',
title: 'Absolute',
defaultValue: DEFAULT_ABSOLUTE,
type: SongEventFieldType.BOOL,
}]
}
}
