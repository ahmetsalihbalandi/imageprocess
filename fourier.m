% Fourier Serisinin Tanımlanması.
% Periyot
T = 1;
t = linspace(0, T, 1000); % Zaman vektörü

% Sinyal tanımı
f = cos(2*pi*t) + sin(4*pi*t);

% Fourier katsayılarının hesaplama (Karmaşık Fourier serisi)
N = 10; % Harmonik sayısı
n_zeros = zeros(1, 2*N+1); % Karmaşık Fourier katsayıları
n_vals = -N:N; % Frekanslar (n)

for n = -N:N
  c_n(n+N+1) = (1/T) * trapz(t, f .* exp(-1i*2*pi*n*t/T));
end

% Reel sinüs ve kosinüs bileşenlerinin hesaplama
a_n = zeros(1, N+1);
b_n = zeros(1, N);
a_n(1) = (1/T) * trapz(t, f); % DC bileşeni

for n = 1:N
  a_n(n+1) = (2/T) * trapz(t, f .* cos(2*pi*n*t/T));
  b_n(n) = (2/T) * trapz(t, f .* sin(2*pi*n*t/T));
end

% Rekonstrüksiyon (Yeniden İnşa)
f_reel = a_n(1)/2; % DC bileşeni
f_complex = zeros(size(t)); % Karmaşık Fourier serisi

for n = 1:N
  f_reel = f_reel + a_n(n+1)*cos(2*pi*n*t/T) + b_n(n)*sin(2*pi*n*t/T);
end

for n = -N:N
  f_complex = f_complex + c_n(n+N+1)*exp(1i*2*pi*n*t/T);
end

% Grafikleri çizme
figure;

% Orijinal sinyal
subplot(3, 1, 1);
plot(t, f, 'k', 'LineWidth', 1.5);
title('Orijinal Sinyal');
xlabel('t');
ylabel('f(t)');

% Reel Fourier serisiyle yeniden inşa edilen sinyal
subplot(3, 1, 2);
plot(t, real(f_reel), 'b', 'LineWidth', 1.5);
title('Reel Fourier Serisi ile Yeniden İnşa');
xlabel('t');
ylabel('f_{reel}(t)');

% Karmaşık Fourier serisiyle yeniden inşa edilen sinyal
subplot(3, 1, 3);
plot(t, real(f_complex), 'r', 'LineWidth', 1.5);
title('Karmaşık Fourier Serisi ile Yeniden İnşa');
xlabel('t');
ylabel('f_{complex}(t)');

% Karmaşık katsayıların büyüklüğünü gösterme
figure;
stem(n_vals, abs(c_n), 'filled');
title('Karmaşık Fourier Katsayıları (|c_n|)');
xlabel('Harmonik n');
ylabel('|c_n|');
grid on;