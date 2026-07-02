

/**
* Yoinked from AustinEast, thanks hopefully u dont mind me using some of ur good code
* instead of my dumbass ugly code bro
*/
class MeshRender extends FlxStrip
{

public function new(x, y, ?col:FlxColor = FlxColor.WHITE)
{
}

/**
* Add a vertex.
*/
public inline function build_vertex(x:Float, y:Float, u:Float = 0, v:Float = 0):Int
{



}

/**
* Build a triangle from three vertex indexes.
* @param a
* @param b
* @param c
*/
public function add_tri(a:Int, b:Int, c:Int):Void
{

}

public function build_tri(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, au:Float = 0, av:Float = 0, bu:Float = 0, bv:Float = 0, cu:Float = 0,
cv:Float = 0):Void
{
}

/**
* @param a top left vertex
* @param b top right vertex
* @param c bottom right vertex
* @param d bottom left vertex
*/
public function add_quad(a:Int, b:Int, c:Int, d:Int):Void
{
}

public override function draw():Void
{
}

/**
* Build a quad from four points.
*
* top right - a
* top left - b
* bottom right  - c
* bottom left - d
*/
public function build_quad(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, dx:Float, dy:Float, au:Float = 0, av:Float = 0, bu:Float = 0,
bv:Float = 0, cu:Float = 0, cv:Float = 0, du:Float = 0, dv:Float = 0):Void
{

}

public function clear()
{
}
}
