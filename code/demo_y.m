snr = [30:-5:-5];
figure;
k=1:2048;
for i=1:8
y = awgn(x, snr(i), 'measured');
n = y - x; % the added noise
cmat = cum3(y,2);
[hest, hsub, hsup] = h_est(cmat);
if i>=5
    if i==5
        figure;

    end
    j=i-4;
    subplot(2,2,j)
else
subplot(2,2,i)
end
xest = x_est(x,v,hest,1);
yest = xest + n;
plot(k,y,'b',k,yest,'r')
NRMSE1(i) = NRMSE_fun(yest,y);

xsub = x_est(x,v,hsub,0);
ysub = xsub + n;
NRMSE2(i) = NRMSE_fun(ysub,y);

xsup = x_est(x,v,hsup,0);
ysup = xsup + n;
NRMSE3(i) = NRMSE_fun(ysup,y);

xlabel('k');
ylabel('Yest');
title(sprintf('Y estimated via hest with %d dB snr',snr(i)));
end
legend('original Y[k]', 'estimated Y[k]');

%ci = confidence interval
ci1 = [mean(NRMSE1)-1.96*std(NRMSE1)/sqrt(8), mean(NRMSE1)+1.96*std(NRMSE1)/sqrt(8)];
ci2 = [mean(NRMSE2)-1.96*std(NRMSE2)/sqrt(8), mean(NRMSE2)+1.96*std(NRMSE2)/sqrt(8)];
ci3 = [mean(NRMSE3)-1.96*std(NRMSE3)/sqrt(8), mean(NRMSE3)+1.96*std(NRMSE3)/sqrt(8)];

figure;
plot(snr,NRMSE1,snr,ones(size(snr))*ci1(1),'k--',snr,ones(size(snr))*ci1(2),'k--');
xlabel('SNR(dB)');
ylabel('NRMSE');
title('NRMSE estimated using hest');

figure;
plot(snr,NRMSE2,snr,ones(size(snr))*ci2(1),'k--',snr,ones(size(snr))*ci2(2),'k--');
xlabel('SNR(dB)');
ylabel('NRMSE');
title('NRMSE estimated using hsub');

figure;
plot(snr,NRMSE3,snr,ones(size(snr))*ci3(1),'k--',snr,ones(size(snr))*ci3(2),'k--');
xlabel('SNR(dB)');
ylabel('NRMSE');
title('NRMSE estimated using hsup');
