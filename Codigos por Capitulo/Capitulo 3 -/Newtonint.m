%Newtonint: Calcula los coeficienetes del polinomio de interpolación de
% grado n-1 para el conjunto de n datos (x,y), mediante el método de Newton
% con diferencias divididas.
function [nodos,fnodos] = Newtonint()

nodos = input('Ingrese el valor de las x:');
fnodos = input('Ingrese el valor de las y:');

    N=length(nodos)-1;
    M=zeros(N+1,N+2);
    M(:,1)=nodos;
    M(:,2)=fnodos;
    for i=2:N+1
        for j=i:N+1
        M(j,i+1)=(M(j,i) - M(j-1,i)) / (M(j,1)   - M(j-i+1,1)  );
        end
    end
    q=1;
    for i=2:N+1
    monomio=[1,  -nodos(i-2+1)];
    q=conv(q,monomio);
    end
    newton=[fnodos(1)];
    q=1;
    for i=2:N+1
    monomio=[1,  -nodos(i-2+1)];
    q=conv(q,monomio);
    newton=[0, newton] + M(i,i+1)*q;
    end
    % graficar
    disp('Los coeficientes del polinomio son: ')
    disp(newton)
    puntos = linspace(nodos(1),nodos(end),1000);
    cont=1;
    y = [];
    for i=puntos
        y(cont) = polyval(newton,i);
        cont=cont +1;
    end
    plot(puntos,y)
    grid on
end
