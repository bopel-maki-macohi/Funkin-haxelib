

/**
* This class handles song events which change the camera focus.
* This lets you center the camera on a character, on a stage prop, or a specific position on the screen,
* as well as apply relative offsets, and even determine the speed and manner with which
* the camera moves into place.
*
* Example: Focus on Boyfriend:
* ```
* {
*   "e": "FocusCamera",
* 	 "v": {
* 	 	 "char": 0,
*   }
* }
* ```
*
* Example: Focus on 10px above Girlfriend:
* ```
* {
*   "e": "FocusCamera",
* 	 "v": {
* 	   "char": 2,
* 	   "y": -10,
*   }
* }
* ```
*
* Example: Focus on (100, 100):
* ```
* {
*   "e": "FocusCamera",
*   "v": {
*     "char": -1,
*     "x": 100,
*     "y": 100,
*   }
* }
* ```
*/
class FocusCameraSongEvent extends SongEvent
{
public function new()
{
super('FocusCamera', {
processOldEvents: true
}


public override function handleEvent(data:SongEventData):Void
{









switch (char)
{
case -1: // Position ("focus" on origin)

case 0: // Boyfriend (focus on player)
{
}

case 1: // Dad (focus on opponent)
{
}

case 2: // Girlfriend (focus on girlfriend)
{
}

default:
}

switch (ease)
{
case 'CLASSIC': // Old-school. No ease. Just set follow point.
PlayState.instance.resetCamera(false, false, false);
PlayState.instance.cancelCameraFollowTween();
PlayState.instance.cameraFollowPoint.setPosition(targetX, targetY);
case 'INSTANT': // Instant ease. Duration is automatically 0.
PlayState.instance.tweenCameraToPosition(targetX, targetY, 0);
default:
{
}
PlayState.instance.tweenCameraToPosition(targetX, targetY, durSeconds, easeFunction);
}
}

public override function getTitle():String
{
}

/**
* ```
* {
*   "char": ENUM, // Which character to point to
*   "x": FLOAT, // Optional x offset
*   "y": FLOAT, // Optional y offset
* }
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: "char",
title: "Target",
defaultValue: DEFAULT_TARGET,
type: SongEventFieldType.ENUM,
keys: ["Position" => -1, "Player" => 0, "Opponent" => 1, "Girlfriend" => 2]
}, {
name: "x",
title: "X Position",
defaultValue: DEFAULT_X_POSITION,
step: 10.0,
type: SongEventFieldType.FLOAT,
units: "px"
}, {
name: "y",
title: "Y Position",
defaultValue: DEFAULT_Y_POSITION,
step: 10.0,
type: SongEventFieldType.FLOAT,
units: "px"
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
defaultValue: DEFAULT_CAMERA_EASE,
type: SongEventFieldType.ENUM,
keys: ['Linear' => 'linear', 'Instant (Ignores duration)' => 'INSTANT', 'Classic (Ignores duration)' => 'CLASSIC', 'Sine' => 'sine', 'Quad' => 'quad', 'Cube' => 'cube', 'Quart' => 'quart', 'Quint' => 'quint', 'Expo' => 'expo', 'Smooth Step' => 'smoothStep', 'Smoother Step' => 'smootherStep', 'Elastic' => 'elastic', 'Back' => 'back', 'Bounce' => 'bounce', 'Circ ' => 'circ',]
}, {
name: 'easeDir',
title: 'Easing Direction',
defaultValue: SongEvent.DEFAULT_EASE_DIR,
type: SongEventFieldType.ENUM,
keys: ['In' => 'In', 'Out' => 'Out', 'In/Out' => 'InOut']
}
}
