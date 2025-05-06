% === cw5.m ===
% Dwuczynnikowa analiza wariancji – wpływ toksyn i zakładów na FEV (wydolność oddechowa)

% 1. Wczytanie danych
data = readmatrix('fev_dwuczynnikowa.csv');

% Macierz ma wymiary 12x9 → przekształć do postaci 12x3x3
% Wymiary: [pracownik, substancja (T1-T3), zakład (Z1-Z3)]
fev = reshape(data, 12, 3, 3); % 12 pracowników x 3 substancje x 3 zakłady

% Przekształcenie do wektora: wartości + etykiety czynników (substancja i zakład)
values = fev(:); % 12*3*3 = 108 obserwacji
n = 12; % liczba pracowników

% Tworzenie etykiet dla substancji i zakładów
[zaklad, substancja] = meshgrid(1:3, 1:3); % 3 substancje x 3 zakłady

% Powtórz te etykiety dla każdego pracownika
substancja_labels = repmat(substancja(:), n, 1); % 108x1
zaklad_labels = repmat(zaklad(:), n, 1);         % 108x1

% 2. Dwuczynnikowa analiza wariancji (2-way ANOVA)
% H₀_1: średnie FEV dla wszystkich substancji są równe
% H₀_2: średnie FEV dla wszystkich zakładów są równe
% H₀_3: brak interakcji między zakładem a substancją

fprintf('\n--- Dwuczynnikowa analiza wariancji (ANOVA2) ---\n');
[p, tbl, stats] = anovan(values, {substancja_labels, zaklad_labels}, ...
    'model', 'interaction', ...
    'varnames', {'Substancja', 'Zakład'});

% 3. Interpretacja wyników
alpha = 0.05;
hipotezy = {'H₀_1 (substancja)', 'H₀_2 (zakład)', 'H₀_3 (interakcja)'};

for i = 1:length(p)
    fprintf('%s: p = %.4f → ', hipotezy{i}, p(i));
    if p(i) < alpha
        fprintf('odrzucamy H₀\n');
    else
        fprintf('brak podstaw do odrzucenia H₀\n');
    end
end

% 4. Post-hoc: różnice między poszczególnymi grupami
multcompare(stats, 'Dimension', 1);
figure;
multcompare(stats, 'Dimension', 2);