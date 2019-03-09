function [ F ] = my_fast( S )
N = length (S);
seqN = 0:N-1;
b = dec2bin(seqN);
b_r = bitrevorder(b);
b_r_d = (bin2dec(b_r))';
J = N/2;
K = 1;
buffer = zeros (1, N);
newS  = b_r_d +1;
Temp = S;
S = Temp (newS);
while J>=1
if J<N/2
    Tmp = buffer;
    S = Tmp;
end
    I = 1;
    for j = 0:J-1
        T = 0;
        for k = 0:K-1
             buffer(I) = S(I) + S(K+I)*exp(-1i*2*pi*T/N);%temp;
             buffer(I+K) = S(I)-S(K+I)*exp(-1i*2*pi*T/N);%temp;
            I = I + 1;
            T = T + J;
        end
        I = I + K;
    end
    K = K*2;
    J = J/2;
end
F = buffer;
end

