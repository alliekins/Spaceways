package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import fl.motion.Color;
	import flash.events.MouseEvent;
	
	public class Planet extends MovieClip {
		var population:int;
		var spaceHub:SpaceHub;
		var color:Color;
		public function Planet() {
			
			this.addEventListener(MouseEvent.CLICK, clicked);
			//random color
			
			//random 
		}
		
		public function addSpaceHub(sh:SpaceHub):void {
			this.spaceHub = sh;
			//adjust planet sprite based on hub size
			this.gotoAndPlay("SmallSpaceport");
		}
		public function removeSpaceHub():void {
			this.spaceHub = null;
			//adjust planet sprite based on hub size
			this.gotoAndPlay("NoSpaceport");
		}
		
		public function clicked(me:MouseEvent) {
			trace("Oh dearie me, I have been clicked!");
			if (this.spaceHub != null) {
				removeSpaceHub();
			} else {
				addSpaceHub(new SpaceHub());
			}
		}
		

	}
	
}
