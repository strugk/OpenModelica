// name:     AccessDemo Legal Mod
// keywords: <insert keywords here>
// status:   correct
// 
// Test the public and protected access keywords
// 

class AccessDemo "Illustration of access prefixes"
  		parameter Real a = 2;
  public 	Real x, z;
  		parameter Real y;
  protected
  		parameter Real w, u;
  		Real u2;
  public 	Real u3;
equation	
  x  = 2;	// Legal, since code inside the class
  z  = 5;	// Legal, since code inside the class
  u2 = 5;	// Legal, since code inside the class
  u3 = 8;  	// Legal, since code inside the class
end AccessDemo;

class B
  extends AccessDemo;
  Real p, q;
equation
  u2 = p;	// Legal, since AccessDemo is inherited
  u3 = q;  	// Legal, since u3 is public
end B;

// fclass B
// parameter Real a = 2;
// Real x;
// Real z;
// parameter Real y;
// parameter Real w;
// parameter Real u;
// Real u2;
// Real u3;
// Real p;
// Real q;
// equation
//   u2 = p;
//   u3 = q;
//   x = 2.0;
//   z = 5.0;
//   u2 = 5.0;
//   u3 = 8.0;
// end B;
