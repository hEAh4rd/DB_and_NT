function [ Xans ] = Gradient ( F )

    X0 = randn(1, 2); %��������� ����������� � ����������
    epsilon = 10 ^ (-5); %��������� ����������� � ����������
    k = 0; %��������� ����������� � ����������

    syms s1 s2 L0;
    S = [s1 s2];
    for k = 1:2
     Grad(k) = diff(F(S), S(k)); %������� ����������� - ��������
    end

    Gradient = matlabFunction(Grad);
    anti = -Gradient(X0(1),X0(2)); %��������� ����������� (������������) 
    tmin = anti; 
    j = 0; 

    while norm(tmin) >= epsilon %������� ������
        while j <= k %�������� ������������ ������ ���������� ���������� �� ���������
            f = matlabFunction(F(X0 + L0 * anti));
            L = Golden(f); %����������� �������
            X = X0 + L * anti %����� ����� 
            w = ( norm(Gradient(X(1),X(2))) ^ 2 ) / ( norm(Gradient(X0(1),X0(2))) ^ 2 ); 
            anti = -Gradient(X(1),X(2)) + w * anti;  %����� ������������
            if norm(anti) < epsilon %������� ������
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

