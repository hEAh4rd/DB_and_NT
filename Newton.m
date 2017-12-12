function [ X ] = Newton (X , F )
syms s1 s2;
S = [s1 s2];
epsilon = 10^(-5);

%����� ������� �� ��������� 
    %������� ����� 
    for k = 1:2 
        dF = diff(F([s1 s2]), S(k)); 
        Gradient(k) = dF; 
        for j = 1:2 
            H(k,j) = diff(dF, S(j)); 
        end
    end 
    
    %�������� ������� �����
    invH = inv(H);
    %������������ �������� ������� �����
    detH = det(invH);
    
    Hminus = matlabFunction(detH); %H^(-1)
    Grad = matlabFunction(Gradient); %�������� 
    dFf = matlabFunction(Gradient(1)); %����������� �� s1 
    dFs = matlabFunction(Gradient(2)); %����������� �� s2
    
    while (abs(dFf(X(1),X(2))) >= epsilon) && (abs(dFs(X(1),X(2))) >= epsilon) %������� ������ 
        X = X - Hminus(X(1),X(2)) * Grad(X(1),X(2)) %������� �� ��������� 
    end
end