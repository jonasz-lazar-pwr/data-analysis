from sklearn.base import ClassifierMixin
from sklearn.dummy import DummyClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.neural_network import MLPClassifier
from sklearn.naive_bayes import GaussianNB

# Konfiguracje hiperparametrów dla DecisionTree
decision_tree_configs = {
    "DecisionTree_depth5": {"max_depth": 5},
    "DecisionTree_depth10": {"max_depth": 10},
    "DecisionTree_unlimited": {"max_depth": None},
}

# Konfiguracje hiperparametrów dla SVM
svm_configs = {
    "SVM_C0.1": {"C": 0.1},
    "SVM_C1.0": {"C": 1.0},
    "SVM_C10.0": {"C": 10.0},
}

# Konfiguracje hiperparametrów dla MLP
mlp_configs = {
    "MLP_50": {"hidden_layer_sizes": (50,)},
    "MLP_100": {"hidden_layer_sizes": (100,)},
    "MLP_50_50": {"hidden_layer_sizes": (50, 50)},
}

def get_classifiers(seed_value: int) -> dict[str, ClassifierMixin]:
    """
    Zwraca słownik dostępnych klasyfikatorów do porównania.
    Każdy klasyfikator jest gotowy do użycia w walidacji krzyżowej.

    Args:
        seed_value (int): Wartość ziarna losowości dla powtarzalności wyników.

    Returns:
        dict: Słownik, w którym kluczem jest nazwa klasyfikatora (str),
            a wartością jego instancja (np. obiekt klasy scikit-learn).
    """

    classifiers = {}

    # ZeroRule – zawsze przewiduje najczęściej występującą klasę (np. zawsze 'dobry')
    classifiers["ZeroRule"] = DummyClassifier(strategy="most_frequent")

    # DecisionTree - oparty na drzewie decyzyjnym (standardowy, szybki i czytelny model)
    for name, params in decision_tree_configs.items():
        classifiers[name] = DecisionTreeClassifier(**params, random_state=seed_value)

    # SVM - maszyna wektorów nośnych
    for name, params in svm_configs.items():
        classifiers[name] = SVC(**params, probability=True, random_state=seed_value)

    # MLP - oparty na sztucznej sieci neuronowej
    for name, params in mlp_configs.items():
        classifiers[name] = MLPClassifier(**params, max_iter=1000, random_state=seed_value)

    # NaiveBayes – szybki, prosty, zakłada niezależność cech
    classifiers["NaiveBayes"] = GaussianNB()

    return classifiers
