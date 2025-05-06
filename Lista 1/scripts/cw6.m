
% Parametry rozkładu normalnego N(μ,σ)
mikro = 3;     % Średnia
sigma = 7;     % Odchylenie standardowe

% Generowanie 10000 liczb losowych z rozkładu normalnego N(0,1)
% Mnożenie przez 7 skaluje odchylenie standardowe do wartości 7.
% Dodanie 3 przesuwa średnią do wartości 3.
data = mikro + sigma * randn(10000,1);

% Liczba przedziałów histogramu
N = 50;  

% Histogram danych
subplot(1,2,1);
histogram(data, N); 
title('Histogram rozkładu N(3,7)');
xlabel('Wartość');
ylabel('Prawdopodobieństwo');

% Obliczenie i narysowanie dystrybuanty (CDF)
subplot(1,2,2);
[f, x] = ecdf(data); % Empiryczna dystrybuanta
plot(x, f, 'b', 'LineWidth', 2); 
title('Dystrybuanta rozkładu N(3,7)');
xlabel('Wartość');
ylabel('Prawdopodobieństwo');