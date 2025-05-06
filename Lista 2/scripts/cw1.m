% Parametry
mu = 28;  % Średnia populacji (μ)
n = 100;  % Liczność próby
sigma = 5; % Odchylenie standardowe próby

% Wygenerowanie losowej próby (n=100) z rozkładu normalnego N(28,5)
sample = normrnd(mu, sigma, [n, 1]); 

% Obliczenie średniej z próby (x̄)
x_bar = mean(sample);
 
% Obliczenie statystyki testowej t
t_value = (x_bar - mu) / (sigma / sqrt(n));

% Obliczenie p-wartości dla testu t-Studenta (dwustronnego):
% tcdf(abs(t_value), df) daje pole pod krzywą od -∞ do |t|,
% 1 - tcdf(abs(t_value), df) daje obszar w prawym ogonie
% 2 * (...) bo test jest dwustronny, więc liczymy również lewy ogon.
p_value = 2 * (1 - tcdf(abs(t_value), n-1));

% Wyświetlenie wyników ręcznych
disp('Ręczne obliczenia:');
disp(['Średnia próby: ', num2str(x_bar)]);
disp(['Wartość statystyki t: ', num2str(t_value)]);
disp(['p-wartość: ', num2str(p_value)]);

% Wnioskowanie
if p_value < 0.05
    disp('Odrzucamy hipotezę zerową. Średni czas przejazdu różni się od 28 minut.');
else
    disp('Brak podstaw do odrzucenia H0. Średni czas przejazdu może wynosić 28 minut.');
end

% ======= TEST T-STUDENTA W MATLABIE =======
[h, p] = ttest(sample, mu);

% Wyświetlenie wyników z MATLAB-a
disp(' ');
disp('MATLAB ttest:');
disp(['Wynik testu t-Studenta (h): ', num2str(h)]);
disp(['p-wartość: ', num2str(p)]);

% Wnioskowanie
if h == 1
    disp('Odrzucamy hipotezę zerową. Średni czas przejazdu różni się od 28 minut.');
else
    disp('Brak podstaw do odrzucenia H0. Średni czas przejazdu może wynosić 28 minut.');
end