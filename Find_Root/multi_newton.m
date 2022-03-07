%MSDM5004_Homework_01_2nonlinear
syms x1 x2
f1 = 1+1/4*x1^2-x2^2+exp(x1/2)*cos(x2);
f2 = x1*x2+exp(x1/2)*sin(x2);

f = [f1;f2];
J = jacobian(f,[x1,x2]);

time = 0;
x0 = [-2;4];
his = x0.';
x_prev = x0;
while time<5
    time = time+1;
    x1 = x_prev(1);
    x2 = x_prev(2);
    x_next = x_prev-inv(eval(J))*eval(f);
    his = [his;x_next.'];
    x_prev = x_next;
end
    