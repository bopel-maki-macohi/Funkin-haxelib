package funkin.ui.haxeui.components;


class WaveformPlayer extends SpriteWrapper
{

public function new(?waveformData:WaveformData)
{
super();
this.waveform = new WaveformSprite(waveformData);
this.sprite = waveform;
}
}
