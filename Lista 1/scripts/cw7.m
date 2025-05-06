
% Zmienna Z ma rozkład standardowy normalny N(0,1), czyli:
%   - Średnia (mikro): μ = 0
%   - Odchylenie standardowe (sigma): σ = 1
% P(Z < 2) = Φ(2), gdzie Φ(x) to dystrybuanta rozkładu normalnego
% P(|Z| < 2) = P(-2 < Z < 2) = Φ(2) - Φ(-2)

% p = normcdf(x, mikro, sigma);
%   - x – punkt, w którym liczymy dystrybuantę
%   - mikro – średnia (wartość oczekiwana)
%   - sigma – odchylenie standardowe

% Prawdopodobieństwo P(Z < 2)
% Obliczy wartość dystrybuanty w x = 2 dla N(3,7).
p1 = normcdf(2, 3, 7);


% Prawdopodobieństwo P(|Z| < 2), czyli P(-2 < Z < 2)
p2 = normcdf(2, 3, 7) - normcdf(-2, 3, 7);

% Wyświetlenie wyników
fprintf('P(Z < 2) = %.4f\n', p1);
fprintf('P(|Z| < 2) = %.4f\n', p2);