package funkin.util.macro;

using funkin.util.AnsiUtil;

class GitCommit
{
/**
* Get the SHA1 hash of the current Git commit.
*/
public static macro function getGitCommitHash():haxe.macro.Expr.ExprOf<String>
{

{
haxe.macro.Context.info(' WARNING '.warning() + ' Could not determine current git commit; is this a proper Git repository?', pos);
}


process.close();

}

/**
* Get the branch name of the current Git commit.
*/
public static macro function getGitBranch():haxe.macro.Expr.ExprOf<String>
{

{
haxe.macro.Context.info(' WARNING '.warning() + ' Could not determine current git commit; is this a proper Git repository?', pos);
}

branchProcess.close();

}

/**
* Get whether the local Git repository is dirty or not.
*/
public static macro function getGitHasLocalChanges():haxe.macro.Expr.ExprOf<Bool>
{

}
}
