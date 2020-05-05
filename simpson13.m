function I = simpson13(func,a,b,n)
% Application of simpson's 1/3 rule
% Simpson13: composite of simpson's 1/3 rule 
% I = simpson13(func,a,b,n):
%   composite trapezoidal rule
% Inputs:
%   func = function to be integrated
%   a,b = integration limits
%   n = number of segments (default = 100)
% Output:
%   I = integral estimate

%Created by: David Pelley
%9/22/2019

if nargin<3, error('At least 3 input arguments required'), end
if ~(b>a), error('Upper bound must be greater than lower'),end
if nargin<4||isempty(n) n = 100;
elseif mod(n,2) >0
    error('Number of Segments should be Multiple of 2')
end

x = a;
h = (b-a)/n;
m = n/2;
s = 0;
for i = 1:m
    s = s+func(x) +4*func(x+h) + func(x+2*h);
    x = x + 2 * h;
end
I = (b-a)*s/(3*n);
