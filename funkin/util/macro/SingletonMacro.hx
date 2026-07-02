


/**
* A macro which automatically creates a Singleton `instance` property for a class.
* Add `implements funkin.util.tools.ISingleton` to your class to use.
*/
class SingletonMacro
{
/**
* Applies an `instance` static field to the target class.
* @return The modified list of fields for the target class.
*/
public static macro function build():Array<Field>
{



fields = fields.concat((macro class TempClass
{

static function get_instance():$clsType
{
{
_instance = ${Context.parse(newExpr, Context.currentPos())};
}
}

}
}
