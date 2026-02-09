cd Normal\;
img = imread('normal-image001.jpg');
imshow(img);
title('Koordinat almak için tıklayın');
colormap(gray); % Eğer gri görüntü ise

hold on;

% 2 nokta seçmek için ginput kullan
[x, y] = ginput(2);

% Görüntü boyutlarını al
[rows, cols, ~] = size(img);

for i = 1:2
    % Koordinatları yuvarla ve sınırla
    xi = round(x(i));
    yi = round(y(i));
    
    xi = max(min(xi, cols), 1);
    yi = max(min(yi, rows), 1);
    
    % Piksel değerini al
    pixelValue = img(yi, xi, :);
    fprintf('Nokta %d: X = %.0f, Y = %.0f, Piksel Değeri = [%s]\n', ...
        i, xi, yi, num2str(pixelValue(:)'));
    
    % Noktayı resim üzerinde göster
    plot(xi, yi, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    text(xi+5, yi, ['P' num2str(i)], 'Color', 'red', 'FontSize', 12);
end

hold off;

cd ..;