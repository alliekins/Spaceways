package  {
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	
	public class SpaceRoute extends MovieClip {
		var planets:Array;
		var ships:Array;
		public function SpaceRoute(p1:Planet, p2:Planet) {
			planets = new Array(p1, p2);
			ships = new Array();
			//ships.push(5);
			trace("MADE A SPACE ROUTE FROM " + planets[0].pName + " TO " + planets[1].pName);
			drawRoute(false);
			this.addEventListener(MouseEvent.MOUSE_OVER, function() { drawRoute(true) } );
			this.addEventListener(MouseEvent.MOUSE_OUT, function() { drawRoute(false) } );
			this.addEventListener(MouseEvent.CLICK, clicked);
		}
		
		public function drawRoute(isMouseover:Boolean) {
			//draw line from planets[0].getCenter() to planets[1].getCenter();
			var g:Graphics = this.graphics;
			g.clear();
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
			trace("DRAWING SHITS");
			g.lineTo(planets[1].getCenter().x, planets[1].getCenter().y);
			g.lineTo(planets[0].getCenter().x, planets[0].getCenter().y);
		}
		
		public function clicked(me:MouseEvent) {
			//open route info pane
			
		}

	}
	
}
