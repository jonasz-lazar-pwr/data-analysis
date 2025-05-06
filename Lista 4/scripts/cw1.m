% === cw1.m ===
% Test t-Studenta dla niezależnych prób: temperatura ciała kobiet i mężczyzn

% Wczytanie danych
load('results/temperature_data.mat');

% Ustawienie parametrów testu
alpha = 0.05;                % Poziom istotności
tail = 'both';               % Test dwustronny
vartype_equal = 'equal';     % Założenie równości wariancji
vartype_unequal = 'unequal'; % Brak założenia równości wariancji

% Test t-Studenta przy założeniu równych wariancji
[H_eq, P_eq, CI_eq, STATS_eq] = ttest2(men, women, alpha, tail, vartype_equal);

% Test t-Studenta bez założenia równości wariancji
[H_uneq, P_uneq, CI_uneq, STATS_uneq] = ttest2(men, women, alpha, tail, vartype_unequal);

% Wyświetlenie wyników dla testu z równymi wariancjami
disp('--- Test z założeniem równych wariancji ---');
fprintf('H = %d\np = %.4f\nCI = [%.4f, %.4f]\nt = %.4f\ndf = %.1f\nsd = %.4f\n\n', ...
    H_eq, P_eq, CI_eq(1), CI_eq(2), STATS_eq.tstat, STATS_eq.df, STATS_eq.sd);

% Wyświetlenie wyników dla testu z nierównymi wariancjami
disp('--- Test bez założenia równych wariancji ---');
fprintf('H = %d\np = %.4f\nCI = [%.4f, %.4f]\nt = %.4f\ndf = %.4f\n\n', ...
    H_uneq, P_uneq, CI_uneq(1), CI_uneq(2), STATS_uneq.tstat, STATS_uneq.df);

% Wniosek: na przyjętym poziomie istotności możemy odrzucić hipotezę zerową 
% dla obu testów, że istotności wartości średnie są sobie równe.