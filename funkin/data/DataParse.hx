

/**
* `json2object` has an annotation `@:jcustomparse` which allows for mutation of parsed values.
*
* It also allows for validation, since throwing an error in this function will cause the issue to be properly caught.
* Parsing will fail and `parser.errors` will contain the thrown exception.
*
* Functions must be of the signature `(hxjsonast.Json, String) -> T`, where the String is the property name and `T` is the type of the property.
*/
class DataParse
{
/**
* `@:jcustomparse(funkin.data.DataParse.stringNotEmpty)`
* @param json Contains the `pos` and `value` of the property.
* @param name The name of the property.
* @throws Error If the property is not a string or is empty.
* @return The string value.
*/
public static function stringNotEmpty(json:Json, name:String):String
{
switch (json.value)
{
case JString(s):
default:
}
}

/**
* `@:jcustomparse(funkin.data.DataParse.semverVersion)`
* @param json Contains the `pos` and `value` of the property.
* @param name The name of the property.
* @return The value of the property as a `thx.semver.Version`.
*/
public static function semverVersion(json:Json, name:String):Version
{
switch (json.value)
{
case JString(s):
default:
}
}

/**
* `@:jcustomparse(funkin.data.DataParse.semverVersionRule)`
* @param json Contains the `pos` and `value` of the property.
* @param name The name of the property.
* @return The value of the property as a `thx.semver.VersionRule`.
*/
public static function semverVersionRule(json:Json, name:String):VersionRule
{
switch (json.value)
{
case JString(s):
default:
}
}

/**
* Parser which outputs a Dynamic value, either a object or something else.
* @param json
* @param name
* @return The value of the property.
*/
public static function dynamicValue(json:Json, name:String):Dynamic
{
}

/**
* Parser which outputs a `Either<Array<LegacyNoteSection>, LegacyNoteData>`.
* Used by the FNF legacy JSON importer.
*/
public static function eitherLegacyNoteData(json:Json, name:String):Either<Array<LegacyNoteSection>, LegacyNoteData>
{
switch (json.value)
{
case JArray(values):
case JObject(fields):
default:
}
}

/**
* Parser which outputs a `Either<Float, Array<Float>>`.
*/
public static function eitherFloatOrFloats(json:Json, name:String):Null<Either<Float, Array<Float>>>
{
switch (json.value)
{
case JNumber(f):
case JArray(fields):
default:
}
}

public static function backdropData(json:Json, name:String):funkin.data.dialogue.ConversationData.BackdropData
{
switch (json.value)
{
case JObject(fields):

for (field in fields)
{
switch (field.name)
{
case 'type':
}
}

switch (backdropType)
{
case 'solid':
default:
}

default:
}
}

public static function outroData(json:Json, name:String):Null<funkin.data.dialogue.ConversationData.OutroData>
{
switch (json.value)
{
case JObject(fields):

for (field in fields)
{
switch (field.name)
{
case 'type':
}
}

switch (outroType)
{
case 'none':
case 'fade':
default:
}
default:
}
}

/**
* Parser which outputs a `Either<Float, LegacyScrollSpeeds>`.
* Used by the FNF legacy JSON importer.
*/
public static function eitherLegacyScrollSpeeds(json:Json, name:String):Either<Float, LegacyScrollSpeeds>
{
switch (json.value)
{
case JNumber(f):
case JObject(fields):
default:
}
}

/**
* Array of JSON fields `[{key, value}, {key, value}]` to a Dynamic object `{key:value, key:value}`.
* @param fields
* @return Dynamic
*/
static function jsonFieldsToDynamicObject(fields:Array<JObjectField>):Dynamic
{
for (field in fields)
{
}
}

/**
* Array of JSON elements `[Json, Json, Json]` to a Dynamic array `[String, Object, Int, Array]`
* @param jsons
* @return Array<Dynamic>
*/
static function jsonArrayToDynamicArray(jsons:Array<Json>):Array<Null<Dynamic>>
{
}

static function legacyNoteSectionArray(json:Json, name:String):Array<LegacyNoteSection>
{
switch (json.value)
{
case JArray(values):
default:
}
}

static function legacyNoteSection(json:Json, name:String):LegacyNoteSection
{
switch (json.value)
{
case JObject(fields):
mustHitSection: false,
sectionNotes: [],
for (field in fields)
{
switch (field.name)
{
case 'sectionNotes':

case 'mustHitSection':
case 'typeOfSection':
case 'lengthInSteps':
case 'changeBPM':
case 'bpm':
}
}
default:
}
}

public static function legacyNoteData(json:Json, name:String):LegacyNoteData
{
switch (json.value)
{
case JObject(fields):
for (field in fields)
{
}
default:
}
}

public static function legacyNotes(json:Json, name:String):Array<LegacyNote>
{
switch (json.value)
{
case JArray(values):
default:
}
}

public static function legacyNote(json:Json, name:String):LegacyNote
{
switch (json.value)
{
case JArray(values):

default:
}
}
}
