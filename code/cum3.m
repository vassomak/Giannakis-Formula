function cmat = cum3(x,flag)
% x to sima
%flag: gia flag==1 pairnoume kai ta diagrammata twn cumulants

for k=-20:20
    
    cmat(:,k+20+1)=cumest(x,3,20,64,0,'unbiased',k);
end

if flag==1
[X,Y] = meshgrid(-20:20);
subplot 121
mesh(X, Y, cmat)
title('3^{rd} Order Cumulant (\itV \rm^{3} )')

subplot 122
contour(X, Y, cmat, 4)
title('3^{rd} Order Cumulant Peaks')

end
end