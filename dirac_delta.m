A = imread('baby.jpg');      % fotoğrafı oku
A = rgb2gray(A);                     % gri-tonlamaya dönüştür
figure; imshow(A)                    % gri-tonlama fotoğrafı göster
B = zeros(size(A));                  % aynı boyutta boş bir düzlem oluştur
for i = 1:size(A,1)                  % x-ekseni integrali
    for j = 1:size(A,2)              % y-ekseni integrali
        if i == 400 && j == 400      % seç
            B(i,j) = B(i,j) + A(i,j);% topla
        end
    end
end
figure; imshow(B)                    % sonuç görseli
S = sum(B, 'all')                    % integralin sonucu
