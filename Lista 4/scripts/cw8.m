% === cw8.m ===
% Test U Manna-Whitneya – porównanie wzrostu studentów z grupy 13 i 17

% Dane – wzrost studentów z dwóch grup
data13 = [
    175.26, 177.8, 167.64, 160.02, 172.72, 177.8, 175.26, 170.18, ...
    157.48, 160.02, 193.04, 149.86, 157.48, 157.48, 190.5, 157.48, ...
    182.88, 160.02
];

data17 = [
    172.72, 157.48, 170.18, 172.72, 175.26, 170.18, 154.94, 149.86, ...
    157.48, 154.94, 175.26, 167.64, 157.48, 157.48, 154.94, 177.8
];

% Hipotezy:
% H₀: P(data13 > data17) = P(data17 > data13) → brak różnic w rozkładzie wzrostu
% H₁: P(data13 > data17) ≠ P(data17 > data13) → różnice istnieją

% Wykonanie testu U Manna-Whitneya (dwustronny przy alpha = 0.05)
mwwtest(data13, data17);

disp('Wniosek: p_value > 0.05 => Nie mamy podstaw do odrzucenia H₀');