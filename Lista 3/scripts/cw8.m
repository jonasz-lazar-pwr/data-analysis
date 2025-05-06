% === Ćwiczenie 8 ===
% Sprawdzenie normalności rozkładu czasu zużycia żarówek

% Wczytanie danych z pliku CSV
data = readtable('zarowki.csv');

% Wydzielenie zmiennej "czas"
czas = data.czas;

% === Test Shapiro-Wilka ===
alpha = 0.1;  % poziom istotności 10%
[H, pValue, W] = swtest(czas, alpha);

disp('=== Test Shapiro-Wilka ===');
fprintf('Statystyka W = %.4f\n', W);
fprintf('p-value = %.4f\n', pValue);

if H == 1
    disp('Wniosek: Odrzucamy hipotezę H0 – dane NIE mają rozkładu normalnego.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H0 – dane mogą pochodzić z rozkładu normalnego.');
end

% === Wykres QQ-plot ===
figure;
subplot(1,1,1);
qqplot(czas);

% Opisy osi, tytuł wykresu
title('QQ-plot: czas zużycia się żarówek');
xlabel('Teoretyczne kwantyle rozkładu normalnego');
ylabel('Obserwowane wartości (czas)');
grid on;