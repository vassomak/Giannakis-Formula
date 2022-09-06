[x,v] = X;

%question 1
skewness = skew(v)

%question 2 
cmat = cum3(x,1); 

%questions 3-4
[hest, hsub, hsup] = h_est(cmat);

%question 5
figure;
xest = x_est(x,v,hest,1);
N1 = NRMSE_fun(xest,x);
title('X estimated Plot');
xlabel('k');
ylabel('Xest');
legend('original X[k]', 'estimated X[k]');

%question 6
figure;
xsub = x_est(x,v,hsub,1);
N2 = NRMSE_fun(xsub,x);
title('X sub-estimated Plot');
xlabel('k');
ylabel('Xsub');
legend('original X[k]', 'sub-estimated X[k]');

figure;
xsup = x_est(x,v,hsup,1);
N3 = NRMSE_fun(xsup,x);
title('X sup-estimated Plot');
xlabel('k');
ylabel('Xsup');
legend('original X[k]', 'sup-estimated X[k]');

NRMSE = [N1 N2 N3];
f = figure;
uit = uitable(f,'Data', NRMSE);
uit.RowName = {'NRMSE'};
uit.ColumnName = {'hest', 'hsub', 'hsup'};
