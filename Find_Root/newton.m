%MSDM5004_Homework_01_1(2)newton
fun=@(x)exp(x+1)/2+2^(-x)/4+cos(x+1)-3;
x0=0.5;
[his,res,times] = Newton(fun,x0,10^(-10));
function [his,res,times] = Newton(f,x0,tol)
de = diff(sym(f));
x_prev = x0;
time = 0;
his = [];
    while 1
        time = time+1;
        x_next = x_prev-subs(sym(f),x_prev)/subs(de,x_prev);
        his = [his;x_next];
        err = abs(x_next-x_prev);
        if err<tol
            break
        end
        if (x_prev~=0) && (abs(x_next-x_prev)/abs(x_prev)<tol)
            break
        end
        f_next = subs(sym(f),x_next);
        if abs(f_next)<tol
            break
        end
        x_prev = x_next;
    end
times = time;
res = x_next;
end


    
    
    