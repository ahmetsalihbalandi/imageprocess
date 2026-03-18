clear all; clc;

A8 = [183 160  94 153 194 163 132 165;
      183 153 116 176 187 166 130 169;
      179 168 171 182 179 170 131 167;
      177 177 179 177 179 165 131 167;
      178 178 179 176 182 164 130 171;
      179 180 180 179 183 169 132 169;
      179 179 180 182 183 170 129 173;
      180 179 181 179 181 170 130 169];

figure; histogram(A8(:), 0:256);        % 0–255 aralığı
xlabel('Gri seviye'); ylabel('Frekans'); title('8×8 yamanın histogramı');

% İstenirse sütun (bar) grafiği gibi de çizilebilir:
vals = A8(:);
[uniq,~,idx] = unique(vals);
counts = accumarray(idx,1);
figure; bar(uniq, counts); xlabel('Değer'); ylabel('Adet');