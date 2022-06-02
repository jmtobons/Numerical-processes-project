function []=Reglafalsa(f,a,b,tol,Nmax)

% f = @(x) x/2*(1+3/5.76*sec(2/4.8*sqrt(x/400)))-300

%Inicialización
fa=f(a);
fb=f(b);
pm=(fb*a-fa*b)/(fb-fa);
fpm=f(pm);
E=1000; 
cont=0;
disp('n |     xn     |     fn     |     E ');
%Ciclo
while E>tol && cont<Nmax
  if fa*fpm<0
     b=pm; 
  else
     a=pm;    
  end 
  p0=pm;
  pm=(f(b)*a-f(a)*b)/(f(b)-f(a));
  fpm=f(pm);
  E=abs(pm-p0);
  cont=cont+1;
  fprintf('%2d|%12.4f|%12.4f|%12.4e \n',cont,pm,fpm,E)
end
%graficas
figure(1)
puntos= linspace(-10000,10000);
y = eval(subs(f,puntos));
plot(puntos,y)
grid on
end