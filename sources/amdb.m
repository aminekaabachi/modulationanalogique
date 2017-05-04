%% spécifications temporelles:
Fs = 20000;        
dt = 1/Fs;
BorneSup = 1;      
t = (0:dt:BorneSup-dt)';
N = size(t,1);
%% spécifications fréquencielles:
dF = Fs/N;               
f = -Fs/2:dF:Fs/2-dF;        
%% signal modulant
Fm = 10;  
Am = 8;
m = Am*cos(2*pi*Fm*t);
%% porteuse
Fp = 100;   
Ap = 0.1;
p = Ap*cos(2*pi*Fp*t);
%% signal modulé
k=1/20;
kk=1/2;

y=Ap*(abs(1+k*m));
yy=Ap*(abs(1+kk*m));
s=x.*(1+k*m);
ss=x.*(1+kk*m);

%% spectre de m(t)
Hm = fftshift(fft(m));
%% spectre de p(t)
Hp = fftshift(fft(p));
%% spectre de s(t)
Hs = fftshift(fft(s));
Hss = fftshift(fft(ss));

%% representation graphique
figure;

%{
subplot(2,2,1);
plot(t,m);
title('Signal modulant m(t)');
subplot(2,2,2);
plot(f,abs(Hm)/N, 'r');
xlim([-30 30])
title('Spectre de m(t)');
subplot(2,2,3);
plot(t,p);
xlim([-0 0.5])
title('Le signal porteur p(t)');
subplot(2,2,4);
plot(f,abs(Hp)/N, 'r');
xlim([-150 150])
title('Spectre de p(t)');
%}

subplot(2,2,1)
plot(t,s,'b',t,y,'r');
title('Le signal modulé s(t) avec m < 1');
subplot(2,2,2);
plot(f,abs(Hs)/N, 'r');
xlim([-150 150])
title('Spectre de s(t) avec m < 1'); 

subplot(2,2,3)
plot(t,ss,'b',t,yy,'r');
title('Le signal modulé s(t) avec m > 1 ');
subplot(2,2,4);
plot(f,abs(Hss)/N, 'r');
xlim([-150 150])
title('Spectre de s(t) avec m > 1'); 

print('mf1', '-dpng', '-r300');