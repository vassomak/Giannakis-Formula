function [hest, hsub, hsup] = h_est(c)
q=5;
%h_est
for k=0:q
hest(1+k) = c(q+21,k+21)/c(q+21,21);
end

%h_sub
for k=0:q-2
hsub(1+k) = c(q-2+21,k+21)/c(q-2+21,21);
end


%h_sup
for k=0:q+3
hsup(1+k) = c(q+3+21,k+21)/c(q+3+21,21);
end
end
