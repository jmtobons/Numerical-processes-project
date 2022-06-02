function [A,b]=elimina_gauss() 

A = input('Ingrese la matriz A:');
b = input('Ingrese el valor del vector b:');

n=size(A,1);
M=[A b];

for i=1:n
    aux = i-1;
    x =strcat('Etapa ',num2str(aux));
    disp(x)
    disp(M);
    for j=i+1:n
        if M(j,i)~=0
           M(j,i:n+1)=M(j,i:n+1)-(M(j,i)/M(i,i))*M(i,i:n+1);
        end  
    end
end
%sustitucion regresiva

%Inicialización
n=size(M,1);
x=zeros(n,1);

%Ciclo
x(n)=M(n,n+1)/M(n,n);
for i=n-1:-1:1
    aux=[1 x(i+1:n)'];
    aux1=[M(i,n+1) -M(i,i+1:n)];
    x(i)=dot(aux,aux1)/M(i,i);
end

disp('La solucion del sistema es: ');
disp(x);
end
