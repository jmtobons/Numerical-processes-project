function []=splinelineal(X,Y)
    close all
    n=length(X);
    m=2*(n-1);
    A=zeros(m); 
    b=zeros(m,1);
    Coef=zeros(n-1,2);
    %Ciclos
    %Condiciones de interpolaci�n
    for i=1:length(X)-1
        A(i+1,[2*i-1 2*i])=[X(i+1) 1];
        b(i+1)=Y(i+1);
    end
    A(1,[1 2])=[X(1) 1];
    b(1)=Y(1);
    %Condiciones de continuidad
    for i=2:length(X)-1
        A(length(X)-1+i,2*i-3:2*i)=[X(i) 1 -X(i) -1];
        b(length(X)-1+i)=0;
    end   
    
    %Entrega de resultados
    Saux=A\b;
    
    %Se organiza la matriz de salida
    for i=1:length(X)-1
        Coef(i,:)=Saux([2*i-1 2*i]);
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