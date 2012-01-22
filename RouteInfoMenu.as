package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class RouteInfoMenu extends MovieClip {
		var route:SpaceRoute;
		public function RouteInfoMenu(r:SpaceRoute) {
			this.route = r;
			this.firstPlanetName.nameBox.text = r.planets[0].pName;
			this.secondPlanetName.nameBox.text = r.planets[1].pName;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDragThis);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDragThis);
			
			//actionlisteners for buttons
			this.shipPurchasing.buyShip1.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip2.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip3.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip4.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip5.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip6.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip7.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip8.addEventListener(MouseEvent.CLICK, buyShip);
			this.shipPurchasing.buyShip9.addEventListener(MouseEvent.CLICK, buyShip);
			
			this.shipPurchasing.sellShip1.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip2.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip3.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip4.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip5.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip6.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip7.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip8.addEventListener(MouseEvent.CLICK, sellShip);
			this.shipPurchasing.sellShip9.addEventListener(MouseEvent.CLICK, sellShip);
			
			updateMenu();
		}
		
		public function startDragThis(me:MouseEvent) {
			startDrag(false);
		}
		public function stopDragThis(me:MouseEvent) {
			stopDrag();
		}
		
		public function buyShip(me:MouseEvent) {
			//buy a ship!
			trace("this would add a ship");
			var shippyType:int;
			var caller:SimpleButton = me.target as SimpleButton;
			if (caller.name == "buyShip2") {
				shippyType = 1;
			} else if (caller.name == "buyShip3") {
				shippyType = 2;
			} else if (caller.name == "buyShip4") {
				shippyType = 3;
			} else if (caller.name == "buyShip5") {
				shippyType = 4;
			} else if (caller.name == "buyShip6") {
				shippyType = 5;
			} else if (caller.name == "buyShip7") {
				shippyType = 6;
			} else if (caller.name == "buyShip8") {
				shippyType = 7;
			} else if (caller.name == "buyShip9") {
				shippyType = 8;
			} else {
				shippyType = 0;
			}
			route.addShip(shippyType);
			route.drawRoute(false);
			updateMenu();
		}
		
		public function sellShip(me:MouseEvent) {
			//sell a ship!
			trace("this would remove a ship");
			var shippyType:int;
			var caller:SimpleButton = me.target as SimpleButton;
			if (caller.name == "sellShip2") {
				shippyType = 1;
			} else if (caller.name == "sellShip3") {
				shippyType = 2;
			} else if (caller.name == "sellShip4") {
				shippyType = 3;
			} else if (caller.name == "sellShip5") {
				shippyType = 4;
			} else if (caller.name == "sellShip6") {
				shippyType = 5;
			} else if (caller.name == "sellShip7") {
				shippyType = 6;
			} else if (caller.name == "sellShip8") {
				shippyType = 7;
			} else if (caller.name == "sellShip9") {
				shippyType = 8;
			} else {
				shippyType = 0;
			}
			route.removeShip(shippyType);
			route.drawRoute(false);
			updateMenu();
		}
		
		public function updateMenu() {
			var shipTypes:Array = route.countShipsOfType();
			this.shipPurchasing.ship1Count.text = shipTypes[0];
			this.shipPurchasing.ship2Count.text = shipTypes[1];
			this.shipPurchasing.ship3Count.text = shipTypes[2];
			this.shipPurchasing.ship4Count.text = shipTypes[3];
			this.shipPurchasing.ship5Count.text = shipTypes[4];
			this.shipPurchasing.ship6Count.text = shipTypes[5];
			this.shipPurchasing.ship7Count.text = shipTypes[6];
			this.shipPurchasing.ship8Count.text = shipTypes[7];
			this.shipPurchasing.ship9Count.text = shipTypes[8];
			
			this.routeCapBox.text = route.calcCapacity().toString();
			this.inTransitBox.text = route.calcTransit().toString();
			this.routeLengthBox.text = route.getDistance();
		}

	}
	
}
