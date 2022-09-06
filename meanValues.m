tic
clear all
snr = [30:-5:-5];
for j=1:50
    j
[x,v] = X;

for i=1:8
y = awgn(x, snr(i), 'measured');
n = y-x;
cmat = cum3(y,2);
[hest, hsub, hsup] = h_est(cmat);

xest = x_est(x,v,hest,0);
yest = xest + n;
NRMSE1(j,i) = NRMSE_fun(yest,y);

xsub = x_est(x,v,hsub,0);
ysub = xsub + n;
NRMSE2(j,i) = NRMSE_fun(ysub,y);

xsup = x_est(x,v,hsup,0);
ysup = xsup + n;
NRMSE3(j,i) = NRMSE_fun(ysup,y);
end
end

NRMSE1 = mean(NRMSE1);
NRMSE2 = mean(NRMSE2);
NRMSE3 = mean(NRMSE3);

figure;
boxplot([NRMSE1(:) NRMSE2(:) NRMSE3(:)],{'q', 'q-2', 'q+3'})
toc
