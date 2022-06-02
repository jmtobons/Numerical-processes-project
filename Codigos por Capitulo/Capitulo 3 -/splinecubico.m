function [X,Y]=splinecubico()

X = input('Ingrese el valor de las x:');
Y = input('Ingrese el valor de las y:');

    close all
    n=length(X);
    m=4*(n-1);
    A=zeros(m); 
    b=zeros(m,1);
    Coef=zeros(n-1,4);
    
    %Ciclos
    %Condiciones de interpolaci�n
    for i=1:n-1
        A(i+1,4*i-3:4*i)=[X(i+1)^3 X(i+1)^2 X(i+1) 1];
        b(i+1)=Y(i+1);
    end
    A(1,1:4)=[X(1)^3 X(1)^2 X(1) 1];
    b(1)=Y(1);
    %Condiciones de continuidad
    for i=2:n-1
        A(n-1+i,4*i-7:4*i)=[X(i)^3 X(i)^2 X(i) 1 -X(i)^3 -X(i)^2 -X(i) -1];
        b(n-1+i)=0;
    end
    %Condiciones de suavidad
    for i=2:n-1
        A(2*n-3+i,4*i-7:4*i)=[3*X(i)^2 2*X(i) 1 0 -3*X(i)^2 -2*X(i) -1 0];
        b(2*n-3+i)=0;
    end
    %Condiciones de convavidad
    for i=2:n-1
        A(3*n-5+i,4*i-7:4*i)=[6*X(i) 2 0 0 -6*X(i) -2 0 0];
        b(n+5+i)=0;
    end
    %Condiciones de frontera
    A(m-1,1:2)=[6*X(1) 2]; 
    b(m-1)=0;
    A(m,m-3:m-2)=[6*X(end) 2];
    b(m)=0;
    
    %Entrega de resultados
    Saux=A\b;
    
    %Se organiza la matriz de salida
    for i=1:n-1
        Coef(i,:)=Saux(4*i-3:4*i);
    end
    %graficas
    disp('Los coeficientes del polinomio son: ')
    disp(Coef)
    c1= 1;
    c2 = 2;
    for j=1:length(Coef)
        puntos = linspace(X(c1),X(c2),1000);
        cont=1;
        y = [];
            for i=puntos
                y(cont) = polyval(Coef(j,:),i);
                cont=cont +1;
            end
        plot(puntos,y)
        grid on
        hold on
        c1 = c1+1;
        c2 = c2+1;
    end
    hold off
end
