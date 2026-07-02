package funkin.util.macro;

/**
* This class provides a macro to include an XML build file in the metadata of a Haxe class.
*
* The file must be located relative to the directory of the Haxe class that uses this macro.
*/
class LinkerMacro
{
/**
* Adds an XML `<include>` element to the class's metadata, pointing to a specified build file.
* @param fileName The name of the XML file to include. Defaults to `Build.xml` if not provided.
* @return An array of fields that are processed during the build.
*/
public static macro function xml(?fileName:String = 'Build.xml'):Array<haxe.macro.Expr.Field>
{


{
haxe.macro.Context.error('The specified file "$fileToInclude" could not be found at "$absSourcePath".', pos);
}


includeElement.set('name', fileToInclude);

cls.meta.add(':buildXml', [{
expr: EConst(CString(haxe.xml.Printer.print(includeElement, true))),
pos: pos
}], pos);

}
}
