% m4_fun for numeric solver
% tao -- x(1), b_0,0 -- x(2) and p -- x(3)
% Pt -- x(4)  Ps -- x(5)  Ets -- x(6)   q -- x(7)

function F = m4_numeric_solver(x,N,lambda)
%**********************************
W = 32;
m = 6;
M = 5;

tao = 20/10^6;
Pt = 1 - (1-tao)^N;
Ts = 8964/10^6;
Tc = 8964/10^6;
b = 1 - (1-Pt)^N;
%************************************
F = [
        x(1) - x(2) * (1-x(3)^(m+1)) / (1-x(3));
%  x(1) - 2*x(7)*(1-b)*(1-2*x(3)) / 2*(1-b)*(1-2*x(3))*((1-x(7))*(1-x(3)) + x(7))+x(7)*(1-2*x(3))*(x(7)*(W-1)*(1-x(3))+(2^m*W-1)*x(3)^m)+W*x(7)*((1-x(3))*(2*x(3)-(2*x(3))^m)-(1-2*x(3))*(x(3)-x(3)^m));
        x(2) - 2 * (1-2*x(3)) * (1-x(3)) / (  W * ( 1 - (2*x(3)) ^ (M+1) ) * (1-x(3)) +...
        (1-2*x(3))*(1-x(3)^(M+1))  +  ...
        W * 2^M * x(3)^(M+1) * (1-2*x(3)) * (1-x(3)^(m-M))  + ...
        2 * (1-2*x(3)) * (1-x(3)) * (1/x(7) - 1) );
        
        x(3) - (1 - (1-x(1))^(N-1)) ;
      
        
        x(4) - (1 - (1 - x(1))^N);
        x(5) - N*x(1)*(1-x(1))^(N-1) / x(4);
        x(6) - (  (1-x(4))*tao +  x(4)*x(5)*Ts + x(4)*(1-x(5))*Tc );
        x(7) - (1 - exp(-lambda*x(6)) );       
      ];
end