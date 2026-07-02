package funkin.util.macro;


using StringTools;
using funkin.util.AnsiUtil;

/**
* A macro class that loads environment variables from a .env file for compile-time injection.
*/
class EnvironmentMacro
{
/**
* Initializes static Null<String> fields annotated with @:envField from the .env file.
*
* @return Array<Field> The modified array of fields with injected environment values.
*/
public static macro function build():Array<Field>
{


for (i in 0...buildFields.length)
{

{
switch (field.kind)
{
case FVar(t, e):
for (meta in field.meta)
{
{

{


{
mandatoryIfDefined = MacroUtil.extractStringConstant(mandatoryIfDefinedExpr);
}
}

switch (t)
{
case TPath(tp):
{
switch (tp.params[0])
{
case TPType(TPath(tptp)):
{
isNullString = true;
}
default:
}
}
default:
}

{
Context.fatalError('Field ${field.name} must be of type Null<String> to use :envField', field.pos);
}
else
{

{
e = macro $v{envFile.get(field.name)};
}
else if (mandatoryIfDefined != null)
{


errorMessage += '\nThis field is flagged as MANDATORY; populate the `.env` file in the project root,';
errorMessage += ' or compile with -D${inverseDefine} to skip this check.';

Context.fatalError(errorMessage, field.pos);
}
else
{
warning('Value for '.bright_red() + field.name.bold().bright_red() + ' not found in the environment file.'.bright_red(), field.pos);
}

buildFields[i].kind = FVar(t, e);
}
}
}
default:
}
}
}

}

static function parseEnvFile(envPath:String):Map<String, String>
{


{

{
for (line in envContent.split('\n'))
{
line = line.trim();

{
continue;
}


{
continue;
}


{
continue;
}

env.set(stripTargetPrefix(line.substr(0, index)), value);
}
}
}

}

static function shouldExcludeKey(key:String):Bool
{


}

static function stripTargetPrefix(key:String):String
{

{
}


{
case 'ANDROID', 'MOBILE':
rest;
case 'IOS', 'MOBILE':
rest;
case 'WEB':
rest;
case 'DESKTOP':
rest;
default:
key;
}
}

static function warning(msg:String, pos:Position)
{

infos.line = line;
infos.column = col0 + 1; // 1-based


lineText = lineText.bold();




}
}
