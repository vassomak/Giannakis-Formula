function  xest = x_est(x,v,h,flag)
% for flag=1 plots for x_estimated and x are provided

xest = conv(v, h, 'same');
k= 1:2048;
y1 = x(k);
y2= xest(k);

if flag==1
plot(k,y1,'blue',k,y2,'red');
end

end
