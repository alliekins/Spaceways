package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	
	public class SpaceBoard extends MovieClip {
		//consts etc
		var SQUARE_W:int = 100;
		var SQUARE_H:int = 100;
		var GRID_W:int = 10;
		var GRID_H:int = 7
		var NUM_PLANETS:int = 5;
		
		public var planets:Array = new Array();
		public var spaceRoutes:Array = new Array();
		var myStage:Stage;
		var boardGrid:Array;
		var bottomBar:BottomBar;
		
		public var cashOnHand = 0;
		
		public function SpaceBoard(myStage:Stage) {
			this.myStage = myStage;
			cashOnHand = 5000;
			//make bottom bar
			bottomBar = new BottomBar();
			myStage.addChild(bottomBar);
			bottomBar.x = myStage.stageWidth/2;
			bottomBar.y = myStage.stageHeight-(bottomBar.height/2);
			trace("x:" + bottomBar.x + " y:" + bottomBar.y);
			
			
			//create 2D array of spaces
			var i:int;
			var j:int;
			boardGrid = new Array();
			for (i=0; i < GRID_W; i++) {
				boardGrid[i] = new Array();
				for (j=0; j < GRID_H; j++) {
					boardGrid[i][j] = null;
				}
			}
			
			//make planets
			var k:int = 0;
			for (k=0; k < NUM_PLANETS; k++) {
				planets.push( new Planet(PlanetNameGenerator.makeName(), this));
				var placed:Boolean = false;
				while (placed == false) {
					i=Math.floor(Math.random()*GRID_W);
					j=Math.floor(Math.random()*GRID_H);
					trace("Trying " + i + ", " + j);
					
					if (boardGrid[i][j] != null) {
						//something is there already
						placed = false;
						trace("Rejected " + i + ", " + j + ": Something's here!");
					} else if (i==0 || j==0 || i==(GRID_W-1) || j==(GRID_H-1)) {
						//we are on an edge, don't do it!
						placed = false;
						trace("Rejected " + i + ", " + j + ": Edge cases!");
					} else {
						//check neighbors for occupancy
						var bg:Array = boardGrid; //for ease of typing
						if (bg[i-1][j-1] != null || bg[i-1][j] != null || bg[i-1][j+1] != null ||
							bg[i][j-1] != null || bg[i][j+1] != null ||
							bg[i+1][j-1] != null || bg[i+1][j] != null || bg[i+1][j+1] != null) {
							//we have a neighbor, oh noes.
							placed = false;
							trace("Rejected " + i + ", " + j + ": Neighbor!");
						} else {
							//we are clear!
							placed = true;
							boardGrid[i][j] = planets[k];
							trace("adding planet at " + i + ", " + j);
						}
					}
					
				}
			}
			makeRoutes();
			drawBoard();
			drawBottomBar();
		}
		
		function adjustCashOnHand(amount:int) {
			trace("Deducting $" + amount);
			cashOnHand += amount;
			drawBottomBar();
		}
		
		function makeRoutes() {
			var k:int = 0;
			var j:int = 0;
			for (k=0; k < planets.length; k++) {
				for (j=k+1; j < planets.length; j++) {
					var sr:SpaceRoute = new SpaceRoute(planets[k], planets[j])
					spaceRoutes.push(sr);
					myStage.addChild(sr);
				}
			}
		}
		
		public function drawRoutes() {
			var k:int = 0;
			for (k=0; k < spaceRoutes.length; k++) {
				spaceRoutes[k].drawRoute(false);
			}
		}	
		
		public function drawBottomBar() {
			bottomBar.moniesBox.text = cashOnHand;
		}
		
		//draw the board
		function drawBoard() {
			var count1:int;
			var count2:int;
			var i:int = 0;
			var j:int = 0;
			for (i=0; i < boardGrid.length; i++) {
				for (j=0; j < boardGrid[i].length; j++) {
					if (boardGrid[i][j] != null) {
						var mc:MovieClip = boardGrid[i][j];
						mc.x = Math.floor(((myStage.stageWidth/GRID_W)*(i+1) - 0.5*SQUARE_W));
						mc.y = Math.floor(((myStage.stageHeight/GRID_H)* (j+1) - 0.5*SQUARE_H));
						myStage.addChild(mc);
						//trace("w:" + mc.width + " h:" + mc.height + " x:" + mc.x + " y:" + mc.y);
						//if (mc is Planet && (j%2 == 1)) {
						//	mc.addSpaceHub(new SpaceHub(50, 3));
						//}
					}
				}
			}
			drawRoutes();
		}
		
		function newMonth() {
			//deduct monthly costs
				//for hubs
				var i:int;
				for(i=0; i > planets.length; i++) {
					if (planets[i].spaceHub != null) {
						//deduct hub running costs
						adjustCashOnHand(-planets[i].spaceHub.costPerMonth());
						
						//deduct each ship's running cost
						var k:int;
						for (k=0; k < planets[i].spaceHub.ships.length; k++) {
							adjustCashOnHand(-planets[i].spaceHub.ships[k].runningCost());
						}
					}
				}
			//update spaceroute stats
		}
	}

}
