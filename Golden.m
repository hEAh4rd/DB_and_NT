function [ x ] = Golden ( f ) 

    a = randn;
    b = -a;
    epsilon = 10^(-8); 
    G = (1 + 5 ^ (1/2)) / 2; %��������� �������� ������� 
    
    %������������ ������ �������� ������� �� ��������� 
    
    while abs( b - a ) >= epsilon %������� ������ 
        x1 = b - ( b - a ) / G;
        x2 = a + ( b - a ) / G;
        if f(x1) >= f(x2)
            a = x1;
        else
            b = x2;
        end
        x = ( a + b ) / 2;
    end
    
end