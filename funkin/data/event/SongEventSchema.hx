package funkin.data.event;

abstract SongEventSchema(SongEventSchemaRaw)
{
/**
* These units look better when placed immediately next to the value, rather than after a space.
*/

public function new(?fields:Array<SongEventSchemaField>)
{
this = fields ?? [];
}

/**
* Retrieve a SongEventSchemaField by name. This works even if the field is inside a Frame.
* You can use array access to call this function; `schema["field_name"]`
*
* @param name The name of the field to retreive.
* @return The retrieved field, or null if not found.
*/
public function getByName(name:String):Null<SongEventSchemaField>
{

for (field in allFields)
{
}

}

/**
* Return whether the field with the given name exists.
* @param name The name of the field to check.
* @return Whether the field exists.
*/
public function hasField(name:String):Bool
{
}

/**
* Retrieve the first field in the schema.
* @return The first field.
*/
public function getFirstField():Null<SongEventSchemaField>
{
}

/**
* Retrieve a field from the schema by numeric index.
* @param key The index of the field to retrieve.
* @return The retrieved field.
*/
public inline function get(key:Int):Null<SongEventSchemaField>
{
}

/**
* Write a field to the schema by numeric index.
* @param k The index of the field to write.
* @param v The new field value to write.
* @return The assigned value.
*/
public inline function arrayWrite(k:Int, v:SongEventSchemaField):SongEventSchemaField
{
}

/**
* For a given song event field, retrieve its default value.
* @param name The name of the field to retrieve.
* @return The default value of the field, or null if not found.
*/
public function getDefaultFieldValue(name:String):Null<Dynamic>
{
}

/**
* For a given song event field, convert the value into a string.
* This is particularly useful for ENUM fields.
*
* @param name The name of the field to display.
* @param value The value of the field to convert.
* @param addUnits Whether to add the units specified by the schema to the resulting string.
* @return The resulting string.
*/
public function stringifyFieldValue(name:String, value:Dynamic, addUnits:Bool = true):String
{

switch (field.type)
{
case SongEventFieldType.STRING:
case SongEventFieldType.INTEGER:
case SongEventFieldType.FLOAT:
case SongEventFieldType.BOOL:
case SongEventFieldType.ENUM:
for (key in fieldKeys)
{
}
default:
}
}

/**
* Apply the song event field's specified units to the value.
* @param value The value to add the units to.
* @param field The field to get the units from.
* @return The resulting string.
*/
function addUnitsToString(value:String, field:SongEventSchemaField):String
{


}

/**
* Build a flat list of all the fields in the schema. Frames containing children are parsed recursively.
*
* @param schema The song event schema schema to parse.
* @return The array of fields, parsed recursively from the schema and its child frames.
*/
function listAllFields(schema:SongEventSchemaRaw):Array<SongEventSchemaField>
{

for (field in schema)
{
{
result.push(field);
}
else
{
result = result.concat(field.children);
}
}

}

/**
* Get a list of all the field names in the schema, so they can be iterated over and retrieved.
* @return The list of field names.
*/
public function listAllFieldNames():Array<String>
{
}
}

/**
* The raw underlying data for a song event schema is an array of fields.
*/
typedef SongEventSchemaRaw = Array<SongEventSchemaField>;

/**
* The individual fields of a song event schema.
*/
typedef SongEventSchemaField =
{
/**
* The name of the property as it should be saved in the event data.
*/
name:String,

/**
* The title of the field to display in the UI.
*/
title:String,

/**
* The type of the field.
*/
type:SongEventFieldType,

/**
* Used only for ENUM values.
* The key is the display name and the value is the actual value.
*/
?keys:Map<String, Dynamic>,

/**
* Used for INTEGER and FLOAT values.
* The minimum value that can be entered.
* @default No minimum
*/
?min:Float,

/**
* Used for INTEGER and FLOAT values.
* The maximum value that can be entered.
* @default No maximum
*/
?max:Float,

/**
* Used for INTEGER and FLOAT values.
* The step value that will be used when incrementing/decrementing the value.
* @default `0.1`
*/
?step:Float,

/**
* Used for INTEGER and FLOAT values.
* The units that the value is expressed in (pixels, percent, etc).
*/
?units:String,

/**
* Used for FRAME values.
* The child components that this frame contains.
*/
?children:SongEventSchemaRaw,

/**
* Used for FRAME values.
* Whether to make the frame be collapsible.
*/
?collapsible:Bool,

/**
* An optional default value for the field.
*/
?defaultValue:Dynamic,
}

/**
* The available field types for a song event schema.
*/
enum abstract SongEventFieldType(String) from String to String
{
/**
* The STRING type will display as a text field.
*/

/**
* The INTEGER type will display as a text field that only accepts numbers.
*/

/**
* The FLOAT type will display as a text field that only accepts numbers.
*/

/**
* The BOOL type will display as a checkbox.
*/

/**
* The ENUM type will display as a dropdown.
* Make sure to specify the `keys` field in the schema.
*/

/**
* The FRAME type will display a frame with child components.
* Make sure to specify the `children` field in the schema.
*/
}
