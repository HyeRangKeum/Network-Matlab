
% m4 main part
tic;
clear all;
N = 4;
S = [1:100];
lambda = 1:100;

for i = 1:100
    S(i) = m4_main(N,lambda(i))/10^6;    % only lambda
end

plot(S);
title('model 4: finite try & unsaturate-- throughput vs arrive rate');
xlabel('arrivate rate');
ylabel('usaturation throughput M bps');
grid on;
hold all;
toc;