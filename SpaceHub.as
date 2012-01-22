package  {
	
	public class SpaceHub {
		static var EMPLOYEE_COST:int = 50; //cost per employee
		static var SPACE_COST:int = 2; //cost per unit, units added by 25s
		static var SPACE_UNIT = 25; //amount to increment/decrement space by
		static var EMPLOYEE_EFFICIENCY:int = 10; //process this many packages a month
		static var BASE_HUB_COST = 100; //base op cost of a hub
		public static var NEW_HUB_COST = 1000; //cost to open a new hub
		
		var capacity:int; //capacity of the facility
		var freightCapable:Boolean = false; //can handle freight?
		var employees:int; //num employees
		var packages:Array = new Array(); //packages currently in the facility
		public function SpaceHub(cap:int, emp:int) {
			this.capacity = cap;
			this.employees = emp;
		}
		
		public function isFreightCapable():Boolean {
			return freightCapable;
		}
		
		public function monthlyCost():int {
			//cost of employees and facilities per month
			return BASE_HUB_COST + EMPLOYEE_COST*employees + SPACE_COST*capacity;
		}
		
		public function freeSpace():int {
			//capacity minus current package unit volume
			return capacity - packages.length;
		}
		
		public function throughput():int {
			//number of packages processed per month
			//employee efficency times number of employees
			return EMPLOYEE_EFFICIENCY*employees;
		}
		
		public function costToClose():int {
			//cost to close the hub. Severance for employees makes per-emp cost higher
			//planned: {severance}*employees + capacity
			return 0;
		}
		
		public function incrementUnits() {
			capacity += SPACE_UNIT;
		}
		public function decrementUnits() {
			capacity -= SPACE_UNIT;
		}
		public function addEmployee() {
			employees++;
		}
		public function removeEmployee() {
			employees--;
		}

	}
	
}
