% === cw2.m ===
% Test znaków: czy zatrudnienie wpłynęło na czas czytania prasy

% 1. Wczytanie danych z pliku
data = readtable('czytelnictwo.csv');

przed = data.przed;
po = data.po;

% 2. Wizualizacja: boxplot porównawczy i barplot róźnic
figure;
subplot(1,2,1)
boxplot([przed, po], 'Labels', {'Przed', 'Po'});
title('Boxplot: Czas czytania prasy (min)');
ylabel('Czas (minuty)');

subplot(1,2,2)
roznice = przed - po;
bar(roznice);
yline(0, '--');
title('Różnice (Przed - Po)');
xlabel('Osoba'); ylabel('Zmiana czasu czytania');

% 3. Test Wilcoxona (dla prób zależnych, dwustronny)
% H₀: Mediana różnic = 0 (zatrudnienie nie miało wpływu)
% H₁: Mediana różnic ≠ 0 (jest różnica – dwustronny test)

alpha = 0.05;
[p, h, stats] = signtest(przed, po, 'alpha', alpha, 'tail', 'both');

% 4. Wyniki
fprintf('\n--- Test znaków (dwustronny) ---\n');
fprintf('h = %d (1 = odrzucamy H₀, 0 = brak podstaw)\n', h);
fprintf('p = %.4f\n', p);
fprintf('Liczba znaków dodatnich (przed > po): %d\n', stats.sign);

if h == 1
    disp('Wniosek: Odrzucamy H₀ – zatrudnienie wpływa na czas czytania prasy.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H₀ – brak istotnej zmieny po zatrudnieniu.');
end