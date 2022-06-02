%Newton: se ingresa el valor inicial (x0), la tolerancia del error (Tol) y el màximo nùmero de iteraciones (niter) 
% f = @(x) x/2*(1+3/5.76*sec(2/4.8*sqrt(x/400)))-300
function [] = newton(f,x0,Tol,niter)
        df=diff(f);
        c=0;
        fm(c+1) = eval(subs(f,x0));
        fe=fm(c+1);
        dfm = eval(subs(df,x0));
        dfe=dfm;
        E(c+1)=Tol+1;
        error=E(c+1);
        xn=x0;
        disp('n |     xn     |     fn     |     dfn     |   E ');
        while error>Tol 
            xn=x0-fe/dfe;
            fm(c+2)=eval(subs(f,xn));
            fe=fm(c+2);
            dfm=eval(subs(df,xn));
            dfe=dfm;
            E(c+2)=abs(xn-x0);
            error=E(c+2);
            fprintf('%2d|%12.4f|%12.4f|%12.4f|%12.4e \n',c,xn,eval(subs(f,xn)),eval(subs(df,xn)),abs(xn-x0))
            x0=xn;
            c=c+1;
        end
        if fe==0
           s=x0;
           n=c;
           fprintf('\n %f es raiz de f(x) \n',x0)

        elseif error<Tol
           s=x0;
           n=c;
           fprintf('\n %f es una aproximación de una raiz de f(x) con una tolerancia= %f \n',x0,Tol)

        elseif dfe==0
           s=x0;
           n=c;
           fprintf('\n %f es una posible raiz múltiple de f(x) \n',x0)
        else 
           s=x0;
           n=c;
           fprintf('\n Fracasó en %f iteraciones \n',niter) 
        end
        %graficas
        figure(1)
        puntos= linspace(-10000,10000);
        y = eval(subs(f,puntos));
        plot(puntos,y)
        
end