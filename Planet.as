package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import fl.motion.Color;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Planet extends MovieClip {
		var population:int;
		var spaceHub:SpaceHub;
		var color:Color;
		public var pName;
		
		
		public function Planet(myName:String) {
			this.pName = myName;
			planetName.nameBox.text = pName;
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
				addSpaceHub(new SpaceHub());
			}
		}
		
		public function mouseover(me:MouseEvent) {
			//this.planetName.alpha = 1;
			trace("AW MAN DAT'S " + planetName.nameBox.text);
			//planetName.nameBox.text = pName;
		}
		public function mouseout(me:MouseEvent) {
			//this.planetName.alpha = 0;
			//planetName.nameBox.text = pName;
		}
		
		public function openInfoMenu() {
			addChild(new InfoMenu(this));
		}
		

	}
	
}
