% === cw5.m ===
% Test Wilcoxona (ranksum) dla prób niezależnych – wpływ stanu zdrowia na czas ćwiczenia

% 1. Wczytanie danych z pliku
data = readtable('koronografia.csv');
time = data.time;
group = data.group;

% 2. Podział na grupy
group1 = time(group == 1);  % osoby zdrowe
group2 = time(group == 2);  % osoby z problemami

% 3. Wizualizacja: boxplot porównawczy
figure;
boxplot([group1; group2], [ones(size(group1)); 2*ones(size(group2))], ...
    'Labels', {'Grupa 1 (zdrowi)', 'Grupa 2 (problemy zdrowotne)'});
title('Boxplot: Czas ćwiczenia vs stan zdrowia');
ylabel('Czas ćwiczenia (sekundy)');

% 4. Test Wilcoxona dla prób niezależnych (ranksum)
% H₀ : Mediana różnic = 0 → stan zdrowia nie ma wpływu na czas ćwiczenia
% H₁ : Mediana różnic ≠ 0 →  stan zdrowia ma wpływ

alpha = 0.1;  % poziom istotności = 1 - poziom ufności (0.9)
[p, h, stats] = ranksum(group1, group2, 'alpha', alpha);

% 5. Wyniki
fprintf('--- Test Wilcoxona (ranksum) dla prób niezależnych ---\n');
fprintf('H = %d\np = %.4f\n\n', h, p);

if h == 1
    disp('Wniosek: Odrzucamy H₀ – stan zdrowia wpływa na czas ćwiczenia.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnego wpływu stanu zdrowia.');
end