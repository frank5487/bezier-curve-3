function [Bx, By] = constructCP(dx, dy, N)
Bx = zeros(N-2, 4);
By = zeros(N-2, 4);
for i = 1:N-2
    if i == 1
        Bx(i, 1) = dx(1, 1);
        By(i, 1) = dy(1, 1);
        Bx(i, 2) = dx(2, 1);
        By(i, 2) = dy(2, 1);
        Bx(i, 3) = 0.5*(dx(2,1) + dx(3, 1));
        By(i, 3) = 0.5*(dy(2,1) + dy(3, 1));
    elseif i == N-2
        Bx(i, 3) = dx(N, 1);
        Bx(i, 4) = dx(N+1, 1);
        By(i, 3) = dy(N, 1);
        By(i, 4) = dy(N+1, 1);
        Bx(i, 2) = 0.5*(dx(N, 1) + dx(N-1, 1));
        By(i, 2) = 0.5*(dy(N, 1) + dy(N-1, 1));
    else
        Bx(i, 2) = 2/3*dx(i+1, 1) + 1/3*dx(i+2, 1);
        By(i, 2) = 2/3*dy(i+1, 1) + 1/3*dy(i+2, 1);
        Bx(i, 3) = 1/3*dx(i+1, 1) + 2/3*dx(i+2, 1);
        By(i, 3) = 1/3*dy(i+1, 1) + 2/3*dy(i+2, 1);
    end
    %disp(Bx);
    %disp(By);
end


for i = 1:N-3
    Bx(i, 4) = 0.5*(Bx(i, 3) + Bx(i+1, 2));
    Bx(i+1, 1) = Bx(i, 4);
    By(i, 4) = 0.5*(By(i, 3) + By(i+1, 2));
    By(i+1, 1) = By(i, 4);
end

end
