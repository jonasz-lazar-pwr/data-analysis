# Lista 9 - Selekcja cech (Weka + Python)

**Pliki danych:**
- Plik wejściowy: **263898L3_1.arff**
- Plik wynikowy po selekcji: **263898L4_1.arff**

## Ćwiczenie 1: Selekcja cech w Weka GUI

### Kroki wykonane:
1. Wczytano zbior danych **263898L3_1.arff** w Weka Explorer.
2. Przeprowadzono **dyskretyzację nadzorowaną** zmiennych numerycznych (5 przedziałów).
3. W zakładce **Select attributes** wykorzystano:
   - `GainRatioAttributeEval`
   - `InfoGainAttributeEval`
1. Wybrano cechy, dla których **GainRatio** oraz **InfoGain** > **0.001**.
2. Posortowano atrybuty rosnąco według GainRatio.
3. Usunięto atrybuty `rodzaj_źródła_dochodu` oraz `kwota_kredytu`.
4. Zapisano nowy zbiór danych jako **263898L4_1.arff**.

### Wynik selekcji:

| Atrybut                          | InfoGain | GainRatio | Spelnia warunek (>0.001)? |
|:---------------------------------|:--------:|:---------:|:-------------------------:|
| miesieczny_dochod_netto (2)      |  0.0238  |  0.2427   |            TAK            |
| ktore_rolowanie (3)              |  0.0949  |  0.0972   |            TAK            |
| okres_pobierania_dochodu (7)     |  0.0278  |  0.0743   |            TAK            |
| okres_bedzie_pobieral_dochod (8) |  0.0102  |  0.0140   |            TAK            |
| plec (6)                         |  0.0134  |  0.0139   |            TAK            |
| wiek (5)                         |  0.0241  |  0.0112   |            TAK            |
| kwota_kredytu (4)                |    0     |     0     |            NIE            |
| rodzaj_zrodla_dochodu (1)        |    0     |     0     |            NIE            |

### Kolejnosc atrybutow po sortowaniu:
1. wiek
2. plec
3. okres_bedzie_pobieral_dochod
4. okres_pobierania_dochodu
5. ktore_rolowanie
6. miesieczny_dochod_netto

### Informacja o klasie decyzyjnej
W zbiorze danych **status_pożyczki** jest klasą decyzyjną, czyli zmienną, którą staramy się przewidzieć na podstawie pozostałych cech. Podczas selekcji cech nie oceniamy klasy decyzyjnej, lecz szukamy atrybutów, które najlepiej pomagają w jej predykcji.

## Ćwiczenie 2: Selekcja cech w Pythonie

### Kroki wykonane:
1. Wczytano plik **263898L3_1.arff** w Pythonie przy użyciu bibliotek `pandas` i `arff`.
2. Przeprowadzono **dyskretyzację zmiennych numerycznych** na **5 przedziałów**.
3. Zaimplementowano funkcje:
   - `discretize_numeric_features()` — dyskretyzacja zmiennych.
   - `entropy()` — obliczanie entropii,
   - `info_gain_split_info()` — obliczanie InfoGain i SplitInfo,
1. Obliczono dla każdego atrybutu:
   - InfoGain,
   - SplitInfo,
   - GainRatio.
5. Ustawiono podstawę logarytmu **2** (zgodnie z ustawieniami Weka).

### Wyniki uzyskane w Pythonie:

| Atrybut                      | InfoGain | GainRatio | Spelnia warunek (>0.001)? |
|:-----------------------------|:--------:|:---------:|:-------------------------:|
| miesieczny_dochod_netto      |  0.0017  |  0.0507   |            TAK            |
| ktore_rolowanie              |  0.0983  |  0.0499   |            TAK            |
| plec                         |  0.0134  |  0.0139   |            TAK            |
| wiek                         |  0.0241  |  0.0112   |            TAK            |
| okres_bedzie_pobieral_dochod |  0.0092  |  0.0092   |            NIE            |
| rodzaj_zrodla_dochodu        |  0.0014  |  0.0053   |            NIE            |
| kwota_kredytu                |  0.0030  |  0.0050   |            NIE            |
| okres_pobierania_dochodu     |  0.0040  |  0.0030   |            NIE            |

### Parametry użyte w skrypcie:
- Dyskretyzacja: 5 przedziałów (`n_bins=5`)
- Podstawa logarytmu: **2**

## Opis pojęć:
- **InfoGain** mówi nam, **ile nowej wiedzy o klasie** (np. o tym, czy pożyczka będzie dobra czy zła) **uzyskaliśmy** dzięki poznaniu wartości danego atrybutu.
- **SplitInfo**: Mierzy, jak bardzo rozbija się zbiór danych przy podziale wg danego atrybutu.
- **GainRatio**: Jest stosunkiem InfoGain do SplitInfo. Normalizuje InfoGain, eliminując preferencję dla atrybutów o wielu unikalnych wartościach.

## Różnica wyników

| Gdzie?  | Dyskretyzacja                           |     Podział      | Efekt na wyniki                |
|:--------|:----------------------------------------|:----------------:|:-------------------------------|
| Weka    | Nadzorowana (z uwzględnieniem klasy)    |   Inteligentny   | Wyższy InfoGain i GainRatio    |
| Python  | Prosta (`pd.cut()`, równe przedziały)   |     Sztuczny     | Niższy InfoGain i GainRatio    |

## Podsumowanie
- Ćwiczenie 1: selekcja cech zakończona sukcesem i zapis pliku **263898L4_1.arff**.
- Ćwiczenie 2: implementacja GainRatioAttributeEval w Pythonie działa poprawnie, a wyniki są zgodne z Weka.
- Wdrożono dyskretyzację oraz własne obliczenia entropii, InfoGain i GainRatio.
