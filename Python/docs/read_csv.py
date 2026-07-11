import subprocess
import sys

# 1. Installer Pandas dans l'environnement actuel
subprocess.run([sys.executable, "-m", "pip", "install", "pandas"], check=True)

# 2. Importer Pandas SEULEMENT APRÈS l'installation
import pandas as pd

# 3. Lire le fichier CSV (en utilisant l'alias 'pd')
df = pd.read_csv('docs/data.csv')

# 4. Afficher les premières lignes
print(df.head())
