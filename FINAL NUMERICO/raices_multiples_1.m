function []=raices_multiples_1(f,x0,tol,Nmax)
syms x
df = diff(f);
d2f = diff(df);
xant=x0;
fant=eval(subs(f,x,xant));
E=10000; 
cont=0;
disp('n |     xn     |     fn     |     dfn     |     d2fn     |   E ');
while E>tol && cont<Nmax
  xact=xant-fant*eval(subs(df,x,xant))/((eval(subs(df,x,xant)))^2-fant*eval(subs(d2f,x,xant)));
  fact=eval(subs(f,x,xact));
  E=(abs(xact-xant));
  cont=cont+1;
  fprintf('%2d|%12.4f|%12.4f|%12.4f|%12.4f|%12.4e \n',cont,xact,eval(subs(f,xact)),eval(subs(df,x,xact)),eval(subs(d2f,x,xact)),E)
  xant=xact;
  fant=fact;
end

% graficas
figure(1)
puntos= linspace(-10000,10000);
y = eval(subs(f,puntos));
dy = eval(subs(df,puntos));
d2y = eval(subs(d2f,puntos));
plot(puntos,y,puntos,dy,puntos,d2y)
grid on
end 