function[f,p0,p1,tol,N] = secante()   
% f = @(x) x/2*(1+3/5.76*sec(2/4.8*sqrt(x/400)))-300

f = input('Ingrese la función de entrada:');
p0=input('Ingrese el valor de la aproximación inicial:');
p1=input('Ingrese el valor de la aproximación final:');
tol=input('Ingrese el valor de la tolerancia:');
N=input('Ingrese el número de iteraciones:');

i = 0;   
q0 = f(p0);    %evaluacion
q1 = f(p1);
disp('n |     xn     |     fn     |   E ');
while i <= N
    p = p1 - (q1*((p1 - p0)/(q1 - q0)));               %metodo
    
    if  abs(p - p1) < tol                          %criterio de parada
        fprintf('\n La solucion es %f y converge dentro de %d iteraciones', double(p),i)
        %graficas
        figure(1)
        puntos= linspace(-10000,10000);
        y = eval(subs(f,puntos));
        plot(puntos,y)
        return
    end
    i = i + 1;
    fprintf('%2d|%12.4f|%12.4f|%12.4e \n',i,p,f(p),abs(p - p1))
    p0 = p1;             %actualizacion de parametros
    p1 = p;
    q0 = q1;
    q1 = f(p);
    
    
end
fprintf('\nLa solucion no converge dentro de %d iteraciones \n', N)
%graficas
figure(1)
puntos= linspace(-10000,10000);
y = eval(subs(f,puntos));
plot(puntos,y)

end 
