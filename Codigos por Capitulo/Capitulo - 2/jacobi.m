function []=jacobi(A,b,x0,tol,Nmax,norma)

D=diag(diag(A));
L=-tril(A)+D;
U=-triu(A)+D;
inversa = inv(D);
T=inv(D)*(L+U);
vp = eig(T);
radio_espectral = max(abs(eig(T)));
C=inv(D)*b;
xant=x0;
E=1000;
cont=0;

%Ciclo
disp('n |     xn     |     En     ');
while E>tol && cont<Nmax       
    xact=T*xant+C;
    E=norm((xant-xact),norma);
    xant=xact;
    cont=cont+1;
    fprintf('%2d|%12.4f|%12.4f|%12.4f|%12.4f ',cont,xact)
    fprintf('|%12.4e\n',E)

end

end