

function S = m4_main(N,lambda)

% x0 = [0; 0; 2/33   ; ; ; ]; 


x0 = [.05; .05; 0;    .9; .9; 8964/10^6; 0.1641];  


options = optimoptions('fsolve'); 
[x,fval] = fsolve(@(x)m4_numeric_solver(x,N,lambda),x0,options);  

%tao = x(1);
% Pt = 1 - (1-tao)^N;
%Ps = N*tao*(1-tao)^(N-1) / (1-(1-tao)^N);
L = 8184;
% sigma = 20;
% Ts = 8964;
% Tc = 8964;
Data = abs(x(4)) * x(5) * L;
% Time = (1-Pt)*sigma + Pt*Ps*Ts + Pt*(1-Ps)*Tc;
Time = x(6);


S = Data / Time;  

end