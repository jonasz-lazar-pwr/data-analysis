# Lista 10 - Porównanie klasyfikatorów z własną implementacją walidacji krzyżowej

## Opis
Projekt ma na celu porównanie skuteczności różnych klasyfikatorów przy użyciu własnej implementacji walidacji krzyżowej N-krotnej z możliwością wielokrotnych powtórzeń. Ocena jakości modeli opiera się na wyliczanych metrykach: dokładności, czułości, specyficzności, średniej geometrycznej oraz polu pod krzywą ROC, co pozwala na wszechstrawną analizę wydajności klasyfikacji.

## Klasa pozytywna
Za klasę pozytywną przyjmujemy: **„zły klient”** (`status_pożyczki = zły`).

## Opis plików
- **`main.py`** – główny skrypt:
  - Wczytuje dane z pliku `.arff`,
  - Przygotowuje dane (`X`, `y`),
  - Inicjalizuje klasyfikatory (`get_classifiers()`),
  - Dla każdego modelu wykonuje `cross_validate()` i zapisuje wyniki.

- **`classifiers.py`** – definicja klasyfikatorów:
  - `ZeroRule`, `DecisionTree`, `SVM`, `MLP`, `NaiveBayes`.

- **`cross_validation.py`** – własna implementacja walidacji krzyżowej:
  - `cross_validate(classifier, X, y, n_splits, n_repeats)`.

- **`evaluation.py`** – metryki klasyfikacji:
  - `compute_metrics(conf_matrix)` → **Accuracy**, **TPR**, **TNR**, **GMean**.

- **`utils.py`** – funkcje pomocnicze:
  - `set_seed(seed_value)` – ustawia ziarno losowości.

## Parametry
- `n_splits` – liczba foldów,
- `n_repeats` – liczba powtórzeń walidacji,
- `seed_value` – ziarno losowości,
- `classifiers` – lista klasyfikatorów (scikit-learn).

## Szczegółowy przebieg działania programu
1. **Wczytanie i przygotowanie danych (`main.py`)**
   - Wczytanie pliku `.arff` i konwersja do `DataFrame`.
   - Podział na cechy (`X`) i etykietę (`y`).
   - Kodowanie zmiennych kategorycznych na wartości liczbowe.

2. **Wybór i konfiguracja klasyfikatorów (`classifiers.py`)**
   - Zdefiniowane: `ZeroRule`, `DecisionTree`, `SVM`, `MLP`, `NaiveBayes`.
   - Klasyfikatory inicjalizowane z ziarna (`random_state`).

3. **Walidacja krzyżowa (`cross_validation.py`)**
   - Każdy klasyfikator oceniany w `n_repeats × n_splits` eksperymentach.
   - Zbierane są macierze konfuzji oraz AUC dla każdej iteracji.
   - Obliczana średnia macierz konfuzji.

4. **Obliczanie metryk (`evaluation.py`)**
   - Obliczenie **Accuracy**, **TPR**, **TNR**, **GMean** na podstawie uśrednionej macierzy.
   - Obliczenie średniego **AUC**.

5. **Powtarzalność wyników (`utils.py`)**
   - `set_seed(seed_value)` ustawia ziarno losowości (`random`, `numpy`).

## Wartości wskaźników
Skrypt w czasie działania wyświetla wartości wskaźników dla każdego klasyfikatora:
- **Średnią macierz konfuzji**,
- **Accuracy** – dokładność klasyfikacji,
- **TPR** (True Positive Rate) – czułość (wykrywanie złych klientów),
- **TNR** (True Negative Rate) – specyficzność (rozpoznawanie dobrych klientów),
- **GMean** – średnia geometryczna TPR i TNR,
- **AUC** – pole pod krzywą ROC.

## Wyniki
Poniżej przedstawiono szczegółowe wyniki działania poszczególnych klasyfikatorów oraz interpretację najlepszych konfiguracji dla każdej metody, zgodnie z metrykami **GMean** oraz **AUC**.

### ZeroRule

- **GMean:** 0.000  
- **AUC:** 0.500  

*ZeroRule to klasyfikator bazowy, który zawsze przewiduje najczęstszą klasę („dobry klient”). Stanowi punkt odniesienia dla innych modeli.*

---

### DecisionTree (odpowiednik J48 w WEKA)

| Wariant     | GMean      | AUC        |
|-------------|------------|------------|
| `depth5`    | **0.4377** | **0.7877** |
| `depth10`   | 0.4379     | 0.7679     |
| `unlimited` | 0.4379     | 0.7679     |

*Najlepsze wyniki osiąga model z ograniczoną głębokością `max_depth=5`, co ogranicza ryzyko przeuczenia.*

---

### SVM (odpowiednik SMO w WEKA)

| Wariant  | GMean      | AUC        |
|----------|------------|------------|
| `C=0.1`  | 0.0000     | 0.6755     |
| `C=1.0`  | 0.4177     | 0.6442     |
| `C=10.0` | **0.4390** | **0.6414** |

*Wysokie C poprawia GMean, choć AUC nieznacznie spada. Niskie `C=0.1` prowadzi do całkowitego niedouczenia modelu.*

---

### MLP (odpowiednik MultilayerPerceptron w WEKA)

| Wariant | GMean      | AUC        |
|---------|------------|------------|
| `50`    | **0.4419** | 0.7968     |
| `100`   | 0.4385     | **0.7988** |
| `50_50` | 0.4392     | 0.7954     |

*Wszystkie konfiguracje dają bardzo dobre wyniki. `MLP_50` najlepszy dla GMean, `MLP_100` dla AUC.*

---

### NaiveBayes

- **GMean:** **0.4880**  
- **AUC:** 0.7915  

*Zaskakująco dobry wynik jak na prosty model – najlepszy GMean spośród wszystkich klasyfikatorów.*

---

### Podsumowanie porównania

| Klasyfikator | Najlepszy wariant    | GMean      | AUC    | Uwagi                              |
|--------------|----------------------|------------|--------|------------------------------------|
| DecisionTree | `depth5`             | 0.4377     | 0.7877 | Ograniczenie głębokości pomaga     |
| SVM          | `C=10.0`             | 0.4390     | 0.6414 | Lepszy margines – lepsza separacja |
| MLP          | `MLP_50` / `MLP_100` | 0.4419     | 0.7988 | Najlepszy kompromis skuteczności   |
| NaiveBayes   | -                    | **0.4880** | 0.7915 | Najlepszy GMean                    |
| ZeroRule     | -                    | 0.0000     | 0.5000 | Punkt odniesienia (baseline)       |
