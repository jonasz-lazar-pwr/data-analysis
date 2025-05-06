% === Ćwiczenie 4 ===
% Analiza rozkładów wzrostu mężczyzn i kobiet z pliku pacjenci.csv

% Wczytanie danych z pliku
data = readtable('pacjenci.csv');

% Wyodrębnienie danych wzrostu według płci
men = data.wzrost(strcmp(data.plec, 'M'));
women = data.wzrost(strcmp(data.plec, 'K'));

% --- Test normalności rozkładu wzrostu (test Kołmogorowa-Smirnowa (K-S) ---
% Dla poprawności testu wyznaczamy CDF rozkładu normalnego dopasowanego do danych
cdf_m = normcdf(men, mean(men), std(men, 1));
cdf_w = normcdf(women, mean(women), std(women, 1));

% Uruchomienie testów normalności (pojedynczo dla obu prób)
[h_m, p_m, stat_m, cv_m] = kstest(men, [men, cdf_m]);
[h_w, p_w, stat_w, cv_w] = kstest(women, [women, cdf_w]);

% Wyświetlenie wyników testu normalności
disp('=== Test Kołmogorowa-Smirnowa dla normalności ===');
fprintf('Mężczyźni: h = %d, p = %.4f, D = %.4f, CV = %.4f\n', h_m, p_m, stat_m, cv_m);
fprintf('Kobiety:   h = %d, p = %.4f, D = %.4f, CV = %.4f\n', h_w, p_w, stat_w, cv_w);

% Interpretacja:
% D - Wartość statystyki D (KSSTAT)
% CV - Wartość krytyczna
% h = 0 → brak podstaw do odrzucenia H0 (czyli dane mogą pochodzić z rozkładu normalnego)
% h = 1 → odrzucamy H0 (czyli dane nie są z rozkładu normalnego)

% --- Test K-S dla dwóch prób (czy rozkłady mężczyzn i kobiet są takie same) ---
[h_k, p_k, ksstat] = kstest2(men, women);

disp(' ');
disp('=== Test Kołmogorowa-Smirnowa dla dwóch prób ===');
fprintf('h = %d, p = %.4f, KS statystyka = %.4f\n', h_k, p_k, ksstat);

% --- Wykres empirycznych dystrybuant (ECDF) ---
figure;
subplot(1,1,1);

cdfplot(men); hold on;
cdfplot(women);

% Opisy osi, legenda, tytuł wykresu
xlabel('Wzrost [cm]');
ylabel('F(x) – Empiryczna dystrybuanta');
legend('Mężczyźni', 'Kobiety', 'Location', 'best');
title('Porównanie dystrybuant wzrostu: Mężczyźni vs Kobiety');

grid on;