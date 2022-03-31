%MSDM5004_Homework_03_3Crank_Nicolson method
dx = 0.05;
dt = [0.0012,0.0013,0.012];
t = [0,1,25,50];
J = 20;
x = 0:J;
U0 = zeros(19,1);
for i=1:19
    if i*dx<=0.5
        U0(i)=2*i*dx;
    else
        U0(i)=2-2*i*dx;
    end
end
lab1 = ["t=0","t=dt","t=25dt","t=50dt"];
lab2 = [",dt=0.0012",",dt=0.0013",",dt=0.012"];
order = 0;
for k=1:3
    for i=1:4
        A=matrix(J,dx,dt(k),1);
        B=matrix(J,dx,dt(k),-1);
        j=t(i);
        order=order+1;
        subplot(3,4,order);
        plot(x,Thomas(A,B,U0,j))
        title(lab1(i)+lab2(k))
        xlabel('x')
        ylabel('u')
    end
end

function U=Thomas(A,B,U0,j)
U=U0;
[L,R]=lu(A);
for i=1:j
    b=B*U;
    y = zeros(19,1);
    y(1)=b(1)/L(1,1);
    for m=2:19
        y(m)=(b(m)-L(m,m-1)*y(m-1))/L(m,m);
    end
    U(19)=y(19)/R(19,19);
    for m=18:-1:1
        U(m)=(y(m)-U(m+1)*R(m,m+1))/R(m,m);
    end
end
U=[0;U;0];
end
        

function T=matrix(J,dx,dt,sign)
mu=sign*dt/dx^2;
T = zeros(J-1,J-1);
for i=1:J-1
    if i==1
        T(i,i)=1+mu;
        T(i,i+1)=-mu/2;
        continue
    end
    if i == J-1
        T(i,i)=1+mu;
        T(i,i-1)=-mu/2;
        continue
    end
    T(i,i-1)=-mu/2;
    T(i,i)=1+mu;
    T(i,i+1)=-mu/2;
end   
end