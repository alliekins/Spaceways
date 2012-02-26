package  {
	
	public class Ship {
		public var shipType:int;
		public var packages:Array;
		public var shipStatus:int;
		public var timeLeftAtAction:int;
		public var loading:int; //-1 unloading, 0 in transit, 1 loading
		public var route:SpaceRoute;
		
		//statuses
		public static var AT_P0:int = 5;
		public static var AT_P1:int = 7;
		public static var TRANSIT_TO_P0:int = 12;
		public static var TRANSIT_TO_P1:int = 24;
		
		public static var speed:Array = new Array( 1, 1, 2, 2, 1, 3, 2, 3, 3);
		public static var capacity:Array = new Array( 10, 30, 10, 30, 75, 10, 75, 30, 75);
		public static var price:Array = new Array( 1000, 2500, 2500, 4000, 5500, 5500, 7000, 7000, 10000);
		
		public function Ship(stype:int, sr:SpaceRoute) {
			this.shipType = stype;
			packages = new Array();
			this.route = sr;
			this.shipStatus = Ship.AT_P0;
		}
		
		public function runningCost() {
			return 100*speed[shipType];
		}
		
		//calculates currently-used space
		public function packageLoad():int {
			var i:int;
			var ret:int = 0;
			for (i=0; i < packages.length; i++) {
				ret += packages[i].getSize();
			}
			return ret;
		}
		
		public function freeSpace():int {
			return capacity[shipType] - packageLoad();
		}
		
		public function shipTick() {
			trace("Ship status " + shipStatus + " load:" + (packageLoad() + "/" + capacity[shipType]));
			var planet:Planet;
			if (shipStatus == Ship.AT_P0) {
				planet = route.planets[0];
			} else if (shipStatus == Ship.AT_P1) {
				planet = route.planets[1];
			} else {
				planet = null;
			}
			if (loading == 1) {
				//if loading
				var i:int;
				while (i<10) {
					if (planet.spaceHub.packages.length >0 &&
						(freeSpace() > planet.spaceHub.packages[0].getSize())) {
						this.packages.push(planet.spaceHub.packages.pop());
						if (planet.infomenu != null) {
							planet.infomenu.updateMenu();
						}
						i++;
					} else {
						i=10;
						loading = 0;
						//trace(planet.pName + " has " + planet.spaceHub.packages.length + "packages now (loaded " + packages.length + ")");
						if (shipStatus == Ship.AT_P0) {
							shipStatus = Ship.TRANSIT_TO_P1;
							trace("off to P1!");
						} else if (shipStatus == Ship.AT_P1) {
							shipStatus = Ship.TRANSIT_TO_P0;
							trace("off to P0!");
						} else {
							trace("HORRIBLE ERROR: Expected Ship to be at a planet, qq");
						}
						timeLeftAtAction = route.getDistance();
					}
				}
			} else if (loading == -1) {
				//if unloading
				//trace("Unloading at " + planet.pName);
				while (i<10) {
					if (packageLoad() > 0) {
						route.delivered(packages.pop());
						i++;
					} else {
						i=10;
						loading = 1;
						trace("ready for loading, " + planet.pName + " has " + planet.spaceHub.packages.length + "packages.");
					}
				}
			} else {			
				//is in transit
				//decrement time to transit
				timeLeftAtAction = timeLeftAtAction - speed[shipType];
				if (timeLeftAtAction <= 0){
					//we've arrived! Get ready for unloading.
					if (shipStatus == Ship.TRANSIT_TO_P1) {
						shipStatus = Ship.AT_P1;
						trace("arrived at " + route.planets[1].pName);
					} else if (shipStatus == Ship.TRANSIT_TO_P0) {
						shipStatus = Ship.AT_P0;
						trace("arrived at "+ route.planets[0].pName);
					} else {
						trace("HORRIBLE ERROR: Expected Ship have been in transit, qq");
					}
					loading = -1;
				}
			}
		}
		

	}
	
}
