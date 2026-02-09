clearvars; close all; clc;

cd 'C:\Users\acer\OneDrive\Belgeler\MATLAB\image_process\proje\pictures\All';

list = dir('*.jpg');
number_of_files = length(list);

for k = 1:number_of_files

    filename = list(k).name;
    I = imread(filename);

    %ANALİZ
    bulunan = strings(0);
    hata_sayisi = 0;

    if checkbottle(I)
        bottleMissing = true;
    else
        bottleMissing = false;

        % -------- Eksik dolum --------
        if checkBottleUnderfilled(I)
            bulunan(end+1) = " -> Şişe eksik dolum (underfilled)";
            hata_sayisi = hata_sayisi + 1;
        end

        % -------- Deforme / Aşırı dolum --------
        if checkBottleDeformed(I)
            bulunan(end+1) = " -> Şişe deforme (deformed)";
            hata_sayisi = hata_sayisi + 1;
        elseif checkBottleOverfilled(I)
            bulunan(end+1) = " -> Şişe aşırı dolum (overfilled)";
            hata_sayisi = hata_sayisi + 1;
        end

        % -------- Etiket --------
        if checkLabelMissing(I)
            bulunan(end+1) = " -> Etiket eksik (Label missing)";
            hata_sayisi = hata_sayisi + 1;
        else
            if checkLabelNotPrinted(I)
                bulunan(end+1) = " -> Etiket basılmamış (Label not printed)";
                hata_sayisi = hata_sayisi + 1;
            end
            if checkLabelNotStraight(I)
                bulunan(end+1) = " -> Etiket düzgün yapıştırılmamış (Label not straight)";
                hata_sayisi = hata_sayisi + 1;
            end
        end
        % -------- Kapak --------
        if checkCapMissing(I)
            bulunan(end+1) = " -> Kapak eksik (Bottlecap missing)";
            hata_sayisi = hata_sayisi + 1;
        end
    end

    figure('Name', filename, 'NumberTitle','off');
    imshow(I); title(filename, 'Interpreter','none');

    % --- Mesajları tek stringte birleştir
    if bottleMissing
        msg = "(Şişe bulunamadı)";
    elseif hata_sayisi == 0
        msg = "✓ Hiçbir kusur tespit edilmedi.";
    else
        msg = "Tespit edilenler:" + newline + join(bulunan, newline);
    end

% --- Ekranın sol üstüne sabit bir kutu koy (normalized: 0..1)
    annotation('textbox', [0.02 0.78 0.35 0.2], ... % [x y w h]
        'String', msg, ...
        'FitBoxToText','on', ...
        'BackgroundColor','black', ...
        'Color','white', ...
        'FontWeight','bold', ...
        'FontSize', 11, ...
        'EdgeColor','white', ...
        'LineWidth', 1);


    hold off;
end

cd ..;

%% YARDIMCI FONKSİYONLAR
function pct = siyahYuzdesi(BW)
    pct = 100 * (sum(BW(:)==0) / numel(BW));
end

function C = kirpma(A, x1, y1, x2, y2)
    % DİKKAT: MATLAB indexing A(row, col) yani A(y, x)
    [H,W,~] = size(A);

    x1 = max(1, min(W, x1)); x2 = max(1, min(W, x2));
    y1 = max(1, min(H, y1)); y2 = max(1, min(H, y2));

    if x2 < x1
        t=x1; x1=x2; x2=t;
    end
    if y2 < y1
        t=y1; y1=y2; y2=t;
    end

    C = A(y1:y2, x1:x2, :);
end

function BW = toBinCropped(G, x1, y1, x2, y2, thr)
    BW = imbinarize(kirpma(G, x1,y1,x2,y2), thr);
end

%% KUSURLAR
function missing = checkbottle(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 115,1, 240,280, 155/255);    % AYNI PARAMETRELER
    missing = siyahYuzdesi(BW) < 10;           % AYNI
end

function bottleUnderfilled = checkBottleUnderfilled(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 140,110, 225,160, 170/255);  % AYNI
    bottleUnderfilled = siyahYuzdesi(BW) < 10;       % AYNI
end

function bottleOverfilled = checkBottleOverfilled(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 145,110, 215,142, 160/255);  % AYNI
    bottleOverfilled = siyahYuzdesi(BW) > 45;        % AYNI
end

function capMissing = checkCapMissing(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 150,1, 230,60, 130/255);     % AYNI
    capMissing = siyahYuzdesi(BW) < 10;              % AYNI
end

function labelMissing = checkLabelMissing(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 115,175, 240,280, 55/255);   % AYNI
    labelMissing = siyahYuzdesi(BW) > 50;            % AYNI
end

function labelNotPrinted = checkLabelNotPrinted(I)
    G  = rgb2gray(I);
    BW = toBinCropped(G, 115,175, 240,280, 150/255);  % AYNI
    labelNotPrinted = siyahYuzdesi(BW) < 50;         % AYNI
end

function labelNotStraight = checkLabelNotStraight(I)
    G = rgb2gray(I);

    BW1 = toBinCropped(G, 110,180, 250,230, 50/256); % AYNI
    tRes = siyahYuzdesi(BW1) >= 13;                            % AYNI

    E = edge(kirpma(G, 110,170, 250,195), 'Canny');        % AYNI
    cc = bwconncomp(E);
    props = regionprops(cc,'BoundingBox');

    if isempty(props)
        maxW=0; maxH=0;
    else
        BB = vertcat(props.BoundingBox);
        maxW = max(BB(:,3));
        maxH = max(BB(:,4));
    end

    eRes = (maxW <= 100) || (maxH >= 14);                  % AYNI
    labelNotStraight = tRes && eRes;                       % AYNI
end

function bottleDeformed = checkBottleDeformed(I)
    crop = kirpma(I, 100,190, 260,280);                    % AYNI ROI (x,y)
    BWred = imbinarize(crop(:,:,1), 200/256);              % AYNI

    if siyahYuzdesi(BWred) > 80
        BW = imbinarize(rgb2gray(crop), 5/256);            % AYNI
        cc = bwconncomp(BW,4);                             % AYNI
    else
        cc = bwconncomp(BWred,4);                          % AYNI
    end

    props = regionprops(cc,'BoundingBox');
    if isempty(props)
        bottleDeformed = true;
        return;
    end

    BB = vertcat(props.BoundingBox);
    A  = BB(:,3).*BB(:,4);
    [maxA,idx] = max(A);

    w = BB(idx,3); h = BB(idx,4);

    bottleDeformed = ~((maxA>=9800 && maxA<=12000) && (w>=110  && w<=130) && (h>=80   && h<=100));
end



% 110 1   240 280  %% bottleMissing
% 140 110 225 160  %% underfilled
% 145 110 215 142  %% overfilled
% 150 1   230 60   %% cap
% 115 175 240 280  %% label missing/print
% 110 180 250 230  %% label straight case1
% 110 170 250 195  %% label straight case2
% 100 190 260 280  %% deformed