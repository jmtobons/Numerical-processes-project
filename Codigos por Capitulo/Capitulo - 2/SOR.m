%SOR: Calcula la solución del sistema
%Ax=b con base en una condición inicial x0,mediante el método Gauss Seidel (relajado), depende del valor de w 
%entre (0,2)

function [x0,A,b,Tol,niter,w,norma] = SOR()

x0 = input('Ingrese el valor de la aproximación inicial:');
A = input('Ingrese la matriz A:');
b = input('Ingrese el valor del vector b:');
Tol = input('Ingrese el valor de la tolerancia:');
niter = input('Ingrese el número de iteraciones:');
w = input('Ingrese el valor del factor de relajación:');
norma = input('Ingrese la norma:');

    c=0;
    error=Tol+1;
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,+1);
    disp('n |     xn     |     En     ');
    while error>Tol && c<niter

        T=inv(D-w*L)*((1-w)*D+w*U);
        C=w*inv(D-w*L)*b;
        x1=T*x0+C;
        E(c+1)=norm(x1-x0,norma);
        error=E(c+1);
        fprintf('%2d|%12.4f|%12.4f|%12.4f|%12.4f ',c,x1)
        fprintf('|%12.4e\n',E(c+1))
        x0=x1;
        c=c+1;

    end
    if error < Tol
        s=x0;
        n=c;
        fprintf('es una aproximación de la solución del sistmea con una tolerancia= %f',Tol)
    else 
        s=x0;
        n=c;
        fprintf('Fracasó en %f iteraciones',niter) 
    end
end
