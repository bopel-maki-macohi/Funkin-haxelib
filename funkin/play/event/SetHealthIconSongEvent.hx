package funkin.play.event;


/**
* This class handles song events which change the player's health icon, or the opponent's health icon.
*
* Example: Set the health icon of the opponent to "tankman-bloody":
* ```
* {
*   'e': 'SetHealthIcon',
* 	 "v": {
* 	 	 "char": 1,
*     "id": "tankman-bloody",
*
* // Optional params:
*     "scale": 1.0,
*     "flipX": false,
*     "isPixel": false,
*     "offsetX": 0.0,
*     "offsetY": 0.0
*   }
* }
* ```
*/
class SetHealthIconSongEvent extends SongEvent
{
public function new()
{
super('SetHealthIcon', {
processOldEvents: true
});
}



public override function handleEvent(data:SongEventData):Void
{



id: data.value.id ?? Constants.DEFAULT_HEALTH_ICON,
scale: data.value.scale ?? DEFAULT_SCALE,
flipX: data.value.flipX ?? DEFAULT_FLIPX,
isPixel: data.value.isPixel ?? DEFAULT_ISPIXEL,
offsets: offsets,
};

switch (data?.value?.char ?? DEFAULT_CHAR)
{
case 0:
{
PlayState.instance.iconP1.configure(healthIconData);
}
case 1:
{
PlayState.instance.iconP2.configure(healthIconData);
}
default:
}
}

public override function getTitle():String
{
}

public override function getEventSchema():SongEventSchema
{
name: 'char',
title: 'Character',
defaultValue: DEFAULT_CHAR,
type: SongEventFieldType.ENUM,
keys: ['Player' => 0, 'Opponent' => 1],
}, {
name: 'id',
title: 'Health Icon ID',
defaultValue: Constants.DEFAULT_HEALTH_ICON,
type: SongEventFieldType.STRING,
}, {
name: 'scale',
title: 'Scale',
defaultValue: DEFAULT_SCALE,
min: 0,
type: SongEventFieldType.FLOAT,
}, {
name: 'flipX',
title: 'Flip X?',
defaultValue: DEFAULT_FLIPX,
type: SongEventFieldType.BOOL,
}, {
name: 'advanced',
title: 'Advanced',
type: SongEventFieldType.FRAME,
collapsible: true,
children: [{
name: 'isPixel',
title: 'Is Pixel?',
defaultValue: DEFAULT_ISPIXEL,
type: SongEventFieldType.BOOL,
}, {
name: 'offsetX',
title: 'X Offset',
defaultValue: DEFAULT_X_OFFSET,
type: SongEventFieldType.FLOAT,
}, {
name: 'offsetY',
title: 'Y Offset',
defaultValue: DEFAULT_Y_OFFSET,
type: SongEventFieldType.FLOAT,
}]
}]);
}
}
