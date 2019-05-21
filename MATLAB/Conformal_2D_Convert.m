function OutPoint = Conformal_2D_Convert(Parameters,InPoint)
% Gets conformal parameters in the 1st argument as a 4x1 matrix [a1;b1;a0;b0]
% Gets x and y coordinates of a point in the input space as 2nd argument
% InPoint is a 1x2 matrix in the form [x,y]
% Calculates coordinates of the point in the output space with the following formulas
% X=a1x+b1y+a0
% Y=-b1x+a1y+b0
% OutPoint is a 1x2 matrix in the form [X,Y]
a1 = Parameters(1,1);
b1 = Parameters(2,1);
a0 = Parameters(3,1);
b0 = Parameters(4,1);
x = InPoint(1,1);
y = InPoint(1,2);
X = a1 * x + b1 * y + a0;
Y = -b1 * x + a1 * y + b0;
OutPoint = [X Y];
end