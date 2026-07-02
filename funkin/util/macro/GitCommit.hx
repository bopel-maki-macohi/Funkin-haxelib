

class GitCommit
{
/**
* Get the SHA1 hash of the current Git commit.
*/
public static macro function getGitCommitHash():haxe.macro.Expr.ExprOf<String>
{

{
}



}

/**
* Get the branch name of the current Git commit.
*/
public static macro function getGitBranch():haxe.macro.Expr.ExprOf<String>
{

{
}


}

/**
* Get whether the local Git repository is dirty or not.
*/
public static macro function getGitHasLocalChanges():haxe.macro.Expr.ExprOf<Bool>
{

}
}
