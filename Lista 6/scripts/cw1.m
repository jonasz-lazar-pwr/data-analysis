% === cw1.m ===
% Jednoczynnikowa ANOVA – czas snu koali

% 1. Wczytanie danych
load('anova_data.mat'); % Zmienna 'koala' – kolumny = grupy

% 2. Sprawdzenie normalności (Shapiro-Wilk)
fprintf('\n--- Test normalności (Shapiro-Wilk) ---\n');
for i = 1:size(koala,2)
    grupa = koala(:,i);
    grupa = grupa(~isnan(grupa)); % usunięcie NaN
    [h, p] = swtest(grupa);
    % H = 0 → brak podstaw do odrzucenia hipotezy o normalności (OK)
    % H = 1 → odrzucamy hipotezę o normalności (nie-OK)
    fprintf('Grupa %d: H = %d, p = %.4f   %% H=0 ⇒ normalność; H=1 ⇒ brak normalności\n', i, h, p);
end

% 3. Sprawdzenie równości wariancji (Levene test)
% H₀: wariancje we wszystkich grupach są równe
% H₁: przynajmniej jedna grupa ma inną wariancję

group_labels = [];  % wektor etykiet grup (np. 1,1,1,...,2,2,2,...,3,3,...)
values = [];        % wektor wszystkich wartości z wszystkich grup

% Pętla po kolumnach macierzy 'koala' (każda kolumna = jedna grupa)
for i = 1:size(koala,2)
    grupa = koala(:,i);               % pobierz dane z i-tej grupy
    n = sum(~isnan(grupa));           % liczba niepustych (nie-NaN) wartości
    values = [values; grupa(1:n)];    % dołącz dane do ogólnego wektora
    group_labels = [group_labels; repmat(i, n, 1)]; % etykieta grupy powtórzona n razy
end

% Wykonanie testu Levene'a
[p_var, stats_var] = vartestn(values, group_labels, ...
    'TestType', 'LeveneAbsolute', ... % używamy wersji opartej na wartościach bezwzględnych
    'Display', 'off');                % wyłączamy wyświetlanie tabeli

% Wyświetlenie wyniku
fprintf('\n--- Test równości wariancji (Levene) ---\n');
fprintf('p = %.4f   %% p < 0.05 → odrzucamy H₀; p ≥ 0.05 → brak podstaw do odrzucenia H₀\n', p_var);

% 4. Jeżeli założenia spełnione → ANOVA
fprintf('\n--- Jednoczynnikowa analiza wariancji (ANOVA) ---\n');
[p_anova, tbl, stats] = anova1(koala);

% Interpretacja na podstawie p-value
alpha = 0.05;
fprintf('Wartość p: %.4f\n', p_anova);
if p_anova < alpha
    fprintf('Odrzucenie H₀ - istnieje istotna statystycznie różnica między grupami (p < %.2f).\n', alpha);
else
    fprintf('Brak podstaw do odrzucenia H₀ – średnie są statystycznie równe (p ≥ %.2f).\n', alpha);
end