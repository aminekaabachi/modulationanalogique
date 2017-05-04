Fc=1000; 
Fm=10;  
Fs = 20000;        
dt = 1/Fs;
BorneSup = 1;      
t = (0:dt:BorneSup-dt)';
N = size(t,1);
B = 10;
y=0;

for n=-30:30
    y=y+besselj(n, B).*cos( 2*pi*(Fc-n*Fm).*t);
end

N = size(t,1);
dF = Fs/N;               
f = -Fs/2:dF:Fs/2-dF;
H = fftshift(fft(y));
plot(f,abs(H)/N);
xlim([600 1400]);

print('spectre', '-dpng', '-r300');
