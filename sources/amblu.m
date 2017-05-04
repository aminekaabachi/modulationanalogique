%% specifications temporelles:
Fs = 20000;        
dt = 1/Fs;
BorneSup = 1;      
t = (0:dt:BorneSup-dt)';
N = size(t,1);
%% specifications frequencielles:
dF = Fs/N;               
f = -Fs/2:dF:Fs/2-dF;        
%% signal modulant
Fm = 10;  
Am = 8;
m = Am*cos(2*pi*Fm*t);
mm = Am*sin(2*pi*Fm*t);
%% porteuse
Fp = 100;   
Ap = 0.1;
p = Ap*cos(2*pi*Fp*t);
pp = Ap*sin(2*pi*Fp*t);
%% signal module
s1 = m.*p;
s2 = mm.*pp;
%% spectre de s(t)
LSB = fftshift(fft(s1+s2));
USB = fftshift(fft(s1-s2));

%% representation graphique
figure;
subplot(4,1,1);
plot(t,m);
title('Signal modulant m(t)');
subplot(4,1,2);
plot(t,p);
xlim([-0 0.5])
title('Le signal porteur p(t)');
subplot(4,1,3);
plot(f,abs(LSB)/N, 'r');
xlim([-150 150])
title('AM-LSB');
subplot(4,1,4);
plot(f,abs(USB)/N, 'r');
xlim([-150 150])
title('AM-USB');
print('example', '-dpng', '-r300');
