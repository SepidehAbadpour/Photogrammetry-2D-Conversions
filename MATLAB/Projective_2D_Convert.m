function OutPoint = Projective_2D_Convert(Parameters,InPoint)
% Gets projective parameters in the 1st argument as a 8x1 matrix [a1;b1;c1;a2;b2;c2;a0;b0]
% Gets x and y coordinates of a point in the input space as 2nd argument
% InPoint is a 1x2 matrix in the form [x,y]
% Calculates coordinates of the point in the output space with the following formulas
%X=(a1x+b1y+c1)/(a0x+b0y+1)
%Y=(a2x+b2y+c2)/(a0x+b0y+1)
% OutPoint is a 1x2 matrix in the form [X,Y]
a1 = Parameters(1,1);
b1 = Parameters(2,1);
c1 = Parameters(3,1);
a2 = Parameters(4,1);
b2 = Parameters(5,1);
c2 = Parameters(6,1);
a0 = Parameters(7,1);
b0 = Parameters(8,1);
x = InPoint(1,1);
y = InPoint(1,2);
X = (a1*x+b1*y+c1)/(a0*x+b0*y+1);
Y = (a2*x+b2*y+c2)/(a0*x+b0*y+1);
OutPoint = [X Y];
end