########################################## List #######################################
users : list[str] =[]
users.append("Harouna")
users.append("Diéba")

for nom in users:
    print(nom)
    
# Or
for index, nom in enumerate(users):
    print(f"User-Position {index} : {nom}")

######################################### tuple ######################################
myTuple : tuple =()
myTuple = ("je"," suis"," entrain"," d'", " apprendre"," Python")

for mot in myTuple:
    print(mot)

for index,mot in enumerate(myTuple):
    print(f"Position {index} : {mot}")
    
########################################## dict #######################################
mySet : set = set()
mySet={"test","build","deploy","build"}
mySet.add("package")

for name in mySet:
    print(name)

for index,name in enumerate(mySet):
      print(f"{index} : {name}.")
      
########################################## dict #######################################
userInfos : dict[str,int] = {}
userInfos["Harouna"]=37
userInfos["Hrn"]=36
 
for nom, age in userInfos.items():
    print(f"{nom} est agé de {age}.")

# Parcourir uniquement les clés : .keys() # Ces deux syntaxes font exactement la même chose :
for nom in userInfos.keys():
    print(nom)

for nom in userInfos:
    print(nom)

# Parcourir uniquement les valeurs : .values()
for age in userInfos.values():
    print(age)