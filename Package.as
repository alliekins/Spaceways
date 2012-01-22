package  {
	
	public class Package {
		public static var SMALL:int = 1;
		public static var MEDIUM:int = 2;
		public static var LARGE:int = 4;
		public static var FREIGHT:int = 10;
		
		var size:int;
		var origin:String;
		var destination:String;
		
		public function Package(size:int) {
			this.size = size;
		}
		
		public function getSize():int {
			return size;
		}
		
		public static function generateRandom():Package {
			var rand:int = Math.floor(Math.random()*3);
			switch (rand) {
				case 0:
					return new Package(Package.SMALL);
				case 1:
					return new Package(Package.MEDIUM);
				case 2:
					return new Package(Package.LARGE);
				default:
					return new Package(Package.SMALL);
			}
		}

	}
	
}
