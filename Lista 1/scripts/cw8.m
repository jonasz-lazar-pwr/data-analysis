
% Zmierzony czas montażu samochodu
times = [8.5, 7.6, 9.3, 5.5, 11.4, 6.9, 6.5, 12.9, 8.7, 4.8, ...
         4.2, 8.1, 6.5, 5.8, 6.7, 2.4, 11.1, 7.1, 8.8, 7.2];

% Rysowanie boxplota
subplot(2,1,1);
boxplot(times);
title('Boxplot - Czasy montażu');
ylabel('Czas montażu');
grid on;

% Obliczania
mean_time = mean(times);
median_time = median(times);
std_time = std(times);

% Wyświetlenie wyników
disp(['Średni czas montażu: ', num2str(mean_time)]);
disp(['Mediana: ', num2str(median_time)]);
disp(['Odchylenie standardowe: ', num2str(std_time)]);

% Rysowanie histogramu
N = 15; 
subplot(2,1,2);
histogram(times, N);
title('Histogram - Czasy montażu');
xlabel('Czas montażu');
ylabel('Liczba pomiarów');
grid on;