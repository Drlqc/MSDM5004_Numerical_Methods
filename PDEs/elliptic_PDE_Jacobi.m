%MSDM5004_Homework_03_4Poisson_Jacobi
dx=1/2;
order=0;
A=zeros(9,9);
f = zeros(9,1);
for j=1:3
    for i=1:3
        order=order+1;
        A(order,order)=-4;
        f(order)=2*((-1+i*dx)^2+(-1+j*dx)^2-2);
        if j<3
            A(order,order+3)=1;
        end
        if j>1
            A(order,order-3)=1;
        end
        if i<3
            A(order,order+1)=1;
        end
        if i>1
            A(order,order-1)=1;
        end
    end
end
u0 = zeros(9,1);
u=u0;
time=0;
while 1
    time=time+1;
    pre=u;
    for i=1:9
        m=f(i);
        for j=1:9
            m=m-A(i,j)*u(j);
        end
        m=m+A(i,i)*u(i);
        u(i)=m/A(i,i);
    end
    aft=u;
    if norm(aft-pre) <= 10^(-5)
        break
    end
end
    
    
