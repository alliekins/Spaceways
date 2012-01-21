package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import fl.motion.Color;
	
	public class Planet extends MovieClip {
		var population:int;
		var spaceHub:SpaceHub;
		var color:Color;
		public function Planet() {
			//random color
			
			//random 
		}
		
		public function addSpaceHub(sh:SpaceHub):void {
			this.spaceHub = sh;
			//adjust planet sprite based on hub size
		}
		

	}
	
}
