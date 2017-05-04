%% spécifications temporelles:
Fs = 20000;        
dt = 1/Fs;
BorneSup = 1;      
t = (0:dt:BorneSup-dt)';
N = size(t,1);
%% spécifications fréquencielles:
dF = Fs/N;               
f = -Fs/2:dF:Fs/2-dF;     
Fc = 3000;

f1 = 100;
m1 = sin(2*pi*f1*t);
f2 = 200;
m2 = sin(2*pi*f2*t);

Cs = sin(2*pi*Fc*t);
Cc = cos(2*pi*Fc*t);

%%Modulation
Hm1 = fftshift(fft(m1));
Hm2 = fftshift(fft(m2));
s = x1.*Cs + x2.*Cc;
Hs = fftshift(fft(s));

%% representation graphique
figure;

subplot(3,2,1);
plot(t,m1);
title('Signal modulant m1(t)');
subplot(3,2,2);
plot(f,abs(Hm1)/N, 'r');
xlim([-300 300])
title('Spectre de m1(t)');
subplot(3,2,3);
plot(t,m1);
title('Signal modulant m2(t)');
subplot(3,2,4);
plot(f,abs(Hm2)/N, 'r');
xlim([-300 300])
title('Spectre de m2(t)');
subplot(3,2,5);
plot(t,s);
xlim([0 0.1])
title('Signal modulé s(t)');
subplot(3,2,6);
plot(f,abs(Hs)/N, 'r');
xlim([-4000 4000])
title('Spectre de s(t)');

print('qamm', '-dpng', '-r300');


%xlim([-20 300]);









%%Demodulation
demod_x1 = mod_wav.*Cs;
demod_x2 = mod_wav.*-Cc;

%%filter
fpass = 10; fstop = 500; N = 30;
b = firls(N,[0 fpass fstop Fs/2]/(Fs/2), [1 1 0 0], [1 1]);
filt_x1 = filter(b,1,demod_x1);
filt_x2 = filter(b,1,demod_x2);

