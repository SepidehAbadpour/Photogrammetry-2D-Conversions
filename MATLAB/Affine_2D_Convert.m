function OutPoint = Affine_2D_Convert(Parameters,InPoint)
% Gets affine parameters in the 1st argument as a 6x1 matrix [a1;a2;a0;b1;b2;b0]
% Gets x and y coordinates of a point in the input space as 2nd argument
% InPoint is a 1x2 matrix in the form [x,y]
% Calculates coordinates of the point in the output space with the following formulas
%X=a1x+a2y+a0
%Y=b1x+b2y+b0
% OutPoint is a 1x2 matrix in the form [X,Y]
a1 = Parameters(1,1);
a2 = Parameters(2,1);
a0 = Parameters(3,1);
b1 = Parameters(4,1);
b2 = Parameters(5,1);
b0 = Parameters(6,1);
x = InPoint(1,1);
y = InPoint(1,2);
X = a1 * x + a2 * y + a0;
Y = b1 * x + b2 * y + b0;
OutPoint = [X Y];
end