package funkin.util;


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
gameDir = Path.addTrailingSlash(extension.androidtools.content.Context.getExternalFilesDir());
gameDir = cwd;
gameDir = Path.addTrailingSlash(Path.join([Path.directory(Sys.programPath()), '../Resources/']));
gameDir = Path.addTrailingSlash(Path.directory(Sys.programPath()));
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
printUsage();
case '-v' | '--version':
case '--chart':
{
printUsage();
}
else
{
result.chart.shouldLoadChart = true;
result.chart.chartPath = args.shift();
}
case "--stage":
{
printUsage();
}
else
{
result.stage.shouldLoadStage = true;
result.stage.stagePath = args.shift();
}
case "--song":
{
printUsage();
}
else
{
result.song.shouldLoadSong = true;
result.song.songPath = args.shift();
}
}
}
else
{

{
result.chart.shouldLoadChart = true;
result.chart.chartPath = arg;
}
else if (arg.endsWith(Constants.EXT_STAGE))
{
result.stage.shouldLoadStage = true;
result.stage.stagePath = arg;
}
else
{
printUsage();
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
};
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
});
}
}

typedef CLIParams =
{

}

typedef CLIChartParams =
{
};

typedef CLIStageParams =
{
};

typedef CLISongParams =
{
};
