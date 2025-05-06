function [mean_val, stdev_val] = stat(x)
    % Funkcja oblicza średnią i odchylenie standardowe wektora x
    n = length(x);
    mean_val = sum(x) / n;  % Obliczenie średniej
    stdev_val = sqrt(sum((x - mean_val).^2) / n);  % Obliczenie odchylenia standardowego
end