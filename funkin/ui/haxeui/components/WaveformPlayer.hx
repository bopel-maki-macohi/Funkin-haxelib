package funkin.ui.haxeui.components;


class WaveformPlayer extends SpriteWrapper
{
  public var waveform(default, null):WaveformSprite;

  public function new(?waveformData:WaveformData)
  {
    super();
    this.waveform = new WaveformSprite(waveformData);
    this.sprite = waveform;
  }
}
