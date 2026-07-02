

/**
* This class handles song events which changes dance speed of specific character or stage prop.
*/
class SetTargetBopSpeedSongEvent extends SongEvent
{
public function new()
{
}


public override function handleEvent(data:SongEventData):Void
{




switch (targetName)
{
case 'boyfriend' | 'bf' | 'player':
target = PlayState.instance.currentStage.getBoyfriend();
case 'dad' | 'opponent':
target = PlayState.instance.currentStage.getDad();
case 'girlfriend' | 'gf':
target = PlayState.instance.currentStage.getGirlfriend();
default:
target = PlayState.instance.currentStage.getNamedProp(targetName);
else
}

{
{
}
else if (Std.isOfType(target, Bopper))
{
}
}
else
{
}
}

public override function getTitle():String
{
}

/**
* ```
* {
*   "target": STRING, // Name of character or prop to point to.
*   "anim": STRING, // Name of animation to play.
* }
* ```
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: 'target',
title: 'Target',
type: SongEventFieldType.STRING,
defaultValue: DEFAULT_TARGET,
}, {
name: 'rate',
title: 'Rate',
defaultValue: Constants.DEFAULT_PROP_RATE,
min: 0,
step: 0.25,
type: SongEventFieldType.FLOAT,
units: 'beats/dance'
}
}
