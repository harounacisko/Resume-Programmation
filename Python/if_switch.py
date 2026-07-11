age : int = 23

if age < 0 or age == 0:
    print("Impossible")
elif age < 18:
    print("Mineur")
else:
    print("Majeur")
    
    
day : str = "Montag"
match day:
    case "Montag" | "Dienstag" | "Mittwoch" | "Donnerstag" | "Freitag":
        print("Werktag")
    case _:
        print("Wochenende")
        
        
# Ternär operator
status = "Ja" if age <= 18 else "Nein"

def get_day(day:str)->str:
    match day:
        case "Montag" | "Dienstag" | "Mittwoch" | "Donnerstag" | "Freitag":
            return "Werktag"
        case _:
            return "Wochenende"
        
        
# Der klassische Weg: Dictionary Mapping (Für Python < 3.10)
# In älteren Python-Versionen wurde ein Switch-Case meist elegant über ein Dictionary gelöst. 
# Die Methode .get() erlaubt es zudem, einen Standardwert (Default) zu definieren.
def get_color_hex(color_name):
    switcher = {
        "rot": "#FF0000",
        "blau": "#0000FF",
        "grün": "#00FF00"
    }
    # Der zweite Parameter ist der Default-Wert, falls der Key nicht existiert
    return switcher.get(color_name, "#000000")


print(get_color_hex("blau"))  # Ausgabe: #0000FF
print(get_color_hex("gelb")) 



# Definition der Funktion mit Type Hints für das Tuple
def get_user_daten() -> tuple[str, int]:
    name = "Test"
    age = 18
    return name, age  # Gibt beide Werte als Tuple zurück


# Werte entpacken (Unpacking)
aktueller_name, aktuelles_alter = get_user_daten()

print(aktueller_name)   # Ausgabe: Test
print(aktuelles_alter)  # Ausgabe: 18