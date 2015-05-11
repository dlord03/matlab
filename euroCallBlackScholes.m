function [ C, P ] = euroCallBlackScholes( S, K, r, sigma, tau )
% Input arguments: S = asset price at time t
%                  K = Strike price
%                  r = interest rate
%                  sigma = volatility
%                  tau = time to expiry (T-t) 
% Outputs: C = Call Value
%          P = Put Value

% First compute d_one and d_two
d1 = (log(S/K) + (r + 0.5 * sigma ^ 2) * (tau))/( sigma * sqrt(tau));
d2 = d1 - sigma * sqrt(tau);

% normcdf only available with MATLAB Statistics Toolbox
C = normcdf(d1, 0, 1) * S - normcdf(d2, 0, 1) * K * exp (-r * tau);
P = C + K * exp(-r * tau) - S;

end
