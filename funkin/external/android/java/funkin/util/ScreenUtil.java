package funkin.util;

import android.os.Build;
import android.view.WindowInsets;



public class ScreenUtil
{
	public static Rect[] getCutoutDimensions()
	{
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P)
		{
			if (Extension.mainActivity != null)
			{
				WindowInsets insets = Extension.mainActivity.getWindow().getDecorView().getRootWindowInsets();

				if (insets != null)
				{
					DisplayCutout cutout = insets.getDisplayCutout();

					if (cutout != null)
					{
						List<Rect> boundingRects = cutout.getBoundingRects();

						if (boundingRects != null && !boundingRects.isEmpty())
							return boundingRects.toArray(new Rect[0]);
					}
				}
			}
		}

		return new Rect[0];
	}
}
