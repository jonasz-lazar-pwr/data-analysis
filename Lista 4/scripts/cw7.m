% === cw7.m ===
% Test Manna-Whitneya (U) – porównanie gestykulacji osób nerwowych i spokojnych

% Dane
nerwowi = [3, 3, 4, 5, 5];
spokojni = [4, 6, 7, 9, 9];

% Hipotezy:
% H₀: P(nerwowi > spokojni) = P(spokojni > nerwowi) → brak różnic
% H₁: P(nerwowi > spokojni) ≠ P(spokojni > nerwowi) → różnice w gestykulacji

% Test Manna-Whitneya – domyślnie dwustronny
mwwtest(nerwowi, spokojni);

disp('Wniosek: p_value < 0.05 => Istnieją podstawy do odrzucenia H₀');