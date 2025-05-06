from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import confusion_matrix, roc_auc_score
from evaluation import compute_metrics
import numpy as np
import pandas as pd
from typing import Union, Tuple
from sklearn.base import ClassifierMixin


def cross_validate(
    classifier: ClassifierMixin,
    X: Union[pd.DataFrame, np.ndarray],
    y: Union[pd.Series, np.ndarray],
    n_splits: int,
    n_repeats: int,
) -> Union[None, Tuple[dict[str, float], float, np.ndarray]]:
    """
    Własna implementacja walidacji krzyżowej z możliwością powtórzeń.

    Args:
        classifier (ClassifierMixin): Obiekt klasyfikatora zgodny z API scikit-learn.
        X (pd.DataFrame | np.ndarray): Dane wejściowe (cechy).
        y (pd.Series | np.ndarray): Etykiety klas (0 = dobry, 1 = zły).
        n_splits (int): Liczba foldów w walidacji krzyżowej.
        n_repeats (int): Liczba powtórzeń całej walidacji.

    Returns:
        None, jeśli return_metrics=False, lub:
        tuple:
            - metrics (dict[str, float]): Accuracy, TPR, TNR, GMean,
            - mean_auc (float): Średnia wartość AUC,
            - avg_conf_matrix (np.ndarray): Średnia macierz konfuzji.
    """

    all_conf_matrices = []  # lista wszystkich macierzy konfuzji
    aucs = []               # lista wartości AUC

    for repeat in range(n_repeats):
        # StratifiedKFold zapewnia zbalansowany podział klas w każdym foldzie
        skf = StratifiedKFold(n_splits=n_splits, shuffle=True, random_state=repeat)

        for train_idx, test_idx in skf.split(X, y):
            # Podział danych na treningowe i testowe
            X_train, X_test = X.iloc[train_idx], X.iloc[test_idx]
            y_train, y_test = y[train_idx], y[test_idx]

            # Uczenie klasyfikatora
            classifier.fit(X_train, y_train)
            y_pred = classifier.predict(X_test)

            # Predykcja prawdopodobieństw do AUC
            if hasattr(classifier, "predict_proba"):
                y_scores = classifier.predict_proba(X_test)[:, 1]
            else:
                y_scores = classifier.decision_function(X_test)

            # Macierz konfuzji i AUC
            conf_matrix = confusion_matrix(y_test, y_pred, labels=[0, 1])
            all_conf_matrices.append(conf_matrix)

            auc = roc_auc_score(y_test, y_scores)
            aucs.append(auc)

    # Uśrednienie wyników
    avg_conf_matrix = np.mean(all_conf_matrices, axis=0)
    metrics = compute_metrics(avg_conf_matrix)
    mean_auc = np.mean(aucs)

    return dict(metrics), float(mean_auc), np.asarray(avg_conf_matrix)
