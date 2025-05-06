# Import potrzebnych bibliotek
import pandas as pd
import arff
import math


# Funkcja do dyskretyzacji zmiennych numerycznych
def discretize_numeric_features(df, target_attribute, n_bins):
    """
    Funkcja dokonująca dyskretyzacji zmiennych numerycznych na n przedziałów.
    :param df: ramka danych
    :param target_attribute: nazwa kolumny klasy (nie dyskretyzujemy jej)
    :param n_bins: liczba przedziałów
    :return: ramka danych z dyskretyzowanymi zmiennymi numerycznymi
    """
    df_discretized = df.copy()

    for col in df.columns:
        if col == target_attribute:
            continue  # Pomijamy zmienną klasy

        # Sprawdzenie czy kolumna jest numeryczna (dtype == float lub int)
        if pd.api.types.is_numeric_dtype(df[col]):
            # Dyskretyzacja na n_bins równych przedziałów
            df_discretized[col] = pd.cut(df[col].astype(float), bins=n_bins, labels=False)

    return df_discretized


# Funkcja do obliczania entropii
def entropy(series, base):
    """
    Funkcja obliczająca entropię dla pojedynczej serii wartości.
    :param series: seria wartości (np. klasa decyzyjna)
    :param base: podstawa logarytmu (np. 2, e, 10)
    :return: wartość entropii
    """
    value_counts = series.value_counts(normalize=True)
    ent = -sum(p * math.log(p, base) for p in value_counts if p > 0)
    return ent


# Funkcja do obliczania InfoGain i SplitInfo dla pojedynczego atrybutu
def info_gain_split_info(df, attribute, target, base):
    """
    Funkcja obliczająca InfoGain oraz SplitInfo dla podanego atrybutu względem klasy.
    :param df: ramka danych
    :param attribute: nazwa atrybutu
    :param target: nazwa kolumny klasy
    :param base: podstawa logarytmu
    :return: (InfoGain, SplitInfo)
    """
    total_entropy = entropy(df[target], base)
    values = df[attribute].unique()

    weighted_entropy = 0
    split_info = 0

    for value in values:
        subset = df[df[attribute] == value]
        proportion = len(subset) / len(df)
        if proportion > 0:
            weighted_entropy += proportion * entropy(subset[target], base)
            split_info -= proportion * math.log(proportion, base)

    info_gain = total_entropy - weighted_entropy
    return info_gain, split_info


# Funkcja główna
def main():
    # Wczytanie pliku ARFF
    with open('data/263898L3_1.arff', 'r') as f:
        arff_data = arff.load(f)

    # Przekształcenie danych do DataFrame'a
    columns = [attr[0] for attr in arff_data['attributes']]
    df = pd.DataFrame(arff_data['data'], columns=columns)

    # Ustawienia - zmienna klasy i podstawa logarytmu
    target_attribute = 'status_pożyczki' # klasa decyzyjna
    log_base = 2  # Podstawa logarytmu (2 - jak w Wece)
    n_bins = 5 # Liczba przedziałów do dyskretyzacji

    # Dyskretyzacja zmiennych numerycznych
    df = discretize_numeric_features(df, target_attribute, n_bins)

    # Obliczenie entropii całkowitej zbioru
    total_ent = entropy(df[target_attribute], log_base)
    print(f"Entropia całego zbioru: {total_ent:.4f}\n")

    # Obliczenia dla każdego atrybutu
    results = []

    for attr in df.columns:
        if attr == target_attribute:
            continue

        info_gain, split_info = info_gain_split_info(df, attr, target_attribute, log_base)

        if split_info > 0:
            gain_ratio = info_gain / split_info
        else:
            gain_ratio = 0

        results.append((attr, info_gain, split_info, gain_ratio))

    # Posortowanie wyników według GainRatio malejąco
    results.sort(key=lambda x: x[3], reverse=True)

    # Wyświetlenie wyników
    print(f"{'Atrybut':30s} {'InfoGain':>10s} {'SplitInfo':>12s} {'GainRatio':>12s}")
    print("-" * 70)
    for attr, ig, si, gr in results:
        print(f"{attr:30s} {ig:10.4f} {si:12.4f} {gr:12.4f}")


if __name__ == "__main__":
    main()
