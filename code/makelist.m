function [x, y] = makelist(lpoly)
[~, m, l] = size(lpoly);
x = lpoly(1, :, 1);
y = lpoly(2, :, 1);
for i = 2:l
    x = [x, lpoly(1, 2:m, i)];
    y = [y, lpoly(2, 2:m, i)];
end
end

