
% Wczytanie pliku iris.data
% FileType text – wymusza odczyt jako pliku tekstowego
% Delimiter – oddzielamy kolumny przecinkiem
% Format – 4 kolumny liczbowe, ostatnia jako string
iris = readtable('iris.data', 'FileType', 'text', 'Delimiter', ',', ...
    'Format', '%f%f%f%f%s');

% Wczytanie pliku glass.data
glass = readtable('glass.data', 'FileType', 'text', 'Delimiter', ',');

% Liczba przedziałów histogramu
N = 20;

subplot(2,2,1);
histogram(iris{:,1}, N);
title('Iris - Sepal Length');
xlabel('Długość działki kielicha (cm)');
ylabel('Liczba próbek');

subplot(2,2,2);
histogram(iris{:,3}, N);
title('Iris - Petal Length');
xlabel('Długość płatka (cm)');
ylabel('Liczba próbek');

subplot(2,2,3);
histogram(glass{:,2}, N);
title('Glass - Refractive Index');
xlabel('Współczynnik załamania światła');
ylabel('Liczba próbek');

subplot(2,2,4);
histogram(glass{:,3}, N);
title('Glass - Sodium Content');
xlabel('Zawartość sodu (%)');
ylabel('Liczba próbek');