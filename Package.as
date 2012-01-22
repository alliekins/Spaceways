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

	}
	
}
