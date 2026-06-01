I = imread('eight.tif');                       % Görüntüyü oku
subplot(1,3,1), imshow(I);                     % Orijinal görüntüyü göster

Isp = imnoise(I, 'salt & pepper', 0.03);       % Görüntüye %3 oranında tuz-biber gürültüsü ekle
subplot(1,3,2), imshow(Isp);                   % Tuz-biber gürültülü görüntüyü göster

Ig = imnoise(I, 'gaussian', 0.02);             % Görüntüye Gauss gürültüsü ekle
subplot(1,3,3), imshow(Ig);
k = ones(3,3) / 9;          % 3x3 boyutunda ortalama (mean) filtre çekirdeği oluştur
I_m = imfilter(I, k);       % Orijinal görüntüye ortalama filtre uygula
Isp_m = imfilter(Isp, k);   % Tuz-biber gürültülü görüntüye ortalama filtre uygula
Ig_m = imfilter(Ig, k);     % Gauss gürültülü görüntüye ortalama filtre uygula

subplot(1,3,1), imshow(I_m);    % Orijinal görüntü için filtre sonucu
subplot(1,3,2), imshow(Isp_m);  % Tuz-biber gürültüsü için filtre sonucu
subplot(1,3,3), imshow(Ig_m);   % Gauss gürültüsü için filtre sonucu

I_m = medfilt2(I, [3 3]);        % Orijinal görüntüye 3x3 boyutunda median filtre uygula
Isp_m = medfilt2(Isp, [3 3]);    % Tuz-biber gürültülü görüntüye median filtre uygula
Ig_m = medfilt2(Ig, [3 3]);      % Gauss gürültülü görüntüye median filtre uygula

subplot(1,3,1), imshow(I_m);     % Orijinal görüntü için sonuç
subplot(1,3,2), imshow(Isp_m);   % Tuz-biber gürültülü görüntü için sonuç
subplot(1,3,3), imshow(Ig_m); 