package funkin.util.macro;


using haxe.macro.Tools;

/**
* Macros for simplifying SaveProperty creation and automatic initialization.
*/
class SaveMacro
{
/**
* Build macro that automatically generates SaveProperty initialization code.
* Looks for fields with @:saveProperty metadata and generates initialization in constructor.
*/
public static function buildSaveProperties():Array<Field>
{

for (field in fields)
{
{
savePropertyFields.push(field);
}
}

{
}

for (field in savePropertyFields)
{
{
initExprs.push(initExpr);
}
}

{
injectIntoConstructor(fields, initExprs);
}

}

static function isSavePropertyField(field:Field):Bool
{
{
case FVar(t, _):
switch (t)
{
case TPath(p): p.name == "SaveProperty";
case _: false;
}
case _: false;
};
}

static function hasSavePropertyMeta(field:Field):Bool
{
for (meta in field.meta)
{
}
}

static function generateInitExpression(field:Field):Null<Expr>
{

for (m in field.meta)
{
{
meta = m;
break;
}
}

{
Context.error("@:saveProperty metadata requires at least one parameter (dataPath)", field.pos);
}


{
macro $i{field.name} = new funkin.save.SaveProperty($dataPath ?? $defaultValue, () -> $dataPath ?? $defaultValue, (value) -> $dataPath = value);
}
else
{
macro $i{field.name} = new funkin.save.SaveProperty($dataPath, () -> $dataPath, (value) -> $dataPath = value);
};

}

static function parseDataPath(pathExpr:Expr):Expr
{
}

static function injectIntoConstructor(fields:Array<Field>, initExprs:Array<Expr>):Void
{
for (field in fields)
{
{
switch (field.kind)
{
case FFun(func):
switch (func.expr.expr)
{
case EBlock(exprs):
for (i in 0...exprs.length)
{
switch (exprs[i].expr)
{
case EBinop(OpAssign, {expr: EField({expr: EConst(CIdent("this"))}, "data")}, _):
insertIndex = i + 1;
break;
case _:
}
}


func.expr = {expr: EBlock(newExprs), pos: func.expr.pos};

case _:
Context.error("Constructor must have a block expression", field.pos);
}
case _:
}
break;
}
}
}
}
