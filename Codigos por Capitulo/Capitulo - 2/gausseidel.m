function [x,iter,err]=gausseidel(A,b,x0,tol,Nmax,norma)

D=diag(diag(A));
L=-tril(A)+D;
U=-triu(A)+D;
inversa = inv(D-L);
T=inv(D-L)*U;
val_p = eig(T);
radio_espectral = max(abs(eig(T)));
C=inv(D-L)*b;
xant=x0;
E=1000;
cont=0;
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