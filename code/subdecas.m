% subdivision by t = 1/2
function [ud,ld] = subdecas(cpoly)
m = length(cpoly);
t = 1/2;
%disp(cpoly(1,:));
newX = subCorr(cpoly(1,:), t);
%disp(newX);
newY = subCorr(cpoly(2,:), t);
[~, l] = size(newX);
ud = zeros(2, m);
ld = zeros(2, m);
ud(1, :) = newX(1: m);
ud(2, :) = newY(1: m);
%disp(ud);
ld(1, :) = newX(m: l);
ld(2, :) = newY(m: l);
end

%
function [newC] = subCorr(c, t)
[~, m] = size(c);
%disp(m);
cm = 2*m-1;
newC = [];
newC(1) = c(1);
newC(cm) = c(m);
%disp(newC(cm));
%disp(c(end));
for j = 1:m-1
    bb = [];
    for i = 1:m-1-j+1
        bb(i) = (1-t)*c(i) + t*c(i+1);
        %disp(bb);
    end
    c = bb;
    newC(1+j) = bb(1);
    newC(cm-j) = bb(end);
    %disp(newC);
end
end

