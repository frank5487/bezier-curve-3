function [lpoly2] = subdivstep(lpoly)
[~, m, l] = size(lpoly);
lpoly2 = zeros(2, m, 2*l);
for i = 1:l
    [ud, ld] = subdecas(lpoly(:,:,i));
    lpoly2(:,:,2*i-1) = ud;
    lpoly2(:,:,2*i) = ld;
end
end

