import arff
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from cross_validation import cross_validate
from classifiers import get_classifiers
from utils import set_seed


def main(n_splits: int = 10, n_repeats: int = 5, seed_value: int = 42):
    # 1. Ustawiamy ziarno losowości dla pełnej powtarzalności wyników
    set_seed(seed_value)

    # 2. Wczytanie danych z pliku .arff (ARFF to format danych wykorzystywany m.in. przez Wekę)
    with open('data/263898L4_1.arff', 'r') as f:
        arff_data = arff.load(f)

    # Pobranie nazw kolumn z pliku ARFF
    columns = [attr[0] for attr in arff_data['attributes']]
    # Utworzenie ramki danych (DataFrame) na podstawie danych z pliku
    df = pd.DataFrame(arff_data['data'], columns=columns)

    # 3. Podział danych na cechy (X) i etykiety (y)
    X = df.drop(columns=['status_pożyczki'])  # cechy wejściowe
    y = df['status_pożyczki']                 # etykieta klasy (dobry/zły klient)

    # Zamiana wartości kategorycznych w X na wartości liczbowe
    for col in X.columns:
        if X[col].dtype == object:
            le = LabelEncoder()
            X[col] = le.fit_transform(X[col])

    # Zamiana etykiet klas ('dobry', 'zły') na liczby: dobry = 0, zły = 1
    le_y = LabelEncoder()
    y = le_y.fit_transform(y)

    # 4. Pobranie klasyfikatorów do przetestowania
    classifiers = get_classifiers(seed_value)

    # 5. Lista na wyniki każdego klasyfikatora (Accuracy, TPR, TNR, GMean, AUC)
    results = []

    # 6. Wykonanie walidacji krzyżowej dla każdego klasyfikatora
    for name, clf in classifiers.items():
        print(f"\n=== Klasyfikator: {name} ===")

        # Własna funkcja walidacji krzyżowej
        metrics, mean_auc, avg_conf_matrix = cross_validate(clf, X, y,
            n_splits=n_splits,
            n_repeats=n_repeats,
        )

        # Wyświetlenie średniej macierzy konfuzji dla danego klasyfikatora
        print("Średnia macierz konfuzji:")
        print(avg_conf_matrix)

        # Zapisanie wyników metryk dla danego klasyfikatora
        results.append({
            "Classifier": name,
            "Accuracy": metrics['accuracy'],
            "TPR": metrics['tpr'],
            "TNR": metrics['tnr'],
            "GMean": metrics['gmean'],
            "AUC": mean_auc,
        })

    # 7. Wyświetlenie końcowego porównania wyników wszystkich klasyfikatorów
    print("\n=== Podsumowanie wyników ===")
    df_results = pd.DataFrame(results)
    print(df_results)

# Uruchomienie funkcji main po bezpośrednim uruchomieniu skryptu
if __name__ == "__main__":
    main()
