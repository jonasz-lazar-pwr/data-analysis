% === cw1.m ===
% Test znaków: czy dieta zmniejszyła wagę kobiet po 7 tygodniach

% 1. Dane – wagi 20 kobiet przed (w1) i po (w2) diecie
w1 = [88 69 86 59 57 82 94 93 64 91 86 59 91 60 57 92 70 88 70 85];
w2 = [73 68 75 54 53 84 84 86 66 84 78 58 91 57 59 88 71 84 64 85];

% 2. Wizualizacja: boxplot porównawczy i barplot róźnic
figure;
subplot(1,2,1)
boxplot([w1(:), w2(:)], 'Labels', {'Przed', 'Po'});
title('Boxplot: Waga przed i po diecie');
ylabel('Waga (kg)');

subplot(1,2,2)
diffs = w1 - w2;
bar(diffs)
title('Różnice wag (Przed - Po)');
xlabel('Kobieta'); ylabel('Zmiana wagi (kg)');
yline(0, '--');

% 3. Test znaków
% H₀: Mediana różnic = 0 (dieta nie działa)
% H₁: Mediana różnic > 0 (waga po diecie mniejsza)

alpha = 0.05;
[p, h, stats] = signtest(w1, w2, 'alpha', alpha, 'tail', 'right');

% 4. Wyniki
fprintf('\n--- Test znaków (jednostronny: waga po < waga przed) ---\n');
fprintf('h = %d (1 = odrzucamy H₀, 0 = brak podstaw)\n', h);
fprintf('p = %.4f\n', p);
fprintf('Liczba znaków dodatnich (waga spadła): %d\n', stats.sign);

if h == 1
    disp('Wniosek: Dieta miała istotny wpływ na spadek wagi (odrzucamy H₀).');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak dowodu na spadek wagi.');
end