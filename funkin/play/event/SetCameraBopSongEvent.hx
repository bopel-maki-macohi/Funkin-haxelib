

/**
* This class handles song events which change how the camera bops to the beat of the song.
*
* Example: Bop the camera twice as hard, once per beat (rather than once every four beats).
* ```
* {
*   'e': 'SetCameraBop',
*   'v': {
*    'intensity': 2.0,
*    'rate': 1,
*   }
* }
* ```
*
* Example: Reset the camera bop to default values.
* ```
* {
*   'e': 'SetCameraBop',
* 	 'v': {}
* }
* ```
*/
class SetCameraBopSongEvent extends SongEvent
{
public function new()
{
super('SetCameraBop', {
processOldEvents: true
}

public override function handleEvent(data:SongEventData):Void
{


PlayState.instance.cameraBopIntensity = (Constants.DEFAULT_BOP_INTENSITY - 1.0) * intensity + 1.0;
PlayState.instance.hudCameraZoomIntensity = (Constants.DEFAULT_BOP_INTENSITY - 1.0) * intensity * 2.0;
PlayState.instance.cameraZoomRate = rate;
PlayState.instance.cameraZoomRateOffset = offset;
}

public override function getTitle():String
{
}

/**
* ```
* {
*   'intensity': FLOAT, // Zoom amount
*   'rate': INT, // Zoom rate (beats/zoom)
* }
* ```
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: 'intensity',
title: 'Intensity',
defaultValue: Constants.DEFAULT_BOP_INTENSITY,
min: 0,
step: 0.1,
type: SongEventFieldType.FLOAT,
units: 'x'
}, {
name: 'offset',
title: 'Offset',
defaultValue: Constants.DEFAULT_ZOOM_OFFSET,
step: 0.25,
type: SongEventFieldType.FLOAT,
units: 'beats'
}, {
name: 'rate',
title: 'Rate',
defaultValue: Constants.DEFAULT_ZOOM_RATE,
min: 0,
step: 0.25,
type: SongEventFieldType.FLOAT,
units: 'beats/zoom'
}
}
