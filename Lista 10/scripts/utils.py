import random
import numpy as np


def set_seed(seed_value: int):
    """
    Ustawia ziarno losowości (seed) dla bibliotek random i numpy,
    aby zapewnić powtarzalność wyników eksperymentów.

    Args:
        seed_value (int): Wartość ziarna losowości.

    Returns:
        None
    """

    # Ustawienie ziarna dla modułu random (Python)
    random.seed(seed_value)

    # Ustawienie ziarna dla biblioteki numpy
    np.random.seed(seed_value)
