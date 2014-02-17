package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import nolithius.distortion.DistortionMap;
	import nolithius.distortion.GradientMap;
	import nolithius.distortion.Map;
	import nolithius.distortion.PerlinNoiseMap;
	
	/**
	 * Perlin Distortion main class.
	 * @author Ebyan "Nolithius" Alvarez-Buylla
	 */
	public class Distortion extends Sprite
	{
		public function Distortion() 
		{	
			// Generate a simple horizontal linear gradient map with 3 bands
			var gradient:GradientMap = new GradientMap(3);
			
			// Generate two distortion maps, one for the x and one for the y. Seed them for consistency.
			var distortionX:PerlinNoiseMap = new PerlinNoiseMap(Map.WIDTH, Map.HEIGHT, 5, 500);
			var distortionY:PerlinNoiseMap = new PerlinNoiseMap(Map.WIDTH, Map.HEIGHT, 5, 800);
			
			// Create the distortion map with an amplitude of 100
			var distortionMap:DistortionMap = new DistortionMap(gradient, distortionX, distortionY, 100);
			
			drawMap(distortionMap);
		}
		
		public function drawMap (map:Map):void
		{		
			var bitmapData:BitmapData = new BitmapData(Map.WIDTH, Map.HEIGHT, false, 0);
			
			for (var ix:int = 0; ix < Map.WIDTH; ix++)
			{			
				for (var iy:int = 0; iy < Map.HEIGHT; iy++)
				{					
					var value:uint = Math.round(map.tiles[ix][iy] * 255);
					var pixel:uint = value << 16 | value << 8 | value;
					
					bitmapData.setPixel(ix, iy, pixel);
				}
			}
			
			addChild(new Bitmap(bitmapData));
		}
	}
}