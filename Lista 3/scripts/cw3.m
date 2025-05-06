% === Ćwiczenie 3 ===
% Empiryczna dystrybuanta dla zbiorów controlA i treatmentA

% Dane wejściowe
controlA = [0.22, -0.87, -2.39, -1.79, 0.37, -1.54, 1.28, -0.31, -0.74, 1.72, ...
            0.38, -0.17, -0.62, -1.10, 0.30, 0.15, 2.30, 0.19, -0.50, -0.09];

treatmentA = [-5.13, -2.19, -2.43, -3.83, 0.50, -3.25, 4.32, 1.63, 5.18, -0.43, ...
              7.11, 4.87, -3.10, -5.81, 3.76, 6.31, 2.58, 0.07, 5.76, 3.50];

% Posortowanie danych
sortedControl = sort(controlA);
sortedTreatment = sort(treatmentA);

% Liczności prób
nC = length(controlA);
nT = length(treatmentA);

% Obliczenie ECDF
F_control = (1:nC) / nC;
F_treatment = (1:nT) / nT;

% Tworzenie wspólnego wykresu empirycznych dystrybuant
figure;
subplot(1,1,1);

% Rysowanie wykresu schodkowego
stairs(sortedControl, F_control, 'b-', 'LineWidth', 2); hold on;
stairs(sortedTreatment, F_treatment, 'r-', 'LineWidth', 2);

% Dodanie punktów danych
plot(sortedControl, F_control, 'bo', 'MarkerFaceColor', 'b');
plot(sortedTreatment, F_treatment, 'ro', 'MarkerFaceColor', 'r');

% Opisy osi, legenda, tytuł wykresu
xlabel('Wartość zmiennej');
ylabel('F(x) – Empiryczna dystrybuanta');
title('Porównanie dystrybuant – grupa controlA vs. treatmentA');
legend('controlA', 'treatmentA', 'Location', 'southeast');

grid on;

% === Test Kołmogorowa-Smirnowa (K-S) dla dwóch prób ===

% α - poziom istotności testu statystycznego — czyli granica, 
% według której podejmujemy decyzję o odrzuceniu hipotezy zerowej.

% Przeprowadzenie testu
[H, pValue, KSSTAT] = kstest2(controlA, treatmentA);

% Wyświetlenie wyników
disp(' ');
disp('=== Test Kołmogorowa-Smirnowa dla dwóch prób ===');
disp(['H: ', num2str(H)]);
disp(['Wartość statystyki D (KSSTAT): ', num2str(KSSTAT)]);
disp(['p-wartość: ', num2str(pValue)]);

if H == 1
    disp('Odrzucamy hipotezę zerową – rozkłady są statystycznie różne.');
else
    disp('Brak podstaw do odrzucenia hipotezy – rozkłady mogą być takie same.');
end