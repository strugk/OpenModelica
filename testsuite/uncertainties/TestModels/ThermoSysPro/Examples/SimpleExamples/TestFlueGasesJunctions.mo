within ThermoSysPro.Examples.SimpleExamples;
model TestFlueGasesJunctions
  ThermoSysPro.FlueGases.Junctions.Splitter2 splitter2 annotation(Placement(transformation(x=-10.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceQ sourceP(Q0=200) annotation(Placement(transformation(x=-90.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss annotation(Placement(transformation(x=-50.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  annotation(Diagram);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink sinkP annotation(Placement(transformation(x=90.0, y=90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkP sinkP1 annotation(Placement(transformation(x=90.0, y=10.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss1 annotation(Placement(transformation(x=50.0, y=90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss2 annotation(Placement(transformation(x=50.0, y=10.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=0) annotation(Placement(transformation(x=-30.0, y=70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.Junctions.Mixer2 mixer2_1 annotation(Placement(transformation(x=-10.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss3 annotation(Placement(transformation(x=30.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss4 annotation(Placement(transformation(x=-50.0, y=-30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss singularPressureLoss5 annotation(Placement(transformation(x=-50.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.BoundaryConditions.Source sourceP1 annotation(Placement(transformation(x=-90.0, y=-30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.BoundaryConditions.SourceP sourceP2 annotation(Placement(transformation(x=-90.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.FlueGases.BoundaryConditions.SinkQ sinkP2 annotation(Placement(transformation(x=70.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante1(k=0.5) annotation(Placement(transformation(x=-50.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
equation 
  connect(constante.y,splitter2.Ialpha1) annotation(Line(points={{-19,70},{-14,70},{-14,56},{-9,56}}));
  connect(constante1.y,mixer2_1.Ialpha1) annotation(Line(points={{-39,-50},{-28,-50},{-28,-44},{-17,-44}}));
  connect(sourceP.C,singularPressureLoss.C1) annotation(Line(points={{-80,50},{-60,50}}, color={0,0,0}, thickness=1.0));
  connect(singularPressureLoss.C2,splitter2.Ce) annotation(Line(points={{-40,50},{-20,50}}, color={0,0,0}, thickness=1.0));
  connect(splitter2.Cs1,singularPressureLoss1.C1) annotation(Line(points={{-6,60},{-6,90},{40,90}}, color={0,0,0}, thickness=1.0));
  connect(splitter2.Cs2,singularPressureLoss2.C1) annotation(Line(points={{-6,40},{-6,10},{40,10}}, color={0,0,0}, thickness=1.0));
  connect(singularPressureLoss1.C2,sinkP.C) annotation(Line(points={{60,90},{80.2,90}}, color={0,0,0}, thickness=1.0));
  connect(singularPressureLoss2.C2,sinkP1.C) annotation(Line(points={{60,10},{80.2,10}}, color={0,0,0}, thickness=1.0));
  connect(sourceP1.C,singularPressureLoss4.C1) annotation(Line(points={{-80,-30},{-60,-30}}, color={0,0,0}, thickness=1.0));
  connect(singularPressureLoss4.C2,mixer2_1.Ce1) annotation(Line(points={{-40,-30},{-14,-30},{-14,-40}}, color={0,0,0}, thickness=1.0));
  connect(mixer2_1.Ce2,singularPressureLoss5.C2) annotation(Line(points={{-14,-60},{-14,-70},{-40,-70}}, color={0,0,0}, thickness=1.0));
  connect(mixer2_1.Cs,singularPressureLoss3.C1) annotation(Line(points={{0,-50},{20,-50}}, color={0,0,0}, thickness=1.0));
  connect(singularPressureLoss3.C2,sinkP2.C) annotation(Line(points={{40,-50},{60.2,-50}}, color={0,0,0}, thickness=1.0));
  connect(sourceP2.C,singularPressureLoss5.C1) annotation(Line(points={{-80,-70},{-60,-70}}, color={0,0,0}, thickness=1.0));
end TestFlueGasesJunctions;
