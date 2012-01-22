package  {
	
	public class SpaceHub {
		static var EMPLOYEE_COST:int = 50; //cost per employee
		static var SPACE_COST:int = 2; //cost per unit, units added by 25s
		static var EMPLOYEE_EFFICIENCY:int = 10; //process this many packages a month
		
		var capacity:int; //capacity of the facility
		var freightCapable:Boolean = false; //can handle freight?
		var employees:int; //num employees
		var packages:Array; //packages currently in the facility
		public function SpaceHub(cap:int, emp:int) {
			this.capacity = cap;
			this.employees = emp;
		}
		
		public function isFreightCapable():Boolean {
			return freightCapable;
		}
		
		public function monthlyCost():int {
			return 0;
		}

	}
	
}
