
# with
Le mot-clé with en Python sert à gérer proprement et automatiquement l'ouverture et la fermeture des ressources (comme des fichiers, des connexions à des bases de données ou des verrous réseau).On appelle cela un Gestionnaire de Contexte (Context Manager).

## Le problème sans with
Lorsque tu ouvres un fichier pour écrire dedans, Python réserve ce fichier. Si ton programme plante ou si tu oublies de le fermer, le fichier peut rester verrouillé ou corrompu.

## Sans le mot-clé with :
f = open("mon_fichier.txt", "w")
f.write("Bonjour")
## Si une erreur survient ici, la ligne suivante n'est jamais exécutée !
f.close()  # Tu dois penser à le fermer manuellement

## La solution avec with
Avec with, Python garantit que le fichier sera fermé automatiquement, quoi qu'il arrive (même si le code plante au milieu).

## Avec le mot-clé with :
with open("mon_fichier.txt", "w") as f:
    f.write("Bonjour Harouna")
    # Tu fais ton travail ici...

## Dès que tu sors du bloc (fin de l'indentation), 
## Python ferme le fichier TOUT SEUL en arrière-plan.

