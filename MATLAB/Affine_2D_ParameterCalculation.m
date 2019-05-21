function Parameters = Affine_2D_ParameterCalculation(x_input,y_input,X_output,Y_output)
% Calculates parameters X=[a1;a2;a0;b1;b2;b0] in the following equation using least squares
%X=a1x+a2y+a0
%Y=b1x+b2y+b0
% x_input is a Nx1 matrix containing x coordinate of control points in the input space
% y_input is a Nx1 matrix containing y coordinate of control points in the input space
% x_output is a Nx1 matrix containing x coordinate of control points in the output space
% y_output is a Nx1 matrix containing y coordinate of control points in the output space 
NumberOfPoints = size(x_input,1);
A = zeros(2*NumberOfPoints,1); % Coefficient matrix in AX = L
L = zeros(2*NumberOfPoints,1); % Right-hand matrix in AX = L
    for i = 1:NumberOfPoints
        A(2*i-1,1:4) = [x_input(i,1) y_input(i,1) 1 0 0 0];
        A(2*i,1:4) = [0 0 0 x_input(i,1) y_input(i,1) 1];
        L(2*i-1,1) = X_output(i,1);
        L(2*i,1) = Y_output(i,1);
    end
X = (transpose(A)*A)\(transpose(A)*L); %X is a 6x1 column matrix where a1 = X(1,1), a2=X(2,1), a0 = X(3,1), b1 = X(4,1), b2=X(5,1), b0 = X(6,1)
Parameters = X;
end