package funkin.modding;


class PolymodErrorHandler
{
public static function onPolymodError(error:PolymodError):Void
{
switch (error.code)
{
//
//

case MOD_MISSING_DIRECTORY:
funkin.util.WindowUtil.showError('Mod Load Error', error.message);

case MOD_MISSING_ID:
funkin.util.WindowUtil.showError('Mod Load Error', error.message);

case MOD_MISSING_METADATA:
funkin.util.WindowUtil.showError('Mod Load Error', error.message);

case MOD_METADATA_PARSE_FAILED:
funkin.util.WindowUtil.showError('Mod Metadata Parse Error', error.message);

case MOD_VERSION_PARSE_FAILED:
funkin.util.WindowUtil.showError('Mod Version Parse Error', error.message);

case MOD_API_VERSION_PARSE_FAILED:
funkin.util.WindowUtil.showError('Mod API Version Parse Error', error.message);

case MOD_MISSING_ICON:

//
//

case MOD_API_VERSION_MISMATCH:

{

+ '\n\nPlease inform the mod developer that "$modId" must be updated for compatibility.';

funkin.util.WindowUtil.showError('Mod Outdated', message);
}
else
{
funkin.util.WindowUtil.showError('Mod Outdated', error.message);
}

case MOD_LOAD_FAILED:

case MOD_LOAD_DONE:

//
//

case MOD_OPTIONAL_DEPENDENCY_UNMET:

case MOD_DEPENDENCY_UNMET:
switch (error.origin)
{
case SCAN:
funkin.util.WindowUtil.showError('Mod Dependency Error', error.message);
default:
funkin.util.WindowUtil.showError('Mod Dependency Error', error.message);
}

case MOD_DEPENDENCY_VERSION_MISMATCH:
switch (error.origin)
{
case SCAN:
funkin.util.WindowUtil.showError('Mod Dependency Error', error.message);
default:
funkin.util.WindowUtil.showError('Mod Dependency Error', error.message);
}

case MOD_DEPENDENCY_CYCLICAL:
funkin.util.WindowUtil.showError('Mod Dependency Error', error.message);

//
//

case SCRIPT_PARSE_FAILED:
funkin.util.WindowUtil.showError('Script Parsing Error', error.message);

case SCRIPT_RUNTIME_EXCEPTION:
funkin.util.WindowUtil.showError('Script Exception', error.message);

case SCRIPTED_CLASS_NOT_REGISTERED:
funkin.util.WindowUtil.showError('Script Parsing Error', error.message);

case SCRIPTED_CLASS_ALREADY_REGISTERED:
funkin.util.WindowUtil.showError('Script Parsing Error', error.message);

case SCRIPTED_CLASS_REDUNDANT_IMPORT:

case SCRIPTED_CLASS_UNRESOLVED_IMPORT:
funkin.util.WindowUtil.showError('Script Import Error', error.message);

case SCRIPTED_CLASS_BLACKLISTED_MODULE:
funkin.util.WindowUtil.showError('Script Blacklist Violation', error.message);

case SCRIPTED_CLASS_BLACKLISTED_FIELD:
funkin.util.WindowUtil.showError('Script Blacklist Violation', error.message);

//
//

case FRAMEWORK_INIT, MOD_DEPENDENCY_CHECK_SKIPPED, SCRIPT_PARSE_START, SCRIPT_PARSE_DONE:

default:
switch (error.severity)
{
case ERROR:
case WARNING:
case INFO:
case DEBUG:
}
}
}
}
