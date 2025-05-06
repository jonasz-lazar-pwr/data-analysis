% === cw_dodatkowe.m ===
% Porównanie data_2005 i data_2006

data_2005 = [0.17, 0.19, 0.13, 0.12, 0.15, 0.17, 0.14, 0.18, 0.19, 0.16, 0.17, 0.18, 0.12, 0.11, 0.25, 0.16, 0.15, 0.12];
data_2006 = [0.18, 0.18, 0.15, 0.12, 0.15, 0.16, 0.13, 0.17, 0.17, 0.17, 0.18, 0.2, 0.18, 0.12, 0.23, 0.17, 0.17, 0.18];

% Test Lillieforsa
[h_lillie_05, p_lillie_05] = lillietest(data_2005);
[h_lillie_06, p_lillie_06] = lillietest(data_2006);

% Wyniki
fprintf('\n--- Testy normalności ---\n');
fprintf('Lilliefors (2005):     H = %d, p = %.4f\n', h_lillie_05, p_lillie_05);
fprintf('Lilliefors (2006):     H = %d, p = %.4f\n', h_lillie_06, p_lillie_06);

% Test Wilcoxona (signedrank test) – dla prób zależnych
alpha = 0.05;
[p, h, stats] = signrank(data_2005, data_2006, 'alpha', alpha);

% Wyniki
fprintf('\n--- Test Wilcoxona dla prób zależnych ---\n');
fprintf('H = %d\np = %.4f\nStatystyka = %.4f\n', h, p, stats.signedrank);

if h == 1
    disp('Wniosek: Odrzucamy H₀ - istnieje istotna różnica między grupami.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnej różnicy między grupami.');
end