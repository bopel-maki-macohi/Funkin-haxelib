package funkin.play.event;


/**
* This class handles song events which force a specific character or stage prop to play an animation.
*/
class PlayAnimationSongEvent extends SongEvent
{
public function new()
{
super('PlayAnimation');
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
targetChar.playAnimation(anim, force, force);
}
else
{
target.animation.play(anim, force);
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
*   "force": BOOL, // Whether to force the animation to play.
* }
* @return SongEventSchema
*/
public override function getEventSchema():SongEventSchema
{
name: 'target',
title: 'Target',
type: SongEventFieldType.STRING,
defaultValue: DEFAULT_TARGET,
}, {
name: 'anim',
title: 'Animation',
type: SongEventFieldType.STRING,
defaultValue: DEFAULT_ANIM,
}, {
name: 'force',
title: 'Force',
type: SongEventFieldType.BOOL,
defaultValue: DEFAULT_FORCE
}]);
}
}
