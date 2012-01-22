package  {
	import flash.display.MovieClip;
	
	public class PlanetInfoMenu extends MovieClip {
		var planet:Planet;
		var hub:SpaceHub;
		public function PlanetInfoMenu(p:Planet) {
			this.planet = p;
			this.menuName.nameBox.text = planet.pName;
			if (p.spaceHub != null) {
				//we got a space hub, people!
				this.hub = p.spaceHub;
				menu_HubStats.alpha = 1;
				menu_NoSpaceHub.alpha = 0;
				
				//let's populate dat shiznit
				
				
			} else {
				//NOPE NOPE NOPE
				this.hub = null;
				menu_HubStats.alpha = 0;
				menu_NoSpaceHub.alpha = 1;
			}
		}

	}
	
}
