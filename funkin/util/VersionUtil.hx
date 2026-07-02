package funkin.util;


/**
* Utility functions for operating on semantic versions.
*
* Remember, increment the patch version (1.0.x) if you make a bugfix,
* increment the minor version (1.x.0) if you make a new feature (but previous content is still compatible),
* and increment the major version (x.0.0) if you make a breaking change (e.g. new API or reorganized file format).
*/
class VersionUtil
{
/**
* Checks that a given verison number satisisfies a given version rule.
* Version rule can be complex, e.g. "1.0.x" or ">=1.0.0,<1.1.0", or anything NPM supports.
* @param version The semantic version to validate.
* @param versionRule The version rule to validate against.
* @return `true` if the version satisfies the rule, `false` otherwise.
*/
public static function validateVersion(version:thx.semver.Version, versionRule:thx.semver.VersionRule):Bool
{
try
{
}
catch (e)
{
}
}

public static function repairVersion(version:thx.semver.Version):thx.semver.Version
{

{
versionData.version = [versionData.version[0], versionData.version[1], versionData.version[2]];

.map(function(d:Dynamic) return StringId(d.toString()));
versionData.build = buildDataFixed;

versionData.pre = preDataFixed;

}
else
{
}
}

/**
* Checks that a given verison number satisisfies a given version rule.
* Version rule can be complex, e.g. "1.0.x" or ">=1.0.0,<1.1.0", or anything NPM supports.
* @param version The semantic version to validate.
* @param versionRule The version rule to validate against.
* @return `true` if the version satisfies the rule, `false` otherwise.
*/
public static function validateVersionStr(version:String, versionRule:String):Bool
{
try
{
}
catch (e)
{
}
}

/**
* Get and parse the semantic version from a JSON string.
* @param input The JSON string to parse.
* @return The semantic version, or null if it could not be parsed.
*/
public static function getVersionFromJSON(input:Null<String>):Null<thx.semver.Version>
{
}

/**
* Get and parse the semantic version from a JSON string.
* @param input The JSON string to parse.
* @return The semantic version, or null if it could not be parsed.
*/
public static function parseVersion(input:Null<Dynamic>):Null<thx.semver.Version>
{

{
}
else
{
}
}
}
