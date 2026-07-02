package funkin.util.macro;


using Lambda;
using haxe.macro.ExprTools;
using haxe.macro.TypeTools;
using StringTools;

/**
* The type parameters for a class extending `BaseRegistry`.
*/
typedef RegistryTypeParams =
{
/**
* The class type of the entry. Must implement `IRegistryEntry`.
*/

/**
* The type for the data of an entry. This is usually a typedef of a struct.
*/

}

/**
* A set of build macros to be applied to `Registry` classes in the `funkin.data` package.
*
* @see `funkin.data.BaseRegistry`
*/
class RegistryMacro
{

/**
* Builds the registry class.
*
* @return The modified list of fields for the target class.
*/
public static macro function buildRegistry():Array<Field>
{



buildEntryImpl(typeParams.entryType, cls);

fields = fields.concat(buildRegistryMethods(cls, fields, typeParams.entryType, typeParams.dataType));

cls.meta.add(":funkinProcessed", [], cls.pos);

}

/**
* Builds the registry entry class.
*
* @return The modified list of fields for the target class.
*/
public static macro function buildEntry():Array<Field>
{



fields = fields.concat(buildEntryVariables(cls, entryData));
fields = fields.concat(buildEntryMethods(cls));

cls.meta.add(":funkinProcessed", [], cls.pos);

}

/**
* Retrieve the type parameters for a class extending `BaseRegistry<T, J>`.
* @param cls The class to retrieve the type parameters for.
* @return The type parameters for the class.
*/
static function getTypeParams(cls:ClassType):RegistryTypeParams
{
switch (cls.superClass.t.get().kind)
{
case KGenericInstance(_, _params):
params = _params;
case KGeneric:
params = cls.superClass.params;
default:
throw '${cls.name}: Could not interpret type parameters of Registry class.';
}

for (param in params)
{
switch (param)
{
case TInst(t, _):
typeParams.push(t.get());
case TType(t, _):
typeParams.push(t.get());
default:
throw 'Not a class';
}
}
}

/**
* Builds new static and instance methods for a registry class.
*
* @param cls The registry class to build the methods for.
* @param fields The fields of the registry class.
* @param entryType The class type of entries in the registry.
* @param dataType The type of the data for entries in the registry.
* @return The modified list of fields for the target class.
*/
static function buildRegistryMethods(cls:ClassType, fields:Array<Field>, entryType:ClassType, dataType:Dynamic):Array<Field>
{







{
public function listBaseGameEntryIds():Array<String>
{
}

public function listModdedEntryIds():Array<String>
{
{
});
}

function getScriptedClassNames()
{
}

function createScriptedEntry(clsName:String)
{
}

public function parseEntryData(id:String)
{
parser.ignoreUnknownVariables = false;

switch (this.loadEntryFile(id))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(funkin.util.SerializerUtil.sanitizeJSON(contents), fileName);
default:
}

{
this.printErrors(parser.errors, id);
}
}

public function parseEntryDataRaw(contents:String, ?fileName:String)
{
parser.ignoreUnknownVariables = false;
parser.fromJson(contents, fileName);

{
this.printErrors(parser.errors, fileName);
}
}
}).fields.filter((field) -> return !MacroUtil.fieldAlreadyExists(field.name));
}

/**
* Retrieve the type of the JSON data for an entry.
* @param cls The entry class to retrieve the type of the JSON data for.
* @return Will be either a `DefType` or a `ClassType`.
*/
static function getEntryData(cls:ClassType):Any // DefType or ClassType
{
try
{
switch (cls.interfaces[0].params[0])
{
case Type.TInst(t, _):
case Type.TType(t, _):
default:
throw '${cls.name}: Type parameter for Entry must be a Class or typedef';
}
}
catch (e)
{
throw '${cls.name}: IRegistryEntry must be the last implemented interface';
}
}

/**
* Add fields to the entry class.
* @param cls The entry class to add fields to.
* @param entryData The type of the data for the entry.
* @return The modified list of fields for the target class.
*/
static function buildEntryVariables(cls:ClassType, entryData:Dynamic):Array<Field>
{

{
public final id:String;

public final _data:Null<$entryDataType>;
}).fields.filter((field) -> return !MacroUtil.fieldAlreadyExists(field.name));
}

/**
* Add methods to the entry class.
* @param cls The entry class to add methods to.
* @return The modified list of fields for the target class.
*/
static function buildEntryMethods(cls:ClassType):Array<Field>
{

{
public function _fetchData(id:String)
{
}

public function toString()
{
}

public function destroy()
{
${Context.parse(impl, Context.currentPos())}.destroy(this);
}
}).fields.filter((field) -> return !MacroUtil.fieldAlreadyExists(field.name));
}

/**
* Build an internal class that calls functions for an associated registry class.
* @param cls The entry class to build the internal class for.
* @param registryCls The registry class that the entry class is associated with.
*/
static function buildEntryImpl(cls:ClassType, registryCls:ClassType):Void
{


Context.defineType({
pos: Context.currentPos(),
pack: ['funkin', 'macro', 'impl'],
name: '_${cls.name}_Impl',
kind: TypeDefKind.TDClass(null, [], false, false, false),
fields: (macro class TempClass
{
public static inline function _fetchData(me:$clsType, id:String)
{
{
Context.parse(registry, Context.currentPos())
}.instance.parseEntryDataWithMigration(id, ${Context.parse(registry, Context.currentPos())}.instance.fetchEntryVersion(id));
}

public static inline function toString(me:$clsType)
{
}

public static inline function destroy(me:$clsType)
{
}
}).fields
});
}

static function getRegistryDataFilePath(cls:ClassType, fields:Array<Field>):String
{
for (field in fields)
{
{
switch (field.kind)
{
case FFun(f):
switch (f.expr.expr)
{
case EBlock(exprs):
switch (superCall.expr)
{
case ECall(_, args):

default:
Context.error('${cls.name}.new: RegistryMacro expected super call', field.pos);
}
default:
Context.error('${cls.name}.new: RegistryMacro expected super call', field.pos);
}
default:
}
}
}

}

static function listBaseGameEntryIds(dataFilePath:String):Array<Expr>
{

for (file in files)
{
result.push(macro $v{file.replace('.json', '')});
}

}

/**
* Check whether this class has already been processed by the RegistryMacro,
* as indicated by the `@:funkinProcessed` meta.
* @param cls The class to check.
* @return `true` if the class has already been processed, `false` otherwise.
*/
static function alreadyProcessed(cls:ClassType):Bool
{

}
}
