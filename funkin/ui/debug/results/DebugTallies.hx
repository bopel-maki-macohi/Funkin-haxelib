package funkin.ui.debug.results;


/**
* Just lil class to hold different score tallies for debug purposes
*/
class DebugTallies
{
/**
* 2400 total notes = 7% = LOSS
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 170,
totalNotes: 2400
};

/**
* 275 total notes = 69% = NICE
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 275
};

/**
* 240 total notes = 79% = GOOD
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 240
};

/**
* 230 total notes = 82% = GREAT
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 230
};

/**
* 210 total notes = 90% = EXCELLENT
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 210
};

/**
* 190 total notes = PERFECT
*/
sick: 190,
good: 69,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 190
};

/**
* 190 total sicks and total notes = PERFECT GOLD
*/
sick: 190,
good: 0,
bad: 69,
shit: 69,
missed: 0,
combo: 69,
maxCombo: 69,
totalNotesHit: 190,
totalNotes: 190
};

public static function getTallyForRank(rank:DebugRank):SaveScoreTallyData
{
{
case LOSS_RANK: LOSS;
case NICE_RANK: NICE;
case GOOD_RANK: GOOD;
case GREAT_RANK: GREAT;
case EXCELLENT_RANK: EXCELLENT;
case PERFECT_RANK: PERFECT;
case PERFECT_GOLD_RANK: PERFECT_GOLD;
}
}

}

enum abstract DebugRank(String) from String to String
{
}
