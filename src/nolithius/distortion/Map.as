package nolithius.distortion 
{
	/**
	 * An abstract map that holds a 2D tile array (Number Vector) as well as some utility methods.
	 * The numbers in a Map are normalized to the (0, 1) range.
	 * @author Ebyan "Nolithius" Alvarez-Buylla
	 */
	public class Map 
	{
		public static const WIDTH = 580;
		public static const HEIGHT = 580;
		
		/**
		 * Our 2D tile array.
		 */
		public var tiles:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();
		
		public function Map() 
		{			
			// Basic initialization to make sure we don't have indexes out of bounds
			for (var ix:int = 0; ix < WIDTH; ix++)
			{
				var arrayY:Vector.<Number> = new Vector.<Number>();
				tiles.push(arrayY);
				
				for (var iy:int = 0; iy < HEIGHT; iy++)
				{
					// Init to 0
					arrayY.push(0);
				}
			}
		}
		
		/**
		 * Normalize to (0, 1)
		 */
		public function normalize ():void
		{
			// Start with extremes
			var max:Number = Number.NEGATIVE_INFINITY;
			var min:Number = Number.POSITIVE_INFINITY;
			
			// First, find the min and the max
			for (var ix:int = 0; ix < WIDTH; ix++)
			{			
				for (var iy:int = 0; iy < HEIGHT; iy++)
				{
					var tile:Number = tiles[ix][iy];
					
					if (tile > max)
					{
						max = tile;
					}
					
					if (tile < min)
					{
						min = tile;
					}
				}
			}
			
			var delta:Number = max - min;
						
			// Then normalize to (0, 1)
			for (ix = 0; ix < WIDTH; ix++)
			{			
				for (iy = 0; iy < HEIGHT; iy++)
				{
					// Avoid division by zero
					if (delta != 0)
					{
						tiles[ix][iy] = (tiles[ix][iy] - min) / delta;
					}
					// Special case, just zero out
					else
					{
						tiles[ix][iy] = 0;
					}
				}
			}
		}
	}
}