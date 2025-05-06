
% Utworzenie testowej zmiennej
a = 1;

% Sprawdzenie dostępnych zmiennych
who

% Tworzenie różnych macierzy
b = zeros(3, 3);  % Macierz 3x3 wypełniona zerami
c = ones(2, 2);   % Macierz 2x2 wypełniona jedynkami
d = eye(4);       % Macierz jednostkowa 4x4
e = repmat([1 2; 3 4], 2, 2); % Powielenie macierzy 2x2 do macierzy 4x4

% Generowanie losowych macierzy
f = rand(3, 3);   % Macierz 3x3 z rozkładu jednostajnego (0,1)
g = randn(3, 3);  % Macierz 3x3 z rozkładu normalnego N(0,1)

% Sprawdzenie rozmiaru macierzy
size(g) % Zwraca liczbę wierszy i kolumn
length(g) % Zwraca największy wymiar macierzy

% Operacje na macierzach
h = [1, 2, 3; 4, 5, 6; 7, 8, 9];
i = h';  % Transpozycja macierzy "h"

% Operacje matematyczne
j = [1, 2; 3, 4];
k = [5, 6; 7, 8];

sum = j + k;    % Dodawanie macierzy
diff = j - k;   % Odejmowanie macierzy
prod = j * k;   % Mnożenie macierzowe
elem_prod = j .* k;     % Mnożenie element po elemencie

% Dostęp do elementu macierzy
x = j(1,2);  % Element z pierwszego wiersza i drugiej kolumny