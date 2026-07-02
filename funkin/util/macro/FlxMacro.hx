
class FlxMacro
{
/**
* A macro to be called targeting the `FlxBasic` class.
* @return An array of fields that the class contains.
*/
public static macro function buildFlxBasic():Array<haxe.macro.Expr.Field>
{


for (f in fields)
{
{
}
}

{
fields.push({
name: "zIndex", // Field name.
access: [haxe.macro.Expr.Access.APublic], // Access level
kind: haxe.macro.Expr.FieldType.FVar(macro :Int, macro $v{0}), // Variable type and default value
pos: pos, // The field's position in code.
}

}

/**
* A macro to be called targeting the `FlxSprite` class.
* @return An array of fields that the class contains.
*/
public static macro function buildFlxSprite():Array<haxe.macro.Expr.Field>
{



for (f in fields)
{
for (a in fieldsToAdd)
{
}
}

for (f in fieldsToAdd)
{

fields.push({
name: f.name, // Field name.
access: [haxe.macro.Expr.Access.APublic], // Access level
kind: f.kind, // Variable type and default value
pos: pos, // The field's position in code.
}

}
}
