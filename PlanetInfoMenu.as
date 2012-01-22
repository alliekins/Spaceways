package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class PlanetInfoMenu extends MovieClip {
		var planet:Planet;
		var hub:SpaceHub;
		public function PlanetInfoMenu(p:Planet) {
			this.planet = p;
			this.menuName.nameBox.text = planet.pName;
			this.hub = p.spaceHub;
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDragThis);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDragThis);
			updateMenu();
		}
		
		public function startDragThis(me:MouseEvent) {
			startDrag(false);
		}
		public function stopDragThis(me:MouseEvent) {
			stopDrag();
		}
		
		public function submenu_BuildHub(me:MouseEvent) {
			trace("building default hub on " + planet.pName);
			planet.addSpaceHub(new SpaceHub(50,5));
			this.updateMenu();
		}
		
		public function submenu_CloseHub(me:MouseEvent) {
			planet.removeSpaceHub();
			this.updateMenu();
		}
		
		public function addUnitsToHub(me:MouseEvent) {
			hub.incrementUnits();
			this.updateMenu();
		}
		public function removeUnitsFromHub(me:MouseEvent) {
			hub.decrementUnits();
			this.updateMenu();
		}
		public function addEmpToHub(me:MouseEvent) {
			hub.addEmployee();
			this.updateMenu();
		}
		public function removeEmpFromHub(me:MouseEvent) {
			hub.removeEmployee();
			this.updateMenu();
		}
		
		public function updateMenu() {
			this.planetPopulationBox.text = formatNumber(planet.population);
			hub = planet.spaceHub;
			if (hub != null) {
				//we got a space hub, people!
				menu_HubStats.alpha = 1;
				menu_NoSpaceHub.alpha = 0;
				
				//let's populate dat shiznit
				var menu:MovieClip = menu_HubStats;
				menu.hubSizeBox.text = hub.capacity;
				menu.hubEmployeesBox.text = hub.employees;
				menu.hubFreeSpaceBox.text = hub.freeSpace();
				menu.hubThroughputBox.text = hub.throughput();
				menu.hubPackagesProcessedBox.text = "N/A";
				menu.hubUnitsProcessedBox.text = "N/A";
				menu.hubPackagesRefusedBox.text = hub.rejected;
				menu.hubCostPerMonthBox.text = hub.monthlyCost();
				menu.hubIncomePerMonthBox.text = "N/A";
				menu.hubProfitPerMonthBox.text = "N/A";
				menu.closeSpaceHub.costBox.text = hub.costToClose();
				
				menu.closeSpaceHub.addEventListener(MouseEvent.CLICK, submenu_CloseHub);
				menu.addUnitsButton.addEventListener(MouseEvent.CLICK, addUnitsToHub);
				menu.removeUnitsButton.addEventListener(MouseEvent.CLICK, removeUnitsFromHub);
				menu.addEmployeesButton.addEventListener(MouseEvent.CLICK, addEmpToHub);
				menu.removeEmployeesButton.addEventListener(MouseEvent.CLICK, removeEmpFromHub);
				
				menu.closeSpaceHub.addEventListener(MouseEvent.MOUSE_OVER, function() {
															   menu.closeSpaceHub.gotoAndPlay("MouseOver");
															   });
				menu.closeSpaceHub.addEventListener(MouseEvent.MOUSE_OUT, function() {
															   menu.closeSpaceHub.gotoAndPlay("Regular");
															   });
				
			} else {
				//NOPE NOPE NOPE
				menu_HubStats.alpha = 0;
				menu_NoSpaceHub.alpha = 1;
				menu_NoSpaceHub.buildSpaceHub.costBox.text = SpaceHub.NEW_HUB_COST;
				
				menu_NoSpaceHub.buildSpaceHub.addEventListener(MouseEvent.CLICK, submenu_BuildHub);
				menu_NoSpaceHub.buildSpaceHub.addEventListener(MouseEvent.MOUSE_OVER, function() {
															   menu_NoSpaceHub.buildSpaceHub.gotoAndPlay("MouseOver");
															   });
				menu_NoSpaceHub.buildSpaceHub.addEventListener(MouseEvent.MOUSE_OUT, function() {
															   menu_NoSpaceHub.buildSpaceHub.gotoAndPlay("Regular");
															   });
			}
		}
		
		public static function formatNumber(number:Number):String{
			var numString:String = number.toString()
			var result:String = ''
	
			while (numString.length > 3)
			{
					var chunk:String = numString.substr(-3)
					numString = numString.substr(0, numString.length - 3)
					result = ',' + chunk + result
			}
	
			if (numString.length > 0)
			{
					result = numString + result
			}
	
			return result
		}

	}
	
}
