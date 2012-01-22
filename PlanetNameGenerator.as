package  {
	
	public class PlanetNameGenerator {
//the planet name array
		static var namePrefixes:Array = new Array(
			"alpha",
			"beta",
			"gamma",
			"delta",
			"old",
			"new",
			"epsilon",
			"tau"
														);
		
		static var nameBeginnings:Array = new Array(
			"sagitt",
			"procy",
			"arctur",
			"ind",
			"ursul",
			"serpens",
			"gemin",
			"virg",
			"centaur",
			"eridan",
			"scorp",
			"cygn",
			"cet"
			
														  );
		
		static var nameParts:Array = new Array(
			"mer",
			"mar",
			"pron",
			"bary",
			"lan",
			"tart",
			"cery",
			"cyc",
			"lon",
			"theon"
												 );
		static var nameEnds:Array = new Array(
			"a",
			"ia",
			"ara",
			"ari",
			"ion",
			"on",
			"une",
			"i"

												 );
		
		public function PlanetNameGenerator() {
			// constructor code
		}
		
		public static function makeName() {
			var nameType:int = Math.floor(Math.random()*2);
			var prefix:Boolean = true;
			if (Math.floor(Math.random()*3) == 0) {
				prefix = false;
			} 
			var theName:String = "";
			
			//do the prefix
			if (prefix) {
				var pref:int = Math.floor(Math.random()*namePrefixes.length);
				theName += namePrefixes[pref] + " ";
			}
			
			switch (nameType) {
				default:
				//make a standardish name
				var beg:int = Math.floor(Math.random()*nameBeginnings.length);
				theName += nameBeginnings[beg];
				var end:int = Math.floor(Math.random()*nameEnds.length);
				theName += nameEnds[end];
			}
			return theName;
		}

	}
	
}
