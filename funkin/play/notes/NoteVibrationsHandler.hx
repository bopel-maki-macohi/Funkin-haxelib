package funkin.play.notes;


/**
* Handles vibrations on note presses.
*/
class NoteVibrationsHandler
{
/**
* Left note's status.
*/

/**
* Down note's status.
*/

/**
* Up note's status.
*/

/**
* Right note's status.
*/

/**
* An array of each note status.
* Made for use in other classes.
*/

/**
* Creates a new NoteVibrationsHandler instance.
*/
public function new()
{
noteStatuses = [leftNoteStatus, downNoteStatus, upNoteStatus, rightNoteStatus];
}

/**
* Checks if any note status is equal to NoteStatus.isJustPressed.
* If yes, then vibration is being triggered, amplitude value is stacked depending on how much notes are pressed.
*/
public function tryNoteVibration():Void
{


for (currentNoteStatus in noteStatuses)
{

stackingAmplitude += Constants.MAX_VIBRATION_AMPLITUDE / 4;
}


}

/**
* Checks if any note status is equal to NoteStatus.isHoldNotePressed.
* If yes, then vibration is being triggered, amplitude value is stacked depending on how much hold notes are pressed.
*/
public function tryHoldNoteVibration(holdNoteEnded:Bool = false):Void
{


for (currentNoteStatus in noteStatuses)
{

stackingAmplitude += Constants.MAX_VIBRATION_AMPLITUDE / amplitudeDivider;
}



for (currentNoteStatus in noteStatuses)
{
}
}
}

/**
* An abstract that represents the note status for NoteVibrationsHandler.
*/
enum abstract NoteStatus(Int) from Int to Int
{
}
