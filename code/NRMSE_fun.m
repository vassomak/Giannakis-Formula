function NRMSE = NRMSE_fun(xest,x)

for k=1:2048
    a(k) = (xest(k) - x(k))*(xest(k) - x(k));
end
RMSE = sqrt(sum(a)/2048);
NRMSE = RMSE/(max(x)-min(x));

end