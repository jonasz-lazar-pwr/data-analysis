% === Ćwiczenie 5 ===
% Analiza czasu przebywania pszczół na jabłoniach (Delikates i Renety)

% Wczytanie danych z pliku CSV
data = readtable('pszczoly.csv');

% Oddzielenie dwóch grup: Delikates i Renety
delikates = data.Delikates;
renety = data.Renety;

% Usunięcie braków danych (NaN)
delikates = delikates(~isnan(delikates));
renety = renety(~isnan(renety));

% === Test K-S – czy dane pochodzą z rozkładu normalnego ===

% Normalizacja: wyznaczenie dystrybuanty normalnej względem średniej i std
cdf_del = normcdf(delikates, mean(delikates), std(delikates,1));
cdf_ren = normcdf(renety, mean(renety), std(renety,1));

% kstest: H=1 => odrzucamy H0 (dane NIE są normalne), H=0 => brak podstaw do odrzucenia H0
[H_del, p_del] = kstest(delikates, [delikates, cdf_del]);
[H_ren, p_ren] = kstest(renety, [renety, cdf_ren]);

disp('=== Test K-S dla normalności rozkładu ===');
fprintf('Delikates: H = %d, p = %.4f\n', H_del, p_del);
fprintf('Renety:    H = %d, p = %.4f\n', H_ren, p_ren);

% Jeśli obie próbki mają rozkład normalny (H=0), można stosować t-test.
% Jeśli choć jedna próbka nie ma rozkładu normalnego, 
% to warto zastosować test nieparametryczny.

% Test K-S: porównanie czy obie próbki mają ten sam rozkład
[H_ks, p_ks, ksstat] = kstest2(delikates, renety);

disp(' ');
disp('=== Test K-S (porównanie rozkładów Delikates vs Renety) === ');
fprintf('H = %d, p = %.4f, statystyka D = %.4f\n', H_ks, p_ks, ksstat);

% Posortowanie danych
sortedDel = sort(delikates);
sortedRen = sort(renety);

% Obliczenie ECDF
F_del = (1:length(sortedDel)) / length(sortedDel);
F_ren = (1:length(sortedRen)) / length(sortedRen);

% Rysowanie wykresu schodkowego
figure;
subplot(1,1,1);
stairs(sortedDel, F_del, 'b-', 'LineWidth', 1); hold on;
stairs(sortedRen, F_ren, 'r-', 'LineWidth', 1);

% Dodanie punktów danych z mniejszym rozmiarem markerów
plot(sortedDel, F_del, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 2);
plot(sortedRen, F_ren, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 2);

% Opisy osi, legenda, tytuł wykresu
xlabel('Czas przebywania (s)');
ylabel('F(x) – Empiryczna dystrybuanta');
title('Porównanie dystrybuant – Delikates vs Renety');
legend('Delikates', 'Renety', 'Location', 'southeast');
grid on;