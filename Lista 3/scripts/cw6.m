% === Ćwiczenie 6 ===
% Analiza normalności wzrostu kobiet i mężczyzn 
% dla testu Lillieforsa i Kołmogorowa-Smirnowa

% Wczytanie danych
data = readtable('pacjenci.csv');

% Wydzielenie danych według płci
kobiety = data.wzrost(strcmp(data.plec, 'K'));
mezczyzni = data.wzrost(strcmp(data.plec, 'M'));

% === Test Lillieforsa ===
% Modyfikacja testu K-S, uwzględniająca fakt, że μ i σ zostały oszacowane z próby
disp('=== Test Lillieforsa ===');

[H_lil_m, p_lil_m] = lillietest(mezczyzni);
fprintf('Mężczyźni: H = %d, p = %.4f\n', H_lil_m, p_lil_m);

[H_lil_k, p_lil_k] = lillietest(kobiety);
fprintf('Kobiety: H = %d, p = %.4f\n', H_lil_k, p_lil_k);


% === Test Kołmogorowa-Smirnowa ===
% Zakłada, że średnia i odchylenie standardowe populacji są znane z góry
disp(' ');
disp('=== Test Kołmogorowa-Smirnowa ===');

% === Mężczyźni ===
% Normalizacja: wyznaczenie normalnej dystrybuanty ze średniej i std
cdf_m = normcdf(mezczyzni, mean(mezczyzni), std(mezczyzni, 1));
% kstest: H=1 => odrzucamy H0, H=0 => brak podstaw do odrzucenia H0
[H_ks_m, p_ks_m] = kstest(mezczyzni, [mezczyzni, cdf_m]);

fprintf('Mężczyźni: H = %d, p = %.4f\n', H_ks_m, p_ks_m);

% === Kobiety ===
cdf_k = normcdf(kobiety, mean(kobiety), std(kobiety, 1));
[H_ks_k, p_ks_k] = kstest(kobiety, [kobiety, cdf_k]);

fprintf('Kobiety: H = %d, p = %.4f\n', H_ks_k, p_ks_k);
