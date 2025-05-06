# Import potrzebnych bibliotek
import pandas as pd
import arff

# Wczytanie pliku ARFF
with open('263898L2_2.arff', 'r') as f:
    arff_data = arff.load(f)

# Przekształcenie danych do DataFrame'a
# Klucze arff_data to: 'attributes', 'data', 'relation', 'description'
columns = [attr[0] for attr in arff_data['attributes']]
df = pd.DataFrame(arff_data['data'], columns=columns)

# Filtrowanie danych:
# Usuwamy rekordy, gdzie status_pożyczki == 'odmowa' lub kwota_kredytu > 900
df_filtered = df[
    (df['status_pożyczki'] != 'odmowa') &
    (df['kwota_kredytu'].astype(float) <= 900)
]

# Usuwamy kolumnę "status_pożyczki"
df_filtered = df_filtered.drop(columns=['status_pożyczki'])

# Przygotowujemy nowy plik ARFF,
# Modyfikujemy sekcję @attribute: usuwamy definicję status_pożyczki
new_attributes = [attr for attr in arff_data['attributes'] if attr[0] != 'status_pożyczki']

# Składamy wszystko do nowego słownika ARFF
new_arff_data = {
    'relation': arff_data['relation'],
    'attributes': new_attributes,
    'data': df_filtered.values.tolist()
}

# Zapisujemy nowy plik ARFF
with open('263898L3_2.arff', 'w') as f:
    arff.dump(new_arff_data, f)

print("Nowy plik 263898L3_2.arff został utworzony!")