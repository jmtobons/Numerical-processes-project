%Bisección: se ingresa el valor inicial y final del intervalo (xi, xs), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 

function [] = Biseccion(f,xi,xs,Tol,niter)
    % f = @(x) x/2*(1+3/5.76*sec(2/4.8*sqrt(x/400)))-300
    fi=eval(subs(f,xi));
    fs=eval(subs(f,xs));
    if fi==0
        s=xi;
        E=0;
        fprintf('%f es raiz de f(x)',xi)
    elseif fs==0
        s=xs;
        E=0;
        fprintf('%f es raiz de f(x)',xs)
    elseif fs*fi<0
        c=0;
        xm=(xi+xs)/2;
        fm(c+1)=eval(subs(f,xm));
        fe=fm(c+1);
        E(c+1)=Tol+1;
        error=E(c+1);
        disp('n |     xn     |     fn     |     E ');
        while error>Tol && fe~=0 && c<niter
            if fi*fe<0
                xs=xm;
                fs=eval(subs(f,xs));
            else
                xi=xm;
                fi=eval(subs(f,xi));
            end
            xa=xm;
            xm=(xi+xs)/2;
            fm(c+2)=eval(subs(f,xm));
            fe=fm(c+2);
            E(c+2)=abs((xm-xa));
            error=E(c+2);
            c=c+1;
            fprintf('%2d|%12.4f|%12.4f|%12.4e \n',c,xm,eval(subs(f,xm)),abs((xm-xa)))
        end
        if fe==0
           s=xm;
           fprintf('\n %f es raiz de f(x)',xm) 
        elseif error<Tol
           s=xm;
           fprintf('\n %f es una aproximación de una raiz de f(x) con una tolerancia= %f',xm,Tol)
        else 
           s=xm;
           fprintf('\n Fracasó en %f iteraciones',niter) 
        end
    else
       fprintf('El intervalo es inadecuado')         
    end    
%graficas
figure(1)
puntos= linspace(-10000,10000);
y = eval(subs(f,puntos));
plot(puntos,y)
grid on
end