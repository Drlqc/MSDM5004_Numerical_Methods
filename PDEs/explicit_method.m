%MSDM5004_Homework_03_2(2)explicit method
dx = 0.05;
dt = [0.0012,0.0013];
J = 20;
U0 = zeros(19,1);
for i=1:19
    if i*dx<=0.5
        U0(i)=2*i*dx;
    else
        U0(i)=2-2*i*dx;
    end
end
U = U0;
T1 = matrix(J,dx,dt(1));
T2 = matrix(J,dx,dt(2));
x = 0:20;

t = [0,1,25,50];
lab1 = ["t=0","t=dt","t=25dt","t=50dt"];
lab2 = [",dt=0.0012",",dt=0.0013"];
order = 0;
for k=1:2
    if k==1
        T=T1;
    else
        T=T2;
    end
    for i=1:4
        j=t(i);
        order=order+1;
        subplot(2,4,order);
        plot(x,loop(U0,T,j),x,fun(dt(k)*j))
        title(lab1(i)+lab2(k))
        xlabel('x')
        ylabel('u')
        legend({'numerical','analytical'},'Location','northeast')
    end
end

function U=loop(U0,T,j)
U = U0;
for i=1:j
    U=T*U;
end
U=[0;U;0];
end

    
function u=fun(t)
u = zeros(1,21);
dx=0.05;
for j=0:20
    a=0;
    for i=1:10000
        a=a+sin(i*pi*0.5)*8/(i*pi)^2*sin(i*pi*dx*j)*exp(-(i*pi)^2*t);
    end
    u(j+1)=a;
end
end
function T=matrix(J,dx,dt)
mu=dt/dx^2;
T = zeros(J-1,J-1);
for i=1:J-1
    if i==1
        T(i,i)=1-2*mu;
        T(i,i+1)=mu;
        continue
    end
    if i == J-1
        T(i,i)=1-2*mu;
        T(i,i-1)=mu;
        continue
    end
    T(i,i-1)=mu;
    T(i,i)=1-2*mu;
    T(i,i+1)=mu;
end   
end