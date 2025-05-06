% === generate_temp_data.m ===
% Generowanie przykładowych danych temperatury ciała

% Ustawienie ziarna losowości
rng(42);

% Liczność próby
n = 65;

% Generowanie danych
women = normrnd(98.4, 0.7, [n, 1]);
men = normrnd(98.1, 0.7, [n, 1]);

% Zapisanie danych do pliku MAT
save('results/temperature_data.mat', 'women', 'men');
