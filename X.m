% construct x(k), v(k)
function [x,v] = X
v = exprnd(1, [1,2048]);
theta = [1 0.93 0.85 0.72 0.59 -0.1];
x = zeros(1, 2048);

for t = 1:2048
for i =1:6
if t-i+1>0
x(t) = x(t) + theta(i)*v(t-i+1);

end
end
end
end