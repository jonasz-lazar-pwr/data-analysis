% Dane z próby (czas oczekiwania na przesyłkę w dniach)
data = [1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 6, 6, 6, 7, 7];

% Parametry testu
mu = 3;  % Średnia populacji (μ)
n = length(data);  % Liczność próby
x_bar = mean(data); % Średnia próby (x̄)
sigma = std(data); % Odchylenie standardowe próby

% Obliczenie statystyki testowej t
t_value = (x_bar - mu) / (sigma / sqrt(n));

% Obliczenie p-wartości dla testu t-Studenta (dwustronnego)
p_value = 2 * (1 - tcdf(abs(t_value), n-1));

% Wyświetlenie wyników obliczonych ręcznie
disp('Ręczne obliczenia:');
disp(['Średnia próby: ', num2str(x_bar)]);
disp(['Wartość statystyki t: ', num2str(t_value)]);
disp(['p-wartość: ', num2str(p_value)]);

% ======= TEST T-STUDENTA W MATLABIE =======
[h, p] = ttest(data, mu);

% Wyświetlenie wyników z MATLAB-a
disp(' ');
disp('MATLAB ttest:');
disp(['Wynik testu t-Studenta (h): ', num2str(h)]);
disp(['p-wartość: ', num2str(p)]);

% Wnioskowanie
if h == 1
    disp('Odrzucamy hipotezę zerową. Średni czas dostarczenia przesyłki różni się od 3 dni.');
else
    disp('Brak podstaw do odrzucenia H0. Średni czas dostarczenia przesyłki może wynosić 3 dni.');
end