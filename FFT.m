Fs = 16;
T = 1/Fs;             % Sampling period       
L = 2^17;             % Length of a signal
k = 0:L-1;   %Samples
S = sin(2*pi*4*k*T)+sin(2*pi*2*k*T); % 4 Hz
% x_fft = zeros(0, L);
y =  fft (S);
z = my_fast(S);
%  Xm = xm(S);
m = max((abs(y-z))); %max absolute difference between built-in function and mine
figure (1);
stem (abs(z)); %my own function
figure (2); 
stem (abs(y)); %built-in function

