% Parametry dla nabywców nowego produktu
mu_1 = 27.7;   % Średnia wieku (μ)
sigma_1 = 5.5; % Odchylenie standardowe
n_1 = 20;      % Liczność próby

% Parametry dla nabywców znanego produktu
mu_2 = 32.1;   % Średnia wieku (μ)
sigma_2 = 6.3; % Odchylenie standardowe
n_2 = 22;      % Liczność próby

alpha = 0.05;  % Poziom istotności

% Wygenerowanie losowych próbek
sample_1 = normrnd(mu_1, sigma_1, [n_1, 1]);
sample_2 = normrnd(mu_2, sigma_2, [n_2, 1]);

% Obliczenie wariancji z próby
var_1 = var(sample_1);
var_2 = var(sample_2);

% Obliczenie statystyki testowej F
F_value = var_1 / var_2;

% Obliczenie stopni swobody
df1 = n_1 - 1; % Stopnie swobody dla pierwszej próbki (nabywcy nowego produktu)
df2 = n_2 - 1; % Stopnie swobody dla drugiej próbki (nabywcy znanego produktu)

% Obliczenie p-wartości dla testu F
% fcdf(F_value, df1, df2) daje nam prawdopodobieństwo, że statystyka F jest mniejsza lub równa F_value (lewy ogon).
% 1 - fcdf(F_value, df1, df2) daje prawdopodobieństwo, że statystyka F jest większa lub równa F_value (prawy ogon).
p_value = 2 * min(fcdf(F_value, df1, df2), 1 - fcdf(F_value, df1, df2));

% Wyświetlenie wyników
disp('Ręczne obliczenia:');
disp(['Wariancja dla nowego produktu: ', num2str(var_1)]);
disp(['Wariancja dla znanego produktu: ', num2str(var_2)]);
disp(['Statystyka testu F: ', num2str(F_value)]);
disp(['p-wartość: ', num2str(p_value)]);

% Wnioskowanie
if p_value < alpha
    disp('Odrzucamy hipotezę zerową. Różnica w odchyleniach standardowych jest statystycznie istotna.');
else
    disp('Brak podstaw do odrzucenia hipotezy zerowej. Różnica w odchyleniach standardowych nie jest statystycznie istotna.');
end

% ======= TEST F w MATLAB-ie =======
[h, p_F] = vartest2(sample_1, sample_2);

% Wyświetlenie wyników z MATLAB-a
disp(' ');
disp('Wyniki testu F w MATLAB-ie:');
disp(['Wynik testu (h): ', num2str(h)]);
disp(['p-wartość: ', num2str(p_F)]);

% Wnioskowanie na podstawie wyniku z MATLAB-a
if h == 1
    disp('Odrzucamy hipotezę zerową. Różnica w odchyleniach standardowych jest statystycznie istotna.');
else
    disp('Brak podstaw do odrzucenia hipotezy zerowej. Różnica w odchyleniach standardowych nie jest statystycznie istotna.');
end