package nolithius.distortion 
{
	import nolithius.distortion.Map;
	
	/**
	 * The composite distortion map.
	 * @author Ebyan "Nolithius" Alvarez-Buylla
	 */
	public class DistortionMap extends Map
	{
		/**
		 * Creates a distortion map based on the basemap, distorting the x and y values with their corresponding maps, with a strength defined by the amplitude.
		 * @param	baseMap		The base map to distort.
		 * @param	distortionX	The values, in (0,1), to distort the map on the x, which will be mapped to (-1, 1).
		 * @param	distortionY The values, in (0,1), to distort the map on the y, which will be mapped to (-1, 1).
		 * @param	amplitude	How how many pixels should a value of 1 (or -1) reach towards. Keep this value under WIDTH and HEIGHT to avoid out of index errors.
		 */
		public function DistortionMap (baseMap:Map, distortionX:Map, distortionY:Map, amplitude:Number) 
		{
			for (var ix:int = 0; ix < WIDTH; ix++)
			{
				for (var iy:int = 0; iy < HEIGHT; iy++)
				{
					// Map x distortion from (0,1) to (-1,1)
					var distortionVectorX:Number = distortionX.tiles[ix][iy] * 2 - 1;
					
					// Apply amplitude
					distortionVectorX *= amplitude;
					
					// Map y distortion from (0,1) to (-1,1)
					var distortionVectorY:Number = distortionY.tiles[ix][iy] * 2 - 1;
					
					// Apply amplitude
					distortionVectorY *= amplitude;
					
					// Calculate sourceX and sourceY by addind the offset, rounding, and ensuring we loop around
					var sourceX = Math.round(ix + distortionVectorX + WIDTH) % WIDTH;
					var sourceY = Math.round(iy + distortionVectorY + HEIGHT) % HEIGHT;
										
					// Grab the modified index from the base map, and set on the resulting map
					tiles[ix][iy] = baseMap.tiles[sourceX][sourceY];
				}
			}
		}
	}
}