# try : 
## Contient le code "risqué" qui peut potentiellement générer une erreur (une exception).

# except : 
## S'exécute uniquement si une erreur survient dans le bloc try. Il sert à attraper l'erreur pour éviter que le programme ne plante.

# else : 
## S'exécute uniquement si aucune erreur n'est survenue dans le bloc try.

# finally:
## S'exécute DANS TOUS LES CAS

age : int = 23
try:
    print("Hi")
    age/1
except Exception as e:
    print(e) 
else:
    print("No error in try block")
finally:
    print("END")
    
try:
    # Code à tester
    numerateur = 10
    denominateur = int(input("Entrez un diviseur : "))
    resultat = numerateur / denominateur

except ZeroDivisionError:
    # S'exécute si l'utilisateur saisit 0
    print("Erreur : Impossible de diviser par zéro !")

except ValueError:
    # S'exécute si l'utilisateur saisit du texte au lieu d'un nombre
    print("Erreur : Vous devez entrer un nombre entier.")

else:
    # S'exécute uniquement si aucune exception n'a été levée
    print(f"Bravo, le calcul a réussi ! Le résultat est : {resultat}")
