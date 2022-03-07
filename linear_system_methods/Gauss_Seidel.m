%MSDM5004_Homework_02_3(1)Gauss-Seidel method
syms x1 x2 x3 x4
A = [4,1,-1,1;1,4,-1,-1;-1,-1,5,1;1,-1,1,3];
b = [-3;-2;5;2];
x0 = [0;0;0;0];
x = [x1;x2;x3;x4];
x = x0;
time = 0;
while 1
    time = time+1;
    pre = x;
    for i = 1:4
        m = 0;
        n = 0;
        for j = 1:(i-1)
            m = m-A(i,j)*x(j);
        end
        for j = (i+1):4
            n = n-A(i,j)*x(j);
        end
        x(i) = 1/A(i,i)*(m+n+b(i));
    end
    aft = x;
    if norm(aft-pre,inf) <= 10^(-3)
        break
    end
end

