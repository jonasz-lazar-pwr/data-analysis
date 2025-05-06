% === cw3.m ===
% Test Friedmana – wpływ kampanii reklamowej na sprzedaż batonu
% (proby zależne, bo te same sklepy, ale inne warunki)

% 1. Wczytanie danych z pliku CSV
data = readtable('sprzedaz_kwartalna.csv');
sprzedaz = data{:, 2:end};  % pomijamy kolumnę "Sklep"

% 2. Test Friedmana
% H₀: Mediany sprzedaży we wszystkich kwartałach są takie same
% H₁: Mediany sprzedaży w przynajmniej jednym kwartale różnią się
[p, tbl, stats] = friedman(sprzedaz, 1, 'off');

% 3. Wyświetlenie wyników
fprintf('\n--- Test Friedmana ---\n');
fprintf('p = %.5f\n', p);
if p < 0.05
    fprintf('Wniosek: Odrzucamy H₀ – istnieje istotna różnica między kwartałami.\n');
else
    fprintf('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnych różnic między kwartałami.\n');
end

% 4. Post-hoc: różnice między poszczególnymi grupami
fprintf('\n--- Porównania post-hoc (jeśli H₀ odrzucona) ---\n');
if p < 0.05
    figure;
    [c, m, h, gnames] = multcompare(stats);
end
