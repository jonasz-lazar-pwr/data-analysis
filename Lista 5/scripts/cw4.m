% === cw4.m ===
% Test Wilcoxona (signrank) dla prób zależnych – wpływ zatrudnienia na czas czytania prasy

% 1. Wczytanie danych z pliku
data = readtable('czytelnictwo.csv');

przed = data.przed;
po = data.po;

% 2. Wizualizacja: boxplot porównawczy i barplot róźnic
figure;
subplot(1,2,1)
boxplot([przed, po], 'Labels', {'Przed', 'Po'});
title('Boxplot: Czas czytania prasy (min)');
ylabel('Czas (minuty)');

subplot(1,2,2)
roznice = przed - po;
bar(roznice);
yline(0, '--');
title('Różnice (Przed - Po)');
xlabel('Osoba'); ylabel('Zmiana czasu czytania');

% 3. Test Wilcoxona (dla prób zależnych, dwustronny)
% H₀ : Mediana różnic = 0 → brak wpływu zatrudnienia
% H₁ : Mediana różnic ≠ 0 → zatrudnienie wpływa na czas czytania

alpha = 0.05;
[p, h, stats] = signrank(przed, po, 'alpha', alpha);

% 4. Wyniki
fprintf('--- Test Wilcoxona dla prób zależnych ---\n');
fprintf('H = %d\np = %.4f\nWartość statystyki = %.4f\n', h, p, stats.signedrank);
fprintf('p = %.4f\n\n', p);

if h == 1
    disp('Wniosek: Odrzucamy H₀ – zatrudnienie wpływa na czas czytania prasy.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnego wpływu zatrudnienia.');
end