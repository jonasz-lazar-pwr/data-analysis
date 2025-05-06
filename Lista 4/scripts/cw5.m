% === cw5.m ===
% Test t-Studenta dla jednej próby: średni wzrost w grupie z godz. 13

% Dane: wzrosty studentów z grupy 13:00
data13 = [
    175.26, 177.8, 167.64, 160.02, 172.72, 177.8, 175.26, 170.18, ...
    157.48, 160.02, 193.04, 149.86, 157.48, 157.48, 190.5, 157.48, ...
    182.88, 160.02
];

% Założona średnia wzrostu do porównania
mu0 = 169.051;

% Test Shapiro-Wilka dla sprawdzenia normalności
[H_sw, p_sw] = swtest(data13);
fprintf('Shapiro-Wilk: H = %d, p = %.4f\n\n', H_sw, p_sw);

% H₀: Średni wzrost wynosi 169.051 (μ = 169.051)
% H₁: Średni wzrost jest różny od 169.051 (μ ≠ 169.051)
% --> test dwustronny

% Parametry testu
alpha = 0.05;
tail = 'both';

% Test t-Studenta dla jednej próby
[H, p, CI, STATS] = ttest(data13, mu0, alpha, tail);

% Wyświetlenie wyników
fprintf('--- Test t-Studenta (jedna próba) ---\n');
fprintf('H = %d\np = %.4f\nCI = [%.2f, %.2f]\nt = %.4f\ndf = %.0f\nsd = %.4f\n\n', ...
    H, p, CI(1), CI(2), STATS.tstat, STATS.df, STATS.sd);

% Interpretacja wyniku
if H == 1
    fprintf('Wniosek: Istnieją podstawy do odrzucenia H₀ – średni wzrost jest różny od %.3f.\n', mu0);
else
    fprintf('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnych różnic względem %.3f.\n', mu0);
end