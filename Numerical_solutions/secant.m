%MSDM5004_Homework_01_1(2)secant
fun=@(x)exp(x+1)/2+2^(-x)/4+cos(x+1)-3;
x0=0.5;
x1=0.6;
[res,times] = Secant(fun,x0,x1,10^(-10));
function [res,times] = Secant(f,x0,x1,tol)
x_prev1 = x0;
x_prev2 = x1;
time = 0;
    while 1
        time = time+1;
        f_prev2 = subs(sym(f),x_prev2);
        f_prev1 = subs(sym(f),x_prev1);
        x_next = x_prev2-f_prev2*(x_prev2-x_prev1)/(f_prev2-f_prev1);
        err = abs(x_next-x_prev2);
        if err<tol
            break
        end
        if (x_prev2~=0) && (abs(x_next-x_prev2)/abs(x_prev2)<tol)
            break
        end
        f_next = subs(sym(f),x_next);
        if abs(f_next)<tol
            break
        end
        x_prev1 = x_prev2;
        x_prev2 = x_next;
    end
times = time;
res = x_next;
end