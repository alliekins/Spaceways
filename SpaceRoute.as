package  {
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.events.MouseEvent; 
	import flash.geom.Point;
	
	public class SpaceRoute extends MovieClip {
		public var planets:Array;
		public var ships:Array;
		var infomenu:RouteInfoMenu;
		
		public function SpaceRoute(p1:Planet, p2:Planet) {
			planets = new Array(p1, p2);
			ships = new Array();
			//ships.push(new Ship(5));			
			trace("MADE A SPACE ROUTE FROM " + planets[0].pName + " TO " + planets[1].pName);
			drawRoute(false);
			this.addEventListener(MouseEvent.MOUSE_OVER, function() { drawRoute(true) } );
			this.addEventListener(MouseEvent.MOUSE_OUT, function() { drawRoute(false) } );
			this.addEventListener(MouseEvent.CLICK, clicked);
		}
		
		public function countShipsOfType():Array {
			var retArr:Array = new Array(0,0,0,0,0,0,0,0,0);
			var i:int;
			for (i=0; i < ships.length; i++) {
				retArr[ships[i].shipType]++;
			}
			return retArr;
		}
		
		public function getDistance() {
			return Math.floor(Point.distance(planets[0].getCenter(), planets[1].getCenter())/25);
		}
		
		public function calcCapacity():int {
			var cap:int = 0;
			var i:int = 0;
			for (i=0; i < ships.length; i++) {
				cap += Ship.capacity[ships[i].shipType];
			}
			return cap;
		}
		
		public function calcTransit():int {
			var transit:int = 0;
			var i:int = 0;
			for (i=0; i < ships.length; i++) {
				transit += ships[i].packageLoad();
			}
			return transit;
		}
		
		public function isValidRoute():Boolean {
			return (planets[0].spaceHub != null && planets[1].spaceHub != null);
		}
		
		public function addShip(shipType:int) {
			var sprice:int = Ship.price[shipType];
			if (planets[0].board.cashOnHand > sprice) {
				planets[0].board.adjustCashOnHand(-sprice);
				ships.push(new Ship(shipType, this));
			} else { trace("No monies :("); }
		}
		
		public function removeShip(shipType:int) {
			var i:int;
			for (i=0; i < ships.length; i++) {
				if (ships[i].shipType == shipType) {
					ships.splice(ships[i], 1);
					return;
				}
			}
			trace("err: no more ships of this type exist");
		}
		
		public function delivered(p:Package) {
			planets[0].board.adjustCashOnHand(p.getSize()*25);
		}
		
		public function drawRoute(isMouseover:Boolean) {
			//draw line from planets[0].getCenter() to planets[1].getCenter();
				var g:Graphics = this.graphics;
				g.clear();
			if (isValidRoute()) {
				g.moveTo(planets[0].getCenter().x, planets[0].getCenter().y);
				if (ships.length > 0) {
					if (isMouseover) {
						g.lineStyle(8, 0x330000, .75); //red at 100% opacity
						g.lineTo(planets[1].getCenter().x, planets[1].getCenter().y);
						g.lineStyle(4, 0xDD0033, .75); //red at 100% opacity
						g.lineTo(planets[0].getCenter().x, planets[0].getCenter().y);
					}
					//we are servicing this, make it red
					g.lineStyle(4, 0xDD0033, .75); //red at 100% opacity
				} else{
					if (isMouseover) {
						g.lineStyle(8, 0x330000, .10); //red at 100% opacity
						g.lineTo(planets[1].getCenter().x, planets[1].getCenter().y);
						g.lineStyle(4, 0x666666, .25);
						g.lineTo(planets[0].getCenter().x, planets[0].getCenter().y);
					}
					//we aren't, make it fadey gray
					g.lineStyle(2, 0x666666, .25);
				}
				g.lineTo(planets[1].getCenter().x, planets[1].getCenter().y);
				g.lineTo(planets[0].getCenter().x, planets[0].getCenter().y);
			} else {
				
			}
		}
		
		public function clicked(me:MouseEvent) {
			//open route info pane
			infomenu = new RouteInfoMenu(this);
			infomenu.x = stage.stageWidth/2;
			infomenu.y = stage.stageHeight/2;
			stage.addChild(infomenu);
			trace(infomenu.closingX);
			infomenu.closingX.addEventListener(MouseEvent.CLICK, function() { 
											   stage.removeChild(infomenu); 
											   infomenu = null;
											   });
			
		}
		
		

	}
	
}
