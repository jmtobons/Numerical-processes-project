function []=puntofijo(f,g,x0,tol,Nmax)
% f = @(x) x/2*(1+3/5.76*sec(2/4.8*sqrt(x/400)))-300
% g = @(x) 2*(300/(1+3/5.76*sec(2/4.8*sqrt(x/400))))

xant=x0;
E=1000; 
cont=0;

%Ciclo
disp('n |     xn     |     fn     |     gn     |   E ');
while E>tol && cont<Nmax
  xact=g(xant);
  E=abs(xact-xant);
  cont=cont+1;
  xant=xact;
  fprintf('%2d|%12.4f|%12.4f|%12.4f|%12.4e \n',cont,xact,f(xact),g(xact),E)
end

%graficas
figure(1)
puntos= linspace(-10000,10000);
y = eval(subs(f,puntos));
z = eval(subs(g,puntos));
plot(puntos,y,puntos,z)
end