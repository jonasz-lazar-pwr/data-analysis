import numpy as np


def compute_metrics(conf_matrix: np.ndarray) -> dict:
    """
    Oblicza podstawowe miary jakości klasyfikacji na podstawie macierzy konfuzji (2x2).

    Args:
        conf_matrix (np.ndarray): Macierz konfuzji w formacie:
            [[TN, FP],
             [FN, TP]]

    Returns:
        dict: Słownik zawierający następujące metryki:
            - 'accuracy': Dokładność klasyfikacji,
            - 'tpr': True Positive Rate (czułość),
            - 'tnr': True Negative Rate (specyficzność),
            - 'gmean': Średnia geometryczna TPR i TNR.
    """

    # Rozpakowanie wartości z macierzy konfuzji:
    # tn - True Negative, fp - False Positive
    # fn - False Negative, tp - True Positive
    tn, fp, fn, tp = conf_matrix.ravel()

    # Accuracy: stosunek poprawnych predykcji (TP + TN) do wszystkich predykcji
    accuracy = (tp + tn) / (tp + tn + fp + fn)

    # TPR (czułość): jaki procent rzeczywistych pozytywnych przypadków został poprawnie wykryty
    tpr = tp / (tp + fn) if (tp + fn) > 0 else 0

    # TNR (specyficzność): jaki procent rzeczywistych negatywnych przypadków został poprawnie wykryty
    tnr = tn / (tn + fp) if (tn + fp) > 0 else 0

    # GMean: średnia geometryczna czułości i specyficzności
    gmean = np.sqrt(tpr * tnr)

    # Zwracamy wyniki jako słownik
    return {
        "accuracy": accuracy,
        "tpr": tpr,
        "tnr": tnr,
        "gmean": gmean,
    }
