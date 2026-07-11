def addition(a: int, b: int) -> int:
    print(a+b)
    return a + b

# Ce bloc s'exécute UNIQUEMENT si on lance "calcul.py" directement
if __name__ == "__main__":
    print("--- Mode Test du Calculateur ---")
    resultat = addition(5, 5)
    print(f"5 + 5 = {resultat}")
