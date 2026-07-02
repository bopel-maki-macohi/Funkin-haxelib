package funkin.util;


/**
* A data structure representing a sequence event.
*/
typedef SequenceEvent =
{
/**
* The time in seconds to wait before triggering the event.
*/
time:Float,

/**
* The callback to run when the event is triggered.
*/
callback:() -> Void
};

/**
* A timer-based event sequence.
*/
class Sequence
{
/**
* Create a new sequence.
* @param events A list of `SequenceEvent`s.
* @param mult Optional multiplier for callback times. Useful for frame-based or music-based timing.
* @param start Whether to immediately start the sequence.
*/
public function new(events:Array<SequenceEvent>, mult:Float = 1, start:Bool = true)
{

mult = Math.max(0, mult);

for (event in events)
{
timers.push(new FlxTimer().start(event.time * mult, function(timer:FlxTimer)
{
event.callback();
timers.remove(timer);
}));
}

running = start;
}

/**
* The list of uncompleted timers for their respective events.
*/

/**
* Controls whether this sequence is running or not.
*/


function get_running():Bool
{
}

function set_running(v:Bool):Bool
{
for (timer in timers)
{
timer.active = v;
}
_running = v;
}

/**
* Whether this sequence has completed.
*/

function get_completed():Bool
{
}

/**
* Clean up and destroy this sequence.
*/
public function destroy():Void
{
{
timer?.cancel();
timer?.destroy();
}
}
}

/**
* A song-based event sequence.
*/
class SongSequence
{
/**
* Signal dispatched by `Conductor.instance.update`.
*/

/**
* Create a new sequence.
* @param events A list of `SequenceEvent`s.
* @param mult Optional multiplier for callback times. Useful for frame-based or music-based timing.
* @param start Whether or not to immediately start the sequence.
*/
public function new(events:Array<SequenceEvent>, mult:Float = 1, start:Bool = true)
{

mult = Math.max(0, mult);

for (event in events)
{
event.time *= mult * 1000;
this.events.push(event);
}

ArraySort.sort(this.events, function(a:SequenceEvent, b:SequenceEvent):Int
{
});

running = start;
update.add(onUpdate);
}

/**
* Keeps track of the time this sequence started, or the relative time if it was previously stopped.
*/

/**
* The list of uncompleted events.
*/

/**
* Update function invoked by the update signal.
*/
function onUpdate():Void
{
{
events.shift()?.callback();
}
}

/**
* Controls whether this sequence is running.
*/


function get_running():Bool
{
}

function set_running(v:Bool):Bool
{
_running = v;
}

/**
* Whether this sequence has completed.
*/

function get_completed():Bool
{
}

/**
* Clean up and destroy this sequence.
*/
public function destroy():Void
{
update.remove(onUpdate);
{
events.pop();
}
}
}
