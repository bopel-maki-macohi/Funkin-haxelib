package funkin.util.macro;

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
hasZIndex = true;
break;
}
}

{
fields.push({
name: "zIndex", // Field name.
access: [haxe.macro.Expr.Access.APublic], // Access level
kind: haxe.macro.Expr.FieldType.FVar(macro :Int, macro $v{0}), // Variable type and default value
pos: pos, // The field's position in code.
});
}

}

/**
* A macro to be called targeting the `FlxSprite` class.
* @return An array of fields that the class contains.
*/
public static macro function buildFlxSprite():Array<haxe.macro.Expr.Field>
{

fieldsToAdd.push({name: "localX", kind: haxe.macro.Expr.FieldType.FVar(macro :Float, macro $v{0})});
fieldsToAdd.push({name: "localY", kind: haxe.macro.Expr.FieldType.FVar(macro :Float, macro $v{0})});
fieldsToAdd.push({name: "localAngle", kind: haxe.macro.Expr.FieldType.FVar(macro :Float, macro $v{0})});
fieldsToAdd.push({name: "localScale", kind: haxe.macro.Expr.FieldType.FVar(macro :flixel.math.FlxPoint, macro new flixel.math.FlxPoint(1, 1))});
fieldsToAdd.push({name: "localAlpha", kind: haxe.macro.Expr.FieldType.FVar(macro :Float, macro $v{1})});
fieldsToAdd.push({name: "localVisible", kind: haxe.macro.Expr.FieldType.FVar(macro :Bool, macro $v{true})});


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
});
}

}
}
