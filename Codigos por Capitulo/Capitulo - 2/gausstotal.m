function [A,b]=gausstotal() 

A = input('Ingrese la matriz A:');
b = input('Ingrese el valor del vector b:');

n=size(A,1);
M=[A b];
cambi=[];

for i=1:n
    aux = i-1;
    x =strcat('Etapa ',num2str(aux));
    disp(x)
    disp(M);
    [a,b]=find(abs(M(i:n,i:n))==max(max(abs(M(i:n,i:n)))));
    %Cambio de columna
    if b(1)+i-1~=i
        cambi=[cambi; i b(1)+i-1];
        aux2=M(:,b(1)+i-1);
        M(:,b(1)+i-1)=M(:,i);
        M(:,i)=aux2;
    end   
    %Cambio de filas
    if a(1)+i-1~=i
        aux2=M(i+a(1)-1,i:n+1);
        M(a(1)+i-1,i:n+1)=M(i,i:n+1);
        M(i,i:n+1)=aux2;
    end
    for j=i+1:n
        if M(j,i)~=0
           M(j,i:n+1)=M(j,i:n+1)-(M(j,i)/M(i,i))*M(i,i:n+1);
        end
    end
end

%Entrega de resultados

n=size(M,1);
x=zeros(n,1);

%Ciclo
x(n)=M(n,n+1)/M(n,n);
for i=n-1:-1:1
    aux=[1 x(i+1:n)'];
    aux1=[M(i,n+1) -M(i,i+1:n)];
    x(i)=dot(aux,aux1)/M(i,i);
end

%reordenamos el vector solución
for i=size(cambi,1):-1:1
    aux=x(cambi(i,1));
    x(cambi(i,1))=x(cambi(i,2));
    x(cambi(i,2))=aux;
end
disp('La solucion del sistema es: ')
disp(x)
end
