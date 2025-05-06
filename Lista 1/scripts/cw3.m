
% Generowanie próbki 300-elementowej z rozkładu normalnego
data = randn(300,1);

% Tworzenie wykresu "plot" dla próby
subplot(2,2,1);
plot(data);
title('Wykres próbki 300-elementowej');
xlabel('Indeks próbki');
ylabel('Wartość próbki');

% Tworzenie histogramu z 20 prostokątami
subplot(2,2,2);
histogram(data, 20);
title('Histogram z 20 przedziałami');
xlabel('Wartości');
ylabel('Liczność');

% Tworzenie histogramu z 100 prostokątami
subplot(2,2,3);
histogram(data, 100);
title('Histogram z 100 przedziałami');
xlabel('Wartości');
ylabel('Liczność');

% Tworzenie wykresu boxplot
subplot(2,2,4);
boxplot(data);
title('Wykres pudełkowy (boxplot)');
ylabel('Wartości');