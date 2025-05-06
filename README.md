# Data Analysis – Zadania z analizy danych i statystyki

Repozytorium zawiera rozwiązania zadań i analizy danych realizowane w ramach zajęć akademickich z zakresu statystyki, eksploracji danych i uczenia maszynowego (MATLAB, Python, Weka). Każda lista zadań została umieszczona w osobnym katalogu, który zawiera:

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
- [Lista 5 – Testy nieparametryczne dla prób zależnych](#lista-5--testy-nieparametryczne-dla-prób-zależnych)
- [Lista 6 – Analiza wariancji (ANOVA)](#lista-6--analiza-wariancji-anova)
- [Lista 7 – Wstępne przygotowanie danych (kredyty)](#lista-7--wstępne-przygotowanie-danych-kredyty)
- [Lista 8 – Przetwarzanie danych w Weka GUI i Pythonie](#lista-8--przetwarzanie-danych-w-weka-gui-i-pythonie)
- [Lista 9 – Selekcja cech](#lista-9--selekcja-cech)
- [Lista 10 – Klasyfikacja i ocena jakości klasyfikatorów](#lista-10--klasyfikacja-i-ocena-jakości-klasyfikatorów)

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

Lista dotyczy sprawdzania zgodności danych z rozkładem normalnym – kluczowego założenia wielu testów parametrycznych. Zakres materiału obejmuje:

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

## Lista 5 – Testy nieparametryczne dla prób zależnych

Lista koncentruje się na nieparametrycznych metodach analizy danych dla prób zależnych – alternatywach dla testu t-Studenta, gdy nie są spełnione jego założenia. Obejmuje:

- test znaków (`signtest`) – analiza tylko znaków różnic,
- test kolejności par Wilcoxona (`signrank`, `ranksum`) – uwzględnia znak i wartość różnicy,
- test McNemary – dla danych binarnych,
- porównania dwóch pomiarów u tych samych osób (np. przed i po zabiegu, diecie, zmianie sytuacji),
- przykłady z użyciem danych rzeczywistych (np. `czytelnictwo.csv`, `chmiel.csv`, `Dane z koronografii.csv`),
- interpretację wyników p-value i decyzji statystycznych w MATLABie,
- zastosowanie hipotez jednostronnych i dwustronnych w testach nieparametrycznych.

## Lista 6 – Analiza wariancji (ANOVA)

Lista poświęcona metodom analizy wariancji – zarówno parametrycznym (ANOVA), jak i nieparametrycznym (Kruskal-Wallis, Friedman). Zakres materiału obejmuje:

- jednoczynnikową analizę wariancji (one-way ANOVA) z użyciem `anova1`,
- analizę post-hoc (`multcompare`) w celu identyfikacji grup różniących się istotnie,
- dwuczynnikową analizę wariancji (two-way ANOVA) z użyciem `anova2`,
- testy nieparametryczne: Kruskala-Wallisa (`kruskalwallis`) i Friedmana (`friedman`),
- weryfikację założeń ANOVA: normalność rozkładu, równość wariancji, niezależność prób,
- interpretację wyników testów statystycznych (wartości p, F, przedziały ufności),
- ćwiczenia praktyczne na danych rzeczywistych (`koala`, `wombats`, `popcorn`, `FEV`, itp.).

## Lista 7 – Wstępne przygotowanie danych (kredyty)

Lista poświęcona wstępnemu przetwarzaniu rzeczywistych danych kredytowych w Excelu oraz przygotowaniu ich do dalszej analizy w środowisku Weka. Zakres obejmuje:

- przekształcanie atrybutów datowych i liczbowych z wykorzystaniem funkcji Excela (`IF`, `MID`, `YEAR`, `MONTH`, `MOD`, `DATEDIF`),
- wyznaczenie zmiennych pochodnych: wiek, płeć, długość zatrudnienia, opóźnienie spłaty kredytu,
- tworzenie zmiennych opisowych na podstawie PESEL oraz statusu kredytowego,
- przygotowanie finalnego zbioru cech do analizy decyzyjnej (XLS i ARFF),
- walidacja struktury danych poprzez import do GUI Weki.
- przygotowanie gotowego zbioru `.arff` do klasyfikacji klientów w kontekście ryzyka kredytowego.

## Lista 8 – Przetwarzanie danych w Weka GUI i Pythonie

Lista obejmuje przetwarzanie danych w narzędziu Weka oraz programistycznie (Python). Zakres działań obejmuje:

- otwarcie zbioru `.arff` z poprzedniej listy w GUI Weki,
- redukcja liczby klas atrybutu `status_pożyczki` do dwóch: `dobry` i `zły`,
- usunięcie zbędnych atrybutów i zmiana ich kolejności,
- dyskretyzacja zmiennej `wiek` do pięciu przedziałów,
- zapis przetworzonego zbioru,
- implementacja skryptu Pythona do przetwarzania kolumn i rekordów oraz generowania zbioru wynikowego.

## Lista 9 – Selekcja cech

Lista poświęcona zagadnieniom selekcji cech w zbiorze danych, z wykorzystaniem narzędzia Weka oraz własnej implementacji w Pythonie. Zakres materiału obejmuje:

- dyskretyzację zmiennych numerycznych (nadzorowaną) w środowisku Weka,
- wykorzystanie metod opartych na entropii: `GainRatioAttributeEval` i `InfoGainAttributeEval`,
- identyfikację cech spełniających zadany próg istotności (wartość większa niż 0.001),
- posortowanie cech według wartości GainRatio i zapis przefiltrowanego zbioru,
- implementację własnej wersji `GainRatioAttributeEval` w Pythonie, z wyliczeniem entropii, InfoGain i SplitInfo dla każdego atrybutu,
- porównanie wyników Weki i Pythona, analiza różnic wynikających z podejścia do dyskretyzacji i typu logarytmu.

## Lista 10 – Klasyfikacja i ocena jakości klasyfikatorów

Lista poświęcona analizie skuteczności klasyfikatorów z użyciem własnej implementacji walidacji krzyżowej. Zakres materiału obejmuje:

- klasyfikację instancji na podstawie danych wejściowych (budowa modelu + predykcja),
- implementację własnej procedury walidacji krzyżowej z liczbą foldów i powtórzeń,
- porównanie klasyfikatorów: ZeroRule, DecisionTree, SVM, MLP, NaiveBayes,
- wyliczanie i interpretację wskaźników jakości: Accuracy, TPR, TNR, GMean, AUC,
- wyznaczenie najlepszego modelu pod względem skuteczności klasyfikacji „złych” klientów (klasa pozytywna),
- implementację w Pythonie z wykorzystaniem bibliotek `scikit-learn` i `liac-arff`.

## 🔧 Wymagania

Do uruchomienia projektów i analiz wymagane są:

- MATLAB R2022a:
  - Statistics and Machine Learning Toolbox
- Weka 3.8 lub nowsza (GUI + biblioteka programistyczna)
- Python 3.11
  - Zależności (można zainstalować przez `requirements.txt`):
    - `numpy`
    - `pandas`
    - `scikit-learn`
    - `matplotlib`
    - `liac-arff`

## 📝 Licencja

Ten projekt jest udostępniany na warunkach licencji **MIT**. Szczegóły znajdują się w pliku [LICENSE](LICENSE).