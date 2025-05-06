% === Ćwiczenie 9 ===
% Sprawdzenie normalności rozkładu pojemności kondensatorów

% Wczytanie danych z pliku CSV
data = readtable('kondensatory.csv');

% Wydzielenie zmiennej "pojemnosc"
pojemnosc = data.pojemnosc;

% === Test Shapiro-Wilka ===
alpha = 0.05;  % poziom istotności 5%
[H, pValue, W] = swtest(pojemnosc, alpha);

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
qqplot(pojemnosc);

% Opisy osi, tytuł wykresu
title('QQ-plot: pojemność kondensatorów (pF)');
xlabel('Teoretyczne kwantyle rozkładu normalnego');
ylabel('Obserwowane wartości (pojemność [pF])');
grid on;