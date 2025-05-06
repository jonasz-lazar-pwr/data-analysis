% === cw6.m ===
% Test t-Studenta: czy średni wzrost w grupie z godziny 17 wynosi 164.1475

% Dane – wzrosty studentów z grupy z godziny 17
data17 = [
    172.72, 157.48, 170.18, 172.72, 175.26, 170.18, 154.94, 149.86, ...
    157.48, 154.94, 175.26, 167.64, 157.48, 157.48, 154.94, 177.8
];

% Hipoteza zerowa: μ = 164.1475
mu_0 = 164.1475;

% Test Shapiro-Wilka dla normalności rozkładu
[H_norm, p_norm] = swtest(data17);
fprintf('Shapiro-Wilk: H = %d, p = %.4f\n\n', H_norm, p_norm);

% Test Shapiro-Wilka wykazał brak normalności rozkładu (H = 1),
% co oznacza, że test t-Studenta może nie być w pełni wiarygodny.

% H₀: Średni wzrost wynosi 164.1475 (μ = 164.1475)
% H₁: Średni wzrost jest różny od 164.1475 (μ ≠ 164.1475)
% --> test dwustronny

% Test t-Studenta dla jednej próby
alpha = 0.05;
tail = 'both';

[H, p, CI, STATS] = ttest(data17, mu_0, alpha, tail);

fprintf('--- Test t-Studenta (jedna próba) ---\n');
fprintf('H = %d\np = %.4f\nCI = [%.2f, %.2f]\nt = %.4f\ndf = %d\nsd = %.4f\n\n', ...
    H, p, CI(1), CI(2), STATS.tstat, STATS.df, STATS.sd);

if H == 1
    disp('Wniosek: Istnieją podstawy do odrzucenia H₀ – średni wzrost jest różny od 164.1475.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnych różnic względem 164.1475.');
end