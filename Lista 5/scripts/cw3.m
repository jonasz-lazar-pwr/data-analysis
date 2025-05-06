% === cw3.m ===
% Test Wilcoxona (signrank) dla prób zależnych – wpływ zapylenia na masę nasion chmielu

% 1. Wczytanie danych z pliku
data = readtable('chmiel.csv');

zapyl = data.zapylona;
niezapyl = data.niezapyl;

% Wizualizacja: boxplot porównawczy i barplot różnic indywidualnych
figure;
subplot(1,2,1)
boxplot([zapyl, niezapyl], 'Labels', {'Zapylona', 'Niezapylona'});
title('Boxplot: Masa nasion (g/10g chmielu)');
ylabel('Masa nasion');

subplot(1,2,2)
roznice = zapyl - niezapyl;
bar(roznice);
yline(0, '--');
title('Różnice masy nasion (Zapylona - Niezapylona)');
xlabel('Roślina'); ylabel('Zmiana masy');

% Test Wilcoxona dla prób zależnych (dwustronny)
% H₀ : Mediana różnic = 0 (zapylenie nie miało wpływu)
% H₁ : Mediana różnic ≠ 0 (jest różnica - zapylenie miało wpływ na masę)

alpha = 0.05;
[p, h, stats] = signrank(zapyl, niezapyl, 'alpha', alpha);

% Wyświetlenie wyników
fprintf('--- Test Wilcoxona dla prób zależnych ---\n');
fprintf('H = %d\np = %.4f\nWartość statystyki = %.4f\n\n', h, p, stats.signedrank);

if h == 1
    disp('Wniosek: Odrzucamy H₀ – zapylenie ma istotny wpływ na masę nasion.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnego wpływu zapylenia.');
end