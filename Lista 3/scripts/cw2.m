% === Ćwiczenie 2 ===
% Empiryczna dystrybuanta ze skalą logarytmiczną na osi X dla zbioru controlB

% Dane wejściowe (posortowane rosnąco)
controlB = [0.08, 0.10, 0.15, 0.17, 0.24, 0.34, 0.38, 0.42, 0.49, 0.50, ...
            0.70, 0.94, 0.95, 1.26, 1.37, 1.55, 1.75, 3.20, 6.98, 50.57];

n = length(controlB);  % Liczba obserwacji

% Obliczenie wartości empirycznej dystrybuanty (ECDF)
% Dla każdego x: F(x) = i/n, gdzie i = numer porządkowy wartości
F = (1:n) / n;

% Tworzenie wykresu ECDF w skali logarytmicznej
figure;
subplot(1,1,1);  % Jeden wykres

% Rysowanie wykresu schodkowego
stairs(controlB, F, 'LineWidth', 2); hold on;
plot(controlB, F, 'o', 'MarkerFaceColor', 'b');  % Punkty danych

% Zmiana skali osi X na logarytmiczną
set(gca, 'XScale', 'log');

% Opisy osi i tytuł wykresu
xlabel('Wartość zmiennej (skala logarytmiczna)');
ylabel('F(x) – Empiryczna dystrybuanta');
title('ECDF – skala logarytmiczna – Zbiór controlB');

grid on;