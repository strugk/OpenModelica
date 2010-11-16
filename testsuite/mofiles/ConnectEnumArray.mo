// name: ConnectEnumArray
// keywords: connect enum array
// status: correct
//
// Tests that enumeration indices are preserved when connecting arrays with
// enumerations as dimensions.
//

type MyEnum = enumeration (e1, e2, e3, e4, e5);

block MyBlock
  input Real [MyEnum,5] in1;
  flow input Real [5,MyEnum] in2;
  output Real [5,MyEnum] out1;
  flow output Real [MyEnum,5] out2;
end MyBlock;

block MyLayout
  MyBlock b1, b2;
equation
  connect (b2.in1, b1.out1);
  connect (b2.in2, b1.out2);
end MyLayout;

block Test = MyLayout;

// Result:
// class Test
//   input Real b1.in1[MyEnum.e1,1];
//   input Real b1.in1[MyEnum.e1,2];
//   input Real b1.in1[MyEnum.e1,3];
//   input Real b1.in1[MyEnum.e1,4];
//   input Real b1.in1[MyEnum.e1,5];
//   input Real b1.in1[MyEnum.e2,1];
//   input Real b1.in1[MyEnum.e2,2];
//   input Real b1.in1[MyEnum.e2,3];
//   input Real b1.in1[MyEnum.e2,4];
//   input Real b1.in1[MyEnum.e2,5];
//   input Real b1.in1[MyEnum.e3,1];
//   input Real b1.in1[MyEnum.e3,2];
//   input Real b1.in1[MyEnum.e3,3];
//   input Real b1.in1[MyEnum.e3,4];
//   input Real b1.in1[MyEnum.e3,5];
//   input Real b1.in1[MyEnum.e4,1];
//   input Real b1.in1[MyEnum.e4,2];
//   input Real b1.in1[MyEnum.e4,3];
//   input Real b1.in1[MyEnum.e4,4];
//   input Real b1.in1[MyEnum.e4,5];
//   input Real b1.in1[MyEnum.e5,1];
//   input Real b1.in1[MyEnum.e5,2];
//   input Real b1.in1[MyEnum.e5,3];
//   input Real b1.in1[MyEnum.e5,4];
//   input Real b1.in1[MyEnum.e5,5];
//   input Real b1.in2[1,MyEnum.e1];
//   input Real b1.in2[1,MyEnum.e2];
//   input Real b1.in2[1,MyEnum.e3];
//   input Real b1.in2[1,MyEnum.e4];
//   input Real b1.in2[1,MyEnum.e5];
//   input Real b1.in2[2,MyEnum.e1];
//   input Real b1.in2[2,MyEnum.e2];
//   input Real b1.in2[2,MyEnum.e3];
//   input Real b1.in2[2,MyEnum.e4];
//   input Real b1.in2[2,MyEnum.e5];
//   input Real b1.in2[3,MyEnum.e1];
//   input Real b1.in2[3,MyEnum.e2];
//   input Real b1.in2[3,MyEnum.e3];
//   input Real b1.in2[3,MyEnum.e4];
//   input Real b1.in2[3,MyEnum.e5];
//   input Real b1.in2[4,MyEnum.e1];
//   input Real b1.in2[4,MyEnum.e2];
//   input Real b1.in2[4,MyEnum.e3];
//   input Real b1.in2[4,MyEnum.e4];
//   input Real b1.in2[4,MyEnum.e5];
//   input Real b1.in2[5,MyEnum.e1];
//   input Real b1.in2[5,MyEnum.e2];
//   input Real b1.in2[5,MyEnum.e3];
//   input Real b1.in2[5,MyEnum.e4];
//   input Real b1.in2[5,MyEnum.e5];
//   output Real b1.out1[1,MyEnum.e1];
//   output Real b1.out1[1,MyEnum.e2];
//   output Real b1.out1[1,MyEnum.e3];
//   output Real b1.out1[1,MyEnum.e4];
//   output Real b1.out1[1,MyEnum.e5];
//   output Real b1.out1[2,MyEnum.e1];
//   output Real b1.out1[2,MyEnum.e2];
//   output Real b1.out1[2,MyEnum.e3];
//   output Real b1.out1[2,MyEnum.e4];
//   output Real b1.out1[2,MyEnum.e5];
//   output Real b1.out1[3,MyEnum.e1];
//   output Real b1.out1[3,MyEnum.e2];
//   output Real b1.out1[3,MyEnum.e3];
//   output Real b1.out1[3,MyEnum.e4];
//   output Real b1.out1[3,MyEnum.e5];
//   output Real b1.out1[4,MyEnum.e1];
//   output Real b1.out1[4,MyEnum.e2];
//   output Real b1.out1[4,MyEnum.e3];
//   output Real b1.out1[4,MyEnum.e4];
//   output Real b1.out1[4,MyEnum.e5];
//   output Real b1.out1[5,MyEnum.e1];
//   output Real b1.out1[5,MyEnum.e2];
//   output Real b1.out1[5,MyEnum.e3];
//   output Real b1.out1[5,MyEnum.e4];
//   output Real b1.out1[5,MyEnum.e5];
//   output Real b1.out2[MyEnum.e1,1];
//   output Real b1.out2[MyEnum.e1,2];
//   output Real b1.out2[MyEnum.e1,3];
//   output Real b1.out2[MyEnum.e1,4];
//   output Real b1.out2[MyEnum.e1,5];
//   output Real b1.out2[MyEnum.e2,1];
//   output Real b1.out2[MyEnum.e2,2];
//   output Real b1.out2[MyEnum.e2,3];
//   output Real b1.out2[MyEnum.e2,4];
//   output Real b1.out2[MyEnum.e2,5];
//   output Real b1.out2[MyEnum.e3,1];
//   output Real b1.out2[MyEnum.e3,2];
//   output Real b1.out2[MyEnum.e3,3];
//   output Real b1.out2[MyEnum.e3,4];
//   output Real b1.out2[MyEnum.e3,5];
//   output Real b1.out2[MyEnum.e4,1];
//   output Real b1.out2[MyEnum.e4,2];
//   output Real b1.out2[MyEnum.e4,3];
//   output Real b1.out2[MyEnum.e4,4];
//   output Real b1.out2[MyEnum.e4,5];
//   output Real b1.out2[MyEnum.e5,1];
//   output Real b1.out2[MyEnum.e5,2];
//   output Real b1.out2[MyEnum.e5,3];
//   output Real b1.out2[MyEnum.e5,4];
//   output Real b1.out2[MyEnum.e5,5];
//   input Real b2.in1[MyEnum.e1,1];
//   input Real b2.in1[MyEnum.e1,2];
//   input Real b2.in1[MyEnum.e1,3];
//   input Real b2.in1[MyEnum.e1,4];
//   input Real b2.in1[MyEnum.e1,5];
//   input Real b2.in1[MyEnum.e2,1];
//   input Real b2.in1[MyEnum.e2,2];
//   input Real b2.in1[MyEnum.e2,3];
//   input Real b2.in1[MyEnum.e2,4];
//   input Real b2.in1[MyEnum.e2,5];
//   input Real b2.in1[MyEnum.e3,1];
//   input Real b2.in1[MyEnum.e3,2];
//   input Real b2.in1[MyEnum.e3,3];
//   input Real b2.in1[MyEnum.e3,4];
//   input Real b2.in1[MyEnum.e3,5];
//   input Real b2.in1[MyEnum.e4,1];
//   input Real b2.in1[MyEnum.e4,2];
//   input Real b2.in1[MyEnum.e4,3];
//   input Real b2.in1[MyEnum.e4,4];
//   input Real b2.in1[MyEnum.e4,5];
//   input Real b2.in1[MyEnum.e5,1];
//   input Real b2.in1[MyEnum.e5,2];
//   input Real b2.in1[MyEnum.e5,3];
//   input Real b2.in1[MyEnum.e5,4];
//   input Real b2.in1[MyEnum.e5,5];
//   input Real b2.in2[1,MyEnum.e1];
//   input Real b2.in2[1,MyEnum.e2];
//   input Real b2.in2[1,MyEnum.e3];
//   input Real b2.in2[1,MyEnum.e4];
//   input Real b2.in2[1,MyEnum.e5];
//   input Real b2.in2[2,MyEnum.e1];
//   input Real b2.in2[2,MyEnum.e2];
//   input Real b2.in2[2,MyEnum.e3];
//   input Real b2.in2[2,MyEnum.e4];
//   input Real b2.in2[2,MyEnum.e5];
//   input Real b2.in2[3,MyEnum.e1];
//   input Real b2.in2[3,MyEnum.e2];
//   input Real b2.in2[3,MyEnum.e3];
//   input Real b2.in2[3,MyEnum.e4];
//   input Real b2.in2[3,MyEnum.e5];
//   input Real b2.in2[4,MyEnum.e1];
//   input Real b2.in2[4,MyEnum.e2];
//   input Real b2.in2[4,MyEnum.e3];
//   input Real b2.in2[4,MyEnum.e4];
//   input Real b2.in2[4,MyEnum.e5];
//   input Real b2.in2[5,MyEnum.e1];
//   input Real b2.in2[5,MyEnum.e2];
//   input Real b2.in2[5,MyEnum.e3];
//   input Real b2.in2[5,MyEnum.e4];
//   input Real b2.in2[5,MyEnum.e5];
//   output Real b2.out1[1,MyEnum.e1];
//   output Real b2.out1[1,MyEnum.e2];
//   output Real b2.out1[1,MyEnum.e3];
//   output Real b2.out1[1,MyEnum.e4];
//   output Real b2.out1[1,MyEnum.e5];
//   output Real b2.out1[2,MyEnum.e1];
//   output Real b2.out1[2,MyEnum.e2];
//   output Real b2.out1[2,MyEnum.e3];
//   output Real b2.out1[2,MyEnum.e4];
//   output Real b2.out1[2,MyEnum.e5];
//   output Real b2.out1[3,MyEnum.e1];
//   output Real b2.out1[3,MyEnum.e2];
//   output Real b2.out1[3,MyEnum.e3];
//   output Real b2.out1[3,MyEnum.e4];
//   output Real b2.out1[3,MyEnum.e5];
//   output Real b2.out1[4,MyEnum.e1];
//   output Real b2.out1[4,MyEnum.e2];
//   output Real b2.out1[4,MyEnum.e3];
//   output Real b2.out1[4,MyEnum.e4];
//   output Real b2.out1[4,MyEnum.e5];
//   output Real b2.out1[5,MyEnum.e1];
//   output Real b2.out1[5,MyEnum.e2];
//   output Real b2.out1[5,MyEnum.e3];
//   output Real b2.out1[5,MyEnum.e4];
//   output Real b2.out1[5,MyEnum.e5];
//   output Real b2.out2[MyEnum.e1,1];
//   output Real b2.out2[MyEnum.e1,2];
//   output Real b2.out2[MyEnum.e1,3];
//   output Real b2.out2[MyEnum.e1,4];
//   output Real b2.out2[MyEnum.e1,5];
//   output Real b2.out2[MyEnum.e2,1];
//   output Real b2.out2[MyEnum.e2,2];
//   output Real b2.out2[MyEnum.e2,3];
//   output Real b2.out2[MyEnum.e2,4];
//   output Real b2.out2[MyEnum.e2,5];
//   output Real b2.out2[MyEnum.e3,1];
//   output Real b2.out2[MyEnum.e3,2];
//   output Real b2.out2[MyEnum.e3,3];
//   output Real b2.out2[MyEnum.e3,4];
//   output Real b2.out2[MyEnum.e3,5];
//   output Real b2.out2[MyEnum.e4,1];
//   output Real b2.out2[MyEnum.e4,2];
//   output Real b2.out2[MyEnum.e4,3];
//   output Real b2.out2[MyEnum.e4,4];
//   output Real b2.out2[MyEnum.e4,5];
//   output Real b2.out2[MyEnum.e5,1];
//   output Real b2.out2[MyEnum.e5,2];
//   output Real b2.out2[MyEnum.e5,3];
//   output Real b2.out2[MyEnum.e5,4];
//   output Real b2.out2[MyEnum.e5,5];
// equation
//   b2.in2[1,MyEnum.e1] + b1.out2[MyEnum.e1,1] = 0.0;
//   b2.in2[1,MyEnum.e2] + b1.out2[MyEnum.e1,2] = 0.0;
//   b2.in2[1,MyEnum.e3] + b1.out2[MyEnum.e1,3] = 0.0;
//   b2.in2[1,MyEnum.e4] + b1.out2[MyEnum.e1,4] = 0.0;
//   b2.in2[1,MyEnum.e5] + b1.out2[MyEnum.e1,5] = 0.0;
//   b2.in2[2,MyEnum.e1] + b1.out2[MyEnum.e2,1] = 0.0;
//   b2.in2[2,MyEnum.e2] + b1.out2[MyEnum.e2,2] = 0.0;
//   b2.in2[2,MyEnum.e3] + b1.out2[MyEnum.e2,3] = 0.0;
//   b2.in2[2,MyEnum.e4] + b1.out2[MyEnum.e2,4] = 0.0;
//   b2.in2[2,MyEnum.e5] + b1.out2[MyEnum.e2,5] = 0.0;
//   b2.in2[3,MyEnum.e1] + b1.out2[MyEnum.e3,1] = 0.0;
//   b2.in2[3,MyEnum.e2] + b1.out2[MyEnum.e3,2] = 0.0;
//   b2.in2[3,MyEnum.e3] + b1.out2[MyEnum.e3,3] = 0.0;
//   b2.in2[3,MyEnum.e4] + b1.out2[MyEnum.e3,4] = 0.0;
//   b2.in2[3,MyEnum.e5] + b1.out2[MyEnum.e3,5] = 0.0;
//   b2.in2[4,MyEnum.e1] + b1.out2[MyEnum.e4,1] = 0.0;
//   b2.in2[4,MyEnum.e2] + b1.out2[MyEnum.e4,2] = 0.0;
//   b2.in2[4,MyEnum.e3] + b1.out2[MyEnum.e4,3] = 0.0;
//   b2.in2[4,MyEnum.e4] + b1.out2[MyEnum.e4,4] = 0.0;
//   b2.in2[4,MyEnum.e5] + b1.out2[MyEnum.e4,5] = 0.0;
//   b2.in2[5,MyEnum.e1] + b1.out2[MyEnum.e5,1] = 0.0;
//   b2.in2[5,MyEnum.e2] + b1.out2[MyEnum.e5,2] = 0.0;
//   b2.in2[5,MyEnum.e3] + b1.out2[MyEnum.e5,3] = 0.0;
//   b2.in2[5,MyEnum.e4] + b1.out2[MyEnum.e5,4] = 0.0;
//   b2.in2[5,MyEnum.e5] + b1.out2[MyEnum.e5,5] = 0.0;
//   b1.out1[1,MyEnum.e1] = b2.in1[MyEnum.e1,1];
//   b1.out1[1,MyEnum.e2] = b2.in1[MyEnum.e1,2];
//   b1.out1[1,MyEnum.e3] = b2.in1[MyEnum.e1,3];
//   b1.out1[1,MyEnum.e4] = b2.in1[MyEnum.e1,4];
//   b1.out1[1,MyEnum.e5] = b2.in1[MyEnum.e1,5];
//   b1.out1[2,MyEnum.e1] = b2.in1[MyEnum.e2,1];
//   b1.out1[2,MyEnum.e2] = b2.in1[MyEnum.e2,2];
//   b1.out1[2,MyEnum.e3] = b2.in1[MyEnum.e2,3];
//   b1.out1[2,MyEnum.e4] = b2.in1[MyEnum.e2,4];
//   b1.out1[2,MyEnum.e5] = b2.in1[MyEnum.e2,5];
//   b1.out1[3,MyEnum.e1] = b2.in1[MyEnum.e3,1];
//   b1.out1[3,MyEnum.e2] = b2.in1[MyEnum.e3,2];
//   b1.out1[3,MyEnum.e3] = b2.in1[MyEnum.e3,3];
//   b1.out1[3,MyEnum.e4] = b2.in1[MyEnum.e3,4];
//   b1.out1[3,MyEnum.e5] = b2.in1[MyEnum.e3,5];
//   b1.out1[4,MyEnum.e1] = b2.in1[MyEnum.e4,1];
//   b1.out1[4,MyEnum.e2] = b2.in1[MyEnum.e4,2];
//   b1.out1[4,MyEnum.e3] = b2.in1[MyEnum.e4,3];
//   b1.out1[4,MyEnum.e4] = b2.in1[MyEnum.e4,4];
//   b1.out1[4,MyEnum.e5] = b2.in1[MyEnum.e4,5];
//   b1.out1[5,MyEnum.e1] = b2.in1[MyEnum.e5,1];
//   b1.out1[5,MyEnum.e2] = b2.in1[MyEnum.e5,2];
//   b1.out1[5,MyEnum.e3] = b2.in1[MyEnum.e5,3];
//   b1.out1[5,MyEnum.e4] = b2.in1[MyEnum.e5,4];
//   b1.out1[5,MyEnum.e5] = b2.in1[MyEnum.e5,5];
// end Test;
// endResult
