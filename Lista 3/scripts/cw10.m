% === Ćwiczenie 10 ===
% Analiza normalności płac absolwentów rolnictwa i pedagogiki

% najlepszym wyborem jest test Shapiro-Wilka:
% - bardzo dobry dla małych próbek (n = 11)
% - nie znamy parametrów populacji (estymujemy je z danych)
% - typ danych: liczby ciągłe

% Wczytanie danych z pliku Excel
data = readtable('absolwenci.xls');

% Wydzielenie zmiennych
pedagogika = data.pedagogika;
rolnictwo = data.rolnictwo;

% Poziom istotności
alpha = 0.05;

% === Test Shapiro-Wilka dla pedagogiki ===
[H_ped, p_ped, W_ped] = swtest(pedagogika, alpha);

disp('=== Test Shapiro-Wilka – Pedagogika ===');
fprintf('Statystyka W = %.4f\n', W_ped);
fprintf('p-value = %.4f\n', p_ped);

if H_ped == 1
    disp('Wniosek: Odrzucamy H0 – dane NIE mają rozkładu normalnego.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H0 – dane mogą pochodzić z rozkładu normalnego.');
end

% === Wykres QQ-plot dla pedagogiki ===
figure;
subplot(1,2,1);
qqplot(pedagogika);

% Opisy osi, tytuł wykresu
title('QQ-plot: Płace – Pedagogika');
xlabel('Teoretyczne kwantyle');
ylabel('Obserwowane płace');
grid on;

% === Test Shapiro-Wilka dla rolnictwa ===
[H_rol, p_rol, W_rol] = swtest(rolnictwo, alpha);

disp(' ');
disp('=== Test Shapiro-Wilka – Rolnictwo ===');
fprintf('Statystyka W = %.4f\n', W_rol);
fprintf('p-value = %.4f\n', p_rol);

if H_rol == 1
    disp('Wniosek: Odrzucamy H0 – dane NIE mają rozkładu normalnego.');
else
    disp('Wniosek: Brak podstaw do odrzucenia H0 – dane mogą pochodzić z rozkładu normalnego.');
end

% === Wykres QQ-plot dla rolnictwa ===
subplot(1,2,2);
qqplot(rolnictwo);

% Opisy osi, tytuł wykresu
title('QQ-plot: Płace – Rolnictwo');
xlabel('Teoretyczne kwantyle');
ylabel('Obserwowane płace');
grid on;