% === cw3.m ===
% Test t-Studenta: poziom rozbawienia osób <30 i >30

% Dane
mniej30 = [6, 7, 10, 9];
po30 = [5, 6, 2, 3];

% Test Shapiro-Wilka dla normalności
[H1, p1] = swtest(mniej30);
[H2, p2] = swtest(po30);

fprintf('Shapiro-Wilk dla "<30":  H = %d, p = %.4f\n', H1, p1);
fprintf('Shapiro-Wilk dla ">30":  H = %d, p = %.4f\n\n', H2, p2);

% H₀: Średnie poziomy rozbawienia są takie same w obu grupach (μ₁ = μ₂)
% H₁: Osoby <30 lat są bardziej rozbawione (μ₁ > μ₂)
% --> test prawostronny, ponieważ spodziewamy się większego poziomu rozbawienia u osób <30 lat.

% Jeżeli obie grupy mają rozkład normalny
alpha = 0.05;
tail = 'right';  % hipoteza alternatywna: <30lat > >30lat
vartype = 'equal';

[H, p, CI, STATS] = ttest2(mniej30, po30, alpha, tail, vartype);

fprintf('--- Test t-Studenta (jednostronny, right) ---\n');
fprintf('H = %d\np = %.4f\nCI = [%.4f, Inf]\nt = %.4f\ndf = %.1f\nsd = %.4f\n\n', ...
H, p, CI(1), STATS.tstat, STATS.df, STATS.sd);

if H == 1
    disp('Wniosek: Istnieją podstawy do odrzucenia H0 – osoby <30 są bardziej rozbawione.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H0 – brak istotnych różnic.');
end