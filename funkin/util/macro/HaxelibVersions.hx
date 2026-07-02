package funkin.util.macro;


class HaxelibVersions
{
public static macro function getLibraryVersions():haxe.macro.Expr.ExprOf<Array<String>>
{
}

static function formatHmmData():Array<String>
{




for (library in dependencies)
{
switch (library.type)
{
case 'haxelib':
result.push('${library.name} haxelib(${library.version ?? 'None'})');
case 'git':
result.push('${library.name} git(${library.url}/${library.dir ?? ''}:${library.ref ?? 'None'}');
case 'mercurial':
result.push('${library.name} mercurial(${library.url}/${library.dir ?? ''}:${library.ref ?? 'None'})');
case 'dev':
result.push('${library.name} dev(${library.path})');
case ty:
throw 'Unhandled hmm library type ${ty}';
}
}

}

static function readLibraryCurrentVersion(libraryName:String):String
{

}
}
