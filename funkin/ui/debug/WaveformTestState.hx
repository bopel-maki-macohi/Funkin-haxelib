package funkin.ui.debug;


class WaveformTestState extends MusicBeatState
{
public function new()
{
super();
}





public override function create():Void
{
super.create();

testSprite.loadGraphic(Paths.image('funkay'));
testSprite.updateHitbox();
testSprite.clipRect = new FlxRect(0, 0, FlxG.width, FlxG.height);

waveformAudio = FunkinSound.load(Paths.inst('bopeebo', '-erect'));

waveformData = WaveformDataParser.interpretFlxSound(waveformAudio);

polygonSprite = new MeshRender(FlxG.width / 2, FlxG.height / 2, FlxColor.WHITE);

setPolygonVertices(vertexCount);
add(polygonSprite);

//

timeMarker = new FlxSprite(0, FlxG.height * 1 / 6);
timeMarker.makeGraphic(1, Std.int(FlxG.height * 2 / 3), FlxColor.RED);
add(timeMarker);

}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
{
waveformAudio.stop();
}
else
{
waveformAudio.play();
}
}

{
}

{
}

{
vertexCount += 1;
setPolygonVertices(vertexCount);
}
{
vertexCount -= 1;
setPolygonVertices(vertexCount);
}
{
}
{
}
}

function setPolygonVertices(count:Int)
{
polygonSprite.clear();





for (i in 0...count)
{

vertices.push([x, y]);

angle += 2 * Math.PI / count;
}



for (vertex in vertices)
{


{
firstVertex = newVertex;
}

{
polygonSprite.add_tri(centerVertex, lastVertex, newVertex);
}

lastVertex = newVertex;
}

polygonSprite.add_tri(centerVertex, lastVertex, firstVertex);
}

public override function destroy():Void
{
super.destroy();
}
}
