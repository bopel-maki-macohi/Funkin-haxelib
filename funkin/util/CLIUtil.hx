

/**
* Utilties for interpreting command line arguments.
*/
class CLIUtil
{
/**
* If we don't do this, dragging and dropping a file onto the executable
* causes it to be unable to find the assets folder.
*/
public static function resetWorkingDir():Void
{
{
}
else
{
}
}

public static function processArgs():CLIParams
{
}

static function interpretArgs(args:Array<String>):CLIParams
{

result.args = [for (arg in args) arg]; // Copy the array.

{

{
switch (arg)
{
case '-h' | '--help':
case '-v' | '--version':
case '--chart':
{
}
else
{
}
case "--stage":
{
}
else
{
}
case "--song":
{
}
else
{
}
}
}
else
{

{
}
else if (arg.endsWith(Constants.EXT_STAGE))
{
}
else
{
}
}
}

}

static function printUsage():Void
{
}

static function buildDefaultParams():CLIParams
{
args: [],

chart: {
shouldLoadChart: false,
chartPath: null
},
stage: {
shouldLoadStage: false,
stagePath: null
},
song: {
shouldLoadSong: false,
songPath: null
}
}

/**
* Clean up the arguments passed to the application before parsing them.
* @param args The arguments to clean up.
* @return The cleaned up arguments.
*/
static function cleanArgs(args:Array<String>):Array<String>
{


{

}).filter(function(arg:String):Bool
{
}
}

typedef CLIParams =
{

}

typedef CLIChartParams =
{

typedef CLIStageParams =
{

typedef CLISongParams =
{
