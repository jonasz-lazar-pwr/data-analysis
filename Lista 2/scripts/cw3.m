% Parametry z próby
mu = 49;  % Hipotetyczna średnia wzrostu z populacji (H0)
x_bar = 38;  % Średnia wzrostu z próby (x̄)
sigma = 14; % Odchylenie standardowe próby
n = 18;  % Liczność próby
alpha = 0.01; % Poziom istotności

% Obliczenie statystyki testowej t
t_value = (x_bar - mu) / (sigma / sqrt(n));

% Obliczenie p-wartości dla testu t-Studenta (dwustronnego)
p_value = 2 * (1 - tcdf(abs(t_value), n-1));

% Wyświetlenie wyników obliczonych ręcznie
disp('Ręczne obliczenia:');
disp(['Średnia próby: ', num2str(x_bar)]);
disp(['Odchylenie standardowe próby: ', num2str(sigma)]);
disp(['Wartość statystyki t: ', num2str(t_value)]);
disp(['p-wartość: ', num2str(p_value)]);

% Decyzja na podstawie wartości krytycznej
if p_value < alpha
    disp('Odrzucamy hipotezę zerową. Średni wzrost wartości gruntów różni się od 49%.');
else
    disp('Brak podstaw do odrzucenia H0. Średni wzrost wartości gruntów może wynosić 49%.');
end

% ======= TEST T-STUDENTA W MATLABIE =======
% Wygenerowanie losowej próby z rozkładu normalnego
sample = normrnd(x_bar, sigma, [n, 1]); 

% Test t-Studenta
[h, p] = ttest(sample, mu, 'Alpha', alpha);

% Wyświetlenie wyników z MATLAB-a
disp(' ');
disp('MATLAB ttest:');
disp(['Wynik testu t-Studenta (h): ', num2str(h)]);
disp(['p-wartość: ', num2str(p)]);

% Porównanie wyników
if h == 1
    disp('Odrzucamy hipotezę zerową. Średni wzrost wartości gruntów różni się od 49%.');
else
    disp('Brak podstaw do odrzucenia H0. Średni wzrost wartości gruntów może wynosić 49%.');
end