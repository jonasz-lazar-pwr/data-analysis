
N = 10000;  % Liczba próbek
x = 1;  % Początkowa wartość (seed)

% Generowanie ciągów pseudo-losowych
% Funkcja gen1 generuje liczby za pomocą algorytmu liniowego 
% z ustalonymi wartościami parametrów a, c i m.
y1 = gen1(x, N);

% Funkcja gen2 działa na podobnej zasadzie, ale z innymi parametrami.
y2 = gen2(x, N);

% Funkcja gen3 używa bardziej złożonych operacji mnożenia i modula.
y3 = gen3(x, N);

% Generowanie ciągu z rozkładu normalnego z zakresu (0,1)
y_randn = randn(N,1);

% Rysowanie histogramów
subplot(2,2,1);
histogram(y1, 20);
title('Histogram gen1');

subplot(2,2,2);
histogram(y2, 20);
title('Histogram gen2');

subplot(2,2,3);
histogram(y3, 20);
title('Histogram gen3');

subplot(2,2,4);
histogram(y_randn, 20);
title('Histogram randn');

% Obliczanie średnich i wariancji (rozproszenie danych wokół średniej)
mean_gen1 = mean(y1);
var_gen1 = var(y1);

mean_gen2 = mean(y2);
var_gen2 = var(y2);

mean_gen3 = mean(y3);
var_gen3 = var(y3);

mean_randn = mean(y_randn);
var_randn = var(y_randn);

% Wyświetlanie wyników
disp(['Średnia gen1: ', num2str(mean_gen1), ', Wariancja gen1: ', num2str(var_gen1)]);
disp(['Średnia gen2: ', num2str(mean_gen2), ', Wariancja gen2: ', num2str(var_gen2)]);
disp(['Średnia gen3: ', num2str(mean_gen3), ', Wariancja gen3: ', num2str(var_gen3)]);
disp(['Średnia randn: ', num2str(mean_randn), ', Wariancja randn: ', num2str(var_randn)]);