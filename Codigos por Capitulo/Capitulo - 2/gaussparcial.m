function []=gaussparcial(A,b) 

n=size(A,1);
M=[A b];
for i=1:n
    aux = i-1;
    x =strcat('Etapa ',num2str(aux));
    disp(x)
    disp(M);
    %Cambio de filas
    [aux0,aux]=max(abs(M(i+1:n,i)));
    if aux0>abs(M(i,i))
        aux2=M(i+aux,i:n+1);
        M(aux+i,i:n+1)=M(i,i:n+1);
        M(i,i:n+1)=aux2;
    end
    for j=i+1:n
        if M(j,i)~=0
           M(j,i:n+1)=M(j,i:n+1)-(M(j,i)/M(i,i))*M(i,i:n+1);
        end
    end
end

%Entrega de resultados
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
disp('La solucion del sistema es: ')
disp(x)
end