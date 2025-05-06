% Parametry testu
n = 25;            % Liczność próby
mu = 10;           % Średnia populacji (μ)
sigma = 1.5;       % Odchylenie standardowe próby
sigma_H0 = 1.6;    % Odchylenie standardowe z hipotezy zerowej

alpha_1 = 0.05;    % Poziom istotności 5%
alpha_2 = 0.1;     % Poziom istotności 10%

% Wygenerowanie próbki z rozkładu normalnego N(mu, sigma^2)
sample = normrnd(mu, sigma, [n, 1]);

% Obliczenie wariancji z próby
s2 = var(sample);

% Test chi-kwadrat dla wariancji (H0: sigma_H0^2)
[h1, p1, chi1] = vartest(sample, sigma_H0^2, 'Tail', 'left', 'Alpha', alpha_1);
[h2, p2, chi2] = vartest(sample, sigma_H0^2, 'Tail', 'left', 'Alpha', alpha_2);

% Wyświetlenie wyników
disp('Testowanie hipotezy dla wariancji:');
disp(['Obliczona wariancja z próby: ', num2str(s2)]);
disp(['Wartość statystyki chi-kwadrat (alpha = 0.05): ', num2str(chi1(2))]);
disp(['Wartość statystyki chi-kwadrat (alpha = 0.1): ', num2str(chi2(2))]);

disp(' ');
disp('Wyniki testu dla alpha = 0.05:');
disp(['p-wartość: ', num2str(p1)]);
if h1 == 1
    disp('Odrzucamy hipotezę zerową na poziomie 0.05.');
else
    disp('Brak podstaw do odrzucenia H0 na poziomie 0.05.');
end

disp(' ');
disp('Wyniki testu dla alpha = 0.1:');
disp(['p-wartość: ', num2str(p2)]);
if h2 == 1
    disp('Odrzucamy hipotezę zerową na poziomie 0.1.');
else
    disp('Brak podstaw do odrzucenia H0 na poziomie 0.1.');
end