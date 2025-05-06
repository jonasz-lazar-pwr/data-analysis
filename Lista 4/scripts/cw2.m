% === cw2.m ===
% Test t-Studenta dla niezależnych prób: liczba gestów u osób nerwowych i spokojnych

% Dane
nerwowi = [3, 3, 4, 5, 5];
spokojni = [4, 6, 7, 9, 9];

% Test Shapiro-Wilka dla normalności rozkładu
[h_n, p_n] = swtest(nerwowi);
[h_s, p_s] = swtest(spokojni);

fprintf('Shapiro-Wilk dla "nerwowi":  H = %d, p = %.4f\n', h_n, p_n);
fprintf('Shapiro-Wilk dla "spokojni": H = %d, p = %.4f\n\n', h_s, p_s);

% Hipoteza zerowa (H₀): Średnia liczba gestów osób nerwowych jest równa średniej liczbie gestów osób spokojnych (μ₁ = μ₂)
% Hipoteza alternatywna (H₁): Osoby nerwowe wykonują więcej gestów niż osoby spokojne (μ₁ > μ₂)
% --> test prawostronny, ponieważ spodziewamy się większej średniej u osób nerwowych.

% Jeżeli obie grupy mają rozkład normalny, wykonujemy test t-Studenta
if h_n == 0 && h_s == 0
    alpha = 0.05;
    tail = 'right';  % hipoteza alternatywna: nerwowi > spokojni
    vartype = 'equal';

    [H, P, CI, STATS] = ttest2(nerwowi, spokojni, alpha, tail, vartype);

    fprintf('--- Test t-Studenta (jednostronny, right) ---\n');
    fprintf('H = %d\np = %.4f\nCI = [%.4f, %.4f]\nt = %.4f\ndf = %.1f\nsd = %.4f\n\n', ...
        H, P, CI(1), CI(2), STATS.tstat, STATS.df, STATS.sd);

    if H == 1
        fprintf('Wniosek: Odrzucamy H0. Osoby nerwowe wykonują istotnie więcej gestów.\n');
    else
        fprintf('Wniosek: Brak podstaw do odrzucenia H0.\n');
    end
end