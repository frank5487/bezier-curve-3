function [dx, dy] = constructD(x, y)
    
    [N, ~] = size(x);
    dx = zeros(N+2, 1);
    dy = zeros(N+2, 1);
    A = zeros(N-2, N-2);
    bx = zeros(N-2, 1);
    by = zeros(N-2, 1);
    
    A(1, 1) = 4;
    A(1, 2) = 1;
    A(N-2, N-3) = 1;
    A(N-2, N-2) = 4;
    bx(1, 1) = 6*x(2) - x(1);
    bx(N-2, 1) = 6*x(N-1) - x(N);
    by(1, 1) = 6*y(2) - y(1);
    by(N-2, 1) = 6*y(N-1) - y(N);
    for i = 2:N-3
        bx(i) = 6*x(i+1);
        by(i) = 6*y(i+1);
        for j = i-1:i+1
            if j == i
                A(i, j) = 4;
            else
                A(i, j) = 1;
            end
        end
    end
    %disp(A);
    %disp(bx);
    %disp(by);
    
      dx(3: N, 1) = A\bx;
      dy(3: N, 1) = A\by;
      dx(1) = x(1);
      dy(1) = y(1);
      dx(N+2) = x(N);
      dy(N+2) = y(N);
      dx(2) = 2/3*x(1) + 1/3*dx(3);
      dy(2) = 2/3*y(1) + 1/3*dy(3);
      dx(N+1) = 1/3*dx(N) + 2/3*x(N);
      dy(N+1) = 1/3*dy(N) + 2/3*y(N);


end

