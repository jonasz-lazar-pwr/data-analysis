
% Wektor wartości od 1 do 10
x = 1:10;

% Obliczenie średniej i odchylenia standardowego
[m, s] = stat(x);

disp(['Średnia : ', num2str(m)]);
disp(['Odchylenie standardowe : ', num2str(s)]);