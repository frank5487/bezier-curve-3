function [lpoly] = itersubdiv(cpoly, n)
[~, m, l] = size(cpoly);
lpoly = zeros(2, m, l);
for i = 1:n
    lpoly = subdivstep(cpoly);
    cpoly = lpoly;
end
end

