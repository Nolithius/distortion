package nolithius.distortion 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	/**
	 * Perlin Noise Map.
	 * @author Ebyan "Nolithius" Alvarez-Buylla
	 */
	public class PerlinNoiseMap extends Map
	{
		public function PerlinNoiseMap (baseX:Number, baseY:Number, octaves:uint, seed:int) 
		{
			var bitmapData:BitmapData = new BitmapData(WIDTH, HEIGHT, false, 0);
			bitmapData.perlinNoise(baseX, baseY, octaves, seed, false, true, 1, true);
			var pixels:Vector.<uint> = bitmapData.getVector(new Rectangle(0, 0, WIDTH, HEIGHT));

			for (var ix:int = 0; ix < WIDTH; ix++)
			{			
				for (var iy:int = 0; iy < HEIGHT; iy++)
				{
					// Pixels is a flat array, so unflatten to grab value
					var pixel:uint = pixels[iy * WIDTH + ix];
									
					// We only care about the low bits (0-255)
					pixel &= 0x0000FF;
					
					// Push raw 0-255 value for now
					tiles[ix][iy] = pixel;
				}
			}
			
			// Normalize to (0, 1) range
			normalize();
		}
	}
}