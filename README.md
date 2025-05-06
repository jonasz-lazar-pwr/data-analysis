# Data Analysis

Repozytorium zawiera rozwiązania zadań oraz analizy danych realizowane w ramach zajęć akademickich. Każda lista zadań została umieszczona w osobnym katalogu, który zawiera:

- dokumentację i instrukcje (`/docs`),
- dane wejściowe (`/data`),
- skrypty w MATLABie, Pythonie lub Weka (`/scripts`, `/functions`),
- wyniki w postaci wykresów i statystyk (`/results`),
- raport (jeśli dotyczy) (`/report`).

## Spis treści

- [Lista 1 – Podstawy MATLABa i operacje na danych](#lista-1--podstawy-matlaba-i-operacje-na-danych)
- [Lista 2 – Testowanie hipotez statystycznych](#lista-2--testowanie-hipotez-statystycznych)
- [Lista 3 – Testy normalności rozkładu](#lista-3--testy-normalności-rozkładu)
- [Lista 4 – Testy t-Studenta i test Manna-Whitneya](#lista-4--testy-t-studenta-i-test-manna-whitneya)

## Lista 1 – Podstawy MATLABa i operacje na danych

Zadania wprowadzające do pracy w środowisku MATLAB. Obejmują:

- operacje na macierzach (tworzenie, transpozycja, operacje arytmetyczne),
- przegląd przydatnych funkcji (`zeros`, `ones`, `rand`, `randn`, `plot`, `hist`, `boxplot`, itp.),
- tworzenie własnych funkcji i skryptów `.m`,
- rysowanie histogramów, boxplotów oraz dystrybuant,
- generatory liczb losowych i ich porównanie,
- praca z danymi rzeczywistymi (`iris.txt`, `glass.txt`),
- obliczenia statystyczne: średnia, mediana, odchylenie standardowe, prawdopodobieństwa.

## Lista 2 – Testowanie hipotez statystycznych

Wprowadzenie do testowania hipotez statystycznych, w tym hipotezy zerowej (H0) i alternatywnej (H1). Zakres materiału obejmuje:

- pojęcia testu statystycznego, poziomu istotności i obszaru krytycznego,
- testy parametryczne i nieparametryczne,
- interpretację wartości p (`p-value`) oraz decyzji statystycznych,
- testy średnich (np. `ttest`, `ttest2`, `tcdf`, `tinv`),
- testy wariancji (np. `vartest`, `vartest2`, `vartestn`, `Levenetest`),
- zastosowanie rozkładów normalnych, t-Studenta, chi-kwadrat i F,
- praktyczne przykłady: czasy przejazdów, czas dostawy, wzrost wartości nieruchomości,
- analiza rzeczywistych i wygenerowanych danych,
- formułowanie i testowanie hipotez dla danych liczbowych.

## Lista 3 – Testy normalności rozkładu

Lista poświęcona testowaniu zgodności danych z rozkładem normalnym, co jest istotnym założeniem wielu testów parametrycznych. Zakres materiału obejmuje:

- test Kołmogorowa-Smirnowa (K-S), w tym z poprawką Lillieforsa,
- test Shapiro-Wilka (preferowany przy małych próbach),
- test Lillieforsa – rozszerzenie testu K-S w sytuacji nieznanych parametrów populacji,
- wykorzystanie wykresów empirycznych i teoretycznych dystrybuant (ECDF vs. CDF),
- zastosowanie funkcji `kstest`, `kstest2`, `lillietest`, `swtest`, `normcdf`, `qqplot` w MATLABie,
- interpretacja p-value i statystyk testowych dla różnych scenariuszy,
- przykłady praktyczne: analiza rozkładów wzrostu, czasu zużycia żarówek, pojemności kondensatorów, preferencji pszczół, itp.

## Lista 4 – Testy t-Studenta i test Manna-Whitneya

Zestaw ćwiczeń poświęcony porównywaniu średnich w dwóch grupach (lub jednej grupy względem wartości referencyjnej) oraz alternatywnej metodzie nieparametrycznej. Zakres materiału obejmuje:

- test t-Studenta dla prób niezależnych, zależnych oraz jednej próby,
- warunki stosowania testów: normalność rozkładu, równość wariancji, równoliczność grup,
- weryfikacja założeń przy pomocy testów normalności (np. Shapiro-Wilka) i testu Levene’a,
- interpretacja statystyki t i wartości p (dwustronnej i jednostronnej),
- test Manna-Whitneya jako nieparametryczna alternatywa dla testu t przy naruszeniu założeń,
- funkcje MATLAB: `ttest`, `ttest2`, `vartest`, `levene`, `mwwtest`,
- praktyczne przykłady: różnice we wzroście, skuteczność kursu pisania, aktywność gestykulacyjna, temperatura ciała.

