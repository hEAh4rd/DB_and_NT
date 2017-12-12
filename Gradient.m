function [ Xans ] = Gradient ( F )

    X0 = randn(1, 2); %начальные приближения и погрешнось
    epsilon = 10 ^ (-5); %начальные приближения и погрешнось
    k = 0; %начальные приближения и погрешнось

    syms s1 s2 L0;
    S = [s1 s2];
    for k = 1:2
     Grad(k) = diff(F(S), S(k)); %частные производные - градиент
    end

    Gradient = matlabFunction(Grad);
    anti = -Gradient(X0(1),X0(2)); %начальное направление (антиградиент) 
    tmin = anti; 
    j = 0; 

    while norm(tmin) >= epsilon %условие выхода
        while j <= k %алгоритм формализации метода сопряжённых градиентов из википедии
            f = matlabFunction(F(X0 + L0 * anti));
            L = Golden(f); %минимизация функции
            X = X0 + L * anti %новая точка 
            w = ( norm(Gradient(X(1),X(2))) ^ 2 ) / ( norm(Gradient(X0(1),X0(2))) ^ 2 ); 
            anti = -Gradient(X(1),X(2)) + w * anti;  %новый антиградиент
            if norm(anti) < epsilon %условие выхода
                Xans = X
                tmin = anti;
                j = k + 1;
            end
            X0 = X;
            j = j + 1;
        end
        k = k + 1;
        j = 0;
        anti = -Gradient(X(1),X(2));
    end
    
end

