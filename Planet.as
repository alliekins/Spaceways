package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import fl.motion.Color;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Planet extends MovieClip {
		var population:Number;
		public var spaceHub:SpaceHub;
		var color:Color;
		public var pName;
		var infomenu:PlanetInfoMenu;
		
		public function Planet(myName:String) {
			this.pName = myName;
			planetName.nameBox.text = pName;
			
			this.scaleX = .25;
			this.scaleY = .25;
			this.planetSphere.rotation = Math.random()*360;;
			this.population = Math.floor(Math.random()*1293)*Math.floor(Math.random()*4321)*2382;
			this.addEventListener(MouseEvent.CLICK, clicked);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseover);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseout);
			//random color
			
			//random 
		}
		
		public function addSpaceHub(sh:SpaceHub):void {
			this.spaceHub = sh;
			//adjust planet sprite based on hub size
			planetSphere.gotoAndPlay("SmallSpaceport");
		}
		public function removeSpaceHub():void {
			//deduct cost-to-close from treasury
			//disallow new arrivals
			//wait until empty, then delete object
			//OR close immediately, lose packages. In this case pay package value.
			trace("closing hub on " + pName);
			
			this.spaceHub = null;
			//adjust planet sprite based on hub size
			planetSphere.gotoAndPlay("NoSpaceport");
		}
		
		public function getCenter():Point {
			return new Point(this.x, this.y);
		}
		
		public function clicked(me:MouseEvent) {
			trace("Oh dearie me, I have been clicked!");
			this.openInfoMenu();
		}
		
		public function toggleSpaceport() {
			if (this.spaceHub != null) {
				removeSpaceHub();
			} else {
				addSpaceHub(new SpaceHub(50, 2));
			}
		}
		
		public function mouseover(me:MouseEvent) {
			//this.planetName.alpha = 1;
			//planetName.nameBox.text = pName;
		}
		public function mouseout(me:MouseEvent) {
			//this.planetName.alpha = 0;
			//planetName.nameBox.text = pName;
		}
		
		public function openInfoMenu() {
			infomenu = new PlanetInfoMenu(this);
			infomenu.x = stage.stageWidth/2;
			infomenu.y = stage.stageHeight/2;
			stage.addChild(infomenu);
			infomenu.closingX.addEventListener(MouseEvent.CLICK, function() { 
											   stage.removeChild(infomenu); 
											   infomenu = null;
											   });
			
			//addChild(new InfoMenu(this));
		}   

	}
	
}
