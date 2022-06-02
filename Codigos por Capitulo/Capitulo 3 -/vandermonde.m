function [X,Y]=vandermonde()

X = input('Ingrese el valor de las x:');
Y = input('Ingrese el valor de las y:');

%Inicializaci�n
n=length(X);
A=zeros(n);

%Ciclo
for i=1:n
    A(:,i)=(X.^(n-i))';
end

%Entrega de resultados
Coef=A\Y';

disp('Los coeficientes del polinomio son: ')
disp(Coef)
puntos = linspace(X(1),X(end),1000);
cont=1;
y = [];
for i=puntos
    y(cont) = polyval(Coef',i);
    cont=cont +1;
end
plot(puntos,y)
grid on
end
