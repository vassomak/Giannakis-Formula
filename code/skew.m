% skewness
function y = skew(v)
m = mean(v);
s = std(v);
y = sum((v([1:2048])-m).^3)/(2047*s^3);

% or y = skewness(v)

end