package funkin.util.macro;


/**
* A collection of utility functions for Haxe macros.
*/
class MacroUtil
{
/**
* Gets the value of a Haxe compiler define.
*
* @param key The name of the define to get the value of.
* @param defaultValue The value to return if the define is not set.
* @return An expression containing the value of the define.
*/
public static macro function getDefine(key:String, ?defaultValue:String):haxe.macro.Expr
{
}

/**
* Gets the current date and time (at compile time).
* @return A `Date` object containing the current date and time.
*/
public static macro function getDate():ExprOf<Date>
{
}

//
//

/**
* Convert an ExprOf<Class<T>> to a ClassType.
* @see https://github.com/jasononeil/compiletime/blob/master/src/CompileTime.hx#L201
* @param e The expression to convert.
* @return The `ClassType`
*/
public static function getClassTypeFromExpr(e:Expr):ClassType
{


{
nextSection = null;

switch (section)
{
case EConst(c):
switch (c)
{
case CIdent(cn):
default:
}
case EField(exp, field):
nextSection = exp.expr;
parts.unshift(field);

default:
}
}

{

switch (classTypeParsed)
{
case TInst(t, params):
default:
throw 'Class type could not be parsed: ${fullClassName}';
}
}

}

/**
* Determine whether a field is static.
* @param field The field to check.
* @return Whether the field is static.
*/
public static function isFieldStatic(field:haxe.macro.Expr.Field):Bool
{
}

/**
* Converts a value to an equivalent macro expression.
*/
public static function toExpr(value:Any):ExprOf<Any>
{
}

/**
* Determine whether two classes are equal.
* @param class1 The first class to compare.
* @param class2 The second class to compare.
* @return Whether the two classes are equivalent.
*/
public static function areClassesEqual(class1:ClassType, class2:ClassType):Bool
{
}

/**
* Retrieve a ClassType from a string name.
* @param name The name of the class to retrieve.
* @return The `ClassType`
*/
public static function getClassType(name:String):ClassType
{
switch (Context.getType(name))
{
case TInst(t, _params):
default:
throw 'Class type could not be parsed: ${name}';
}
}

/**
* If we are in a build macro, return whether a field already exists on the current class.
* @param name The name of the field to check for.
* @return Whether the field already exists.
*/
public static function fieldAlreadyExists(name:String):Bool
{
for (field in Context.getBuildFields())
{
{
}
}

function fieldAlreadyExistsSuper(name:String, superClass:Null<ClassType>)
{
{
}

for (field in superClass.fields.get())
{
{
}
}

}

}

/**
* Determine whether a given ClassType is a subclass of a given superclass.
* @param classType The class to check.
* @param superClass The superclass to check for.
* @return Whether the class is a subclass of the superclass.
*/
public static function isSubclassOf(classType:ClassType, superClass:ClassType):Bool
{

{
}

}

/**
* Determine whether a given ClassType implements a given interface.
* @param classType The class to check.
* @param interfaceType The interface to check for.
* @return Whether the class implements the interface.
*/
public static function implementsInterface(classType:ClassType, interfaceType:ClassType):Bool
{
for (i in classType.interfaces)
{
{
}
}

{
}

}

/**
* If the expression is a string constant, return the value, else return null.
*/
public static function extractStringConstant(?input:Expr):Null<String>
{

switch (input.expr)
{
case EConst(c):
switch (c)
{
case CString(s, kind):
{
}

default:
}
default:
}
}

/**
* If the expression is a string constant, return the value, else return null.
*/
public static function extractBooleanConstant(?input:Expr):Null<Bool>
{

switch (input.expr)
{
case EConst(c):
switch (c)
{
case CIdent(s):

Context.warning('[ASSET] "${input}" NON-BOOLEAN', input.pos);

default:
Context.warning('[ASSET] "${input}" NON-IDENTIFIER', input.pos);
}
default:
}
}

/**
* If the expression is an object declaration, extract a field of the given name from it.
* @param input The expression to extract from. Should be a `{name: value, ...}` object.
* @param name The name of the field to extract.
* @return The expression, or `null` if not found.
*/
public static function extractObjectField(?input:Expr, name:String):Null<Expr>
{
switch (input.expr)
{
case EObjectDecl(fields):
for (field in fields)
{
{
}
}
default:
}
}
}
