% === cw4.m ===

% Założenie: nie można przeprowadzić testu t dla prób zależnych,
% ponieważ dane nie są sparowane – kobiety i mężczyźni to niezależne grupy.
% Zamiast tego używamy testu t dla prób niezależnych (ttest2).

% Test t-Studenta dla prób niezależnych: Salary5Year dla kobiet i mężczyzn

% Wczytanie danych z pliku CSV
opts = detectImportOptions('absolwenci.csv');
opts = setvartype(opts, {'Salary5Year', 'Salary20Year'}, 'double');
data = readtable('absolwenci.csv', opts);

% Wydzielenie danych dla kobiet i mężczyzn (Salary po 5 latach)
salary_f = data.Salary5Year(strcmp(data.Gender, 'F'));
salary_m = data.Salary5Year(strcmp(data.Gender, 'M'));

% Test Shapiro-Wilka dla normalności rozkładu
[h_f, p_f] = swtest(salary_f);
[h_m, p_m] = swtest(salary_m);

fprintf('Shapiro-Wilk dla kobiet:     H = %d, p = %.4f\n', h_f, p_f);
fprintf('Shapiro-Wilk dla mężczyzn:  H = %d, p = %.4f\n\n', h_m, p_m);

% H₀: Średnie zarobki kobiet i mężczyzn po 5 latach są takie same (μ₁ = μ₂)
% H₁: Średnie zarobki są różne (μ₁ ≠ μ₂)
% --> test dwustronny, brak założenia o kierunku różnicy

% Parametry testu
alpha = 0.05;
tail = 'both';
vartype = 'equal';  % przyjmujemy równość wariancji

% Test t-Studenta dla prób niezależnych
[H, P, CI, STATS] = ttest2(salary_f, salary_m, alpha, tail, vartype);

% Wyświetlenie wyników
fprintf('--- Test t-Studenta (Salary5Year: kobiety vs mężczyźni) ---\n');
fprintf('H = %d\np = %.4f\nCI = [%.2f, %.2f]\nt = %.4f\ndf = %.2f\n\n', ...
    H, P, CI(1), CI(2), STATS.tstat, STATS.df);

% Wniosek na podstawie wyniku testu
if H == 1
    disp('Wniosek: Istnieją podstawy do odrzucenia H₀ – zarobki różnią się istotnie.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnych różnic w zarobkach.');
end