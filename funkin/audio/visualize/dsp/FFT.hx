package funkin.audio.visualize.dsp;

using funkin.audio.visualize.dsp.OffsetArray;
using funkin.audio.visualize.dsp.Signal;


/**
Fast/Finite Fourier Transforms.
**/
class FFT
{
/**
Computes the Discrete Fourier Transform (DFT) of a `Complex` sequence.

If the input has N data points (N should be a power of 2 or padding will be added)
from a signal sampled at intervals of 1/Fs, the result will be a sequence of N
samples from the Discrete-Time Fourier Transform (DTFT) - which is Fs-periodic -
with a spacing of Fs/N Hz between them and a scaling factor of Fs.
**/
public static function fft(input:Array<Complex>):Array<Complex> return do_fft(input, false);

/**
Like `fft`, but for a real (Float) sequence input.

Since the input time signal is real, its frequency representation is
Hermitian-symmetric so we only return the positive frequencies.
**/
public static function rfft(input:Array<Float>):Array<Complex>
{
}

/**
Computes the Inverse DFT of a periodic input sequence.

If the input contains N (a power of 2) DTFT samples, each spaced Fs/N Hz
from each other, the result will consist of N data points as sampled
from a time signal at intervals of 1/Fs with a scaling factor of 1/Fs.
**/
public static function ifft(input:Array<Complex>):Array<Complex> return do_fft(input, true);

static function do_fft(input:Array<Complex>, inverse:Bool):Array<Complex>
{
ditfft2(ts, 0, fs, 0, n, 1, inverse);
}

static function ditfft2(time:Array<Complex>, t:Int, freq:Array<Complex>, f:Int, n:Int, step:Int, inverse:Bool):Void
{
{
freq[f] = time[t].copy();
}
else
{
ditfft2(time, t, freq, f, halfLen, step * 2, inverse);
ditfft2(time, t + step, freq, f + halfLen, halfLen, step * 2, inverse);
for (k in 0...halfLen)
{
freq[f + k] = even + twiddle * odd;
freq[f + k + halfLen] = even - twiddle * odd;
}
}
}

static function dft(ts:Array<Complex>, ?inverse:Bool):Array<Complex>
{
fs.resize(n);
for (f in 0...n)
{
for (t in 0...n)
{
sum += ts[t] * Complex.exp((inverse ? 1 : -1) * 2 * Math.PI * f * t / n);
}
fs[f] = inverse ? sum.scale(1 / n) : sum;
}
}

/**
Finds the power of 2 that is equal to or greater than the given natural.
**/
static function nextPow2(x:Int):Int
{
else if ((x & (x - 1)) == 0) return x;
x--;
pow <<= 1;
}

static function main()
{




.findPeaks()
.map(k -> (k - (halfN - 1)) * Fs / N)
.filter(f -> f >= 0);
{
}
else
{
}

}
}
