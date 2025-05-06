% === Ćwiczenie 7 ===
% Sprawdzenie, czy zmienna "cukier" ma rozkład normalny

% Wczytanie danych z pliku
data = readtable('pacjenci.csv');

% Wydzielenie zmiennej "cukier"
cukier = data.cukier;

% === Test Shapiro-Wilka ===
alpha = 0.05; % poziom istotności
[H, pValue, W] = swtest(cukier, alpha);

disp('=== Test Shapiro-Wilka ===');
fprintf('Statystyka W = %.4f\n', W);
fprintf('p-value = %.4f\n', pValue);

if H == 1
    disp('Wniosek: Odrzucamy hipotezę H0 – dane NIE mają rozkładu normalnego.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H0 – dane mogą pochodzić z rozkładu normalnego.');
end

% Rysowanie wykresu QQ-plot
figure;
subplot(1,1,1);
qqplot(cukier);

% Opisy osi, tytuł wykresu
title('QQ-plot dla zmiennej: cukier');
xlabel('Teoretyczne kwantyle rozkładu normalnego');
ylabel('Obserwowane wartości zmiennej cukier');
grid on;