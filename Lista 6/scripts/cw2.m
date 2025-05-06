% === cw2.m ===
% Jednoczynnikowa analiza wariancji – aktywność wombatów

% 1. Wczytanie danych
load('anova_data.mat');  % Zmienne: wombats, wombat_groups

% Ustawienie danych do formy wymaganej przez vartestn
wombats = wombats(:);          % dane jako kolumna
wombat_groups = wombat_groups(:);    % grupy jako kolumna

% 2. Sprawdzenie normalności dla każdej grupy (Shapiro-Wilk)
fprintf('\n--- Test normalności (Shapiro-Wilk) ---\n');
grupy = unique(wombat_groups);
for i = 1:length(grupy)
    dane = wombats(wombat_groups == grupy(i));
    [h, p] = swtest(dane);
    fprintf('Grupa %d: H = %d, p = %.4f   %% H=0 ⇒ normalność; H=1 ⇒ brak normalności\n', grupy(i), h, p);
end

% 3. Sprawdzenie równości wariancji (Levene test)
% H₀: wariancje we wszystkich grupach są równe
% H₁: przynajmniej jedna grupa ma inną wariancję

[p_levene, ~] = vartestn(wombats, wombat_groups, ...
    'TestType', 'LeveneAbsolute', 'Display', 'off');
fprintf('\n--- Test równości wariancji (Levene) ---\n');
fprintf('p = %.4f   %% p < 0.05 → odrzucamy H₀; p ≥ 0.05 → brak podstaw do odrzucenia H₀\n', p_levene);

% 4. Jednoczynnikowa analiza wariancji
fprintf('\n--- Jednoczynnikowa analiza wariancji (ANOVA) ---\n');
[p_anova, tbl, stats] = anova1(wombats, wombat_groups);

% Interpretacja
alpha = 0.05;
fprintf('Wartość p = %.4f\n', p_anova);
if p_anova < alpha
    fprintf('Odrzucenie H₀ – istnieje istotna statystycznie różnica między grupami (p < %.2f).\n', alpha);
else
    fprintf('Brak podstaw do odrzucenia H₀ – średnie są statystycznie równe (p ≥ %.2f).\n', alpha);
end

% 5. Post-hoc: różnice między poszczególnymi grupami
if p_anova < alpha
    fprintf('\n--- Testy post-hoc (porównania wielokrotne) ---\n');
    figure;  % nowe okno na multcompare
    [c,m] = multcompare(stats);
end