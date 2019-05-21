function Parameters = Projective_2D_ParameterCalculation(x_input,y_input,X_output,Y_output)
% Calculates parameters X=[a1;b1;c1;a2;b2;c2;a0;b0] in the following equation using least squares
%X=(a1x+b1y+c1)/(a0x+b0y+1)
%Y=(a2x+b2y+c2)/(a0x+b0y+1)
% x_input is a Nx1 matrix containing x coordinate of control points in the input space
% y_input is a Nx1 matrix containing y coordinate of control points in the input space
% x_output is a Nx1 matrix containing x coordinate of control points in the output space
% y_output is a Nx1 matrix containing y coordinate of control points in the output space 
NumberOfPoints = size(x_input,1);
A = zeros(2*NumberOfPoints,8); % Coefficient matrix in AX = L
L = zeros(2*NumberOfPoints,1); % Right-hand matrix in AX = L
    for i = 1:NumberOfPoints
        A(2*i-1,1:8) = [x_input(i,1) y_input(i,1) 1 0 0 0 -x_input(i,1)*X_output(i,1) -y_input(i,1)*X_output(i,1)];
        A(2*i,1:8) = [0 0 0 x_input(i,1) y_input(i,1) 1 -x_input(i,1)*Y_output(i,1) -y_input(i,1)*Y_output(i,1)];
        L(2*i-1,1) = X_output(i,1);
        L(2*i,1) = Y_output(i,1);
    end
X = (transpose(A)*A)\(transpose(A)*L); %X is a 8x1 column matrix where a1 = X(1,1), b1=X(2,1), C1 = X(3,1), a2 = X(4,1), b2=X(5,1), C2 = X(3,1), a0 = X(7,1), b0=X(8,1)
Parameters = X;
end