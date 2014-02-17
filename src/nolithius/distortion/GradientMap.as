package nolithius.distortion 
{
	/**
	 * Horizontal linear gradient map with an arbitraty number of bands.
	 * @author Ebyan "Nolithius" Alvarez-Buylla
	 */
	public class GradientMap extends Map
	{
		public function GradientMap(bands:int = 1) 
		{
			var bandHeight:int = HEIGHT / bands;
			
			for (var ix:int = 0; ix < WIDTH; ix++)
			{			
				for (var iy:int = 0; iy < HEIGHT; iy++)
				{
					// Calculate for first column
					if (ix == 0)
					{
						var bandLow:int = iy / HEIGHT;
						var bandHigh:int = bandLow + bandHeight;
						var bandMid:int = (bandHigh + bandLow) / 2;
						var bandPosition:int = iy % bandHeight;
						
						// 0 -> 1
						if (bandPosition <= bandMid)
						{
							tiles[ix][iy] = bandPosition / ((bandMid - bandLow) as Number);
						}
						// 1 -> 0 (mirror)
						else
						{
							tiles[ix][iy] = tiles[ix][bandMid - (bandPosition - bandMid)];
						}
					}
					// Copy otherwise
					else
					{
						tiles[ix][iy] = tiles[0][iy];
					}
				}
			}
		}		
	}
}