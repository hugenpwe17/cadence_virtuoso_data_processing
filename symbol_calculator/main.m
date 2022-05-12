clc

syms R1 R2 s C1 C2
par = @(a,b) 1/(1/a+1/b);
X1 = 1/(s*C1);
X2 = 1/(s*C2);
A2 = X2/(R2 + X2);
A1 = par(X1, (R2 + X2))/(R1 + par(X1, (R2 + X2)));

disp(A1*A2)
disp(simplify(A1*A2))