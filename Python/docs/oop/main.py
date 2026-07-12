from person import Person
p1 = Person("Hrn","csk")
p1.name= "Harouna"
p1.age=37

p2 = Person("CSK",35)
print(f"{p1.name} is {p1.age} years old.")
print( p2.name , " is ", p2.age, " years old")
print(Person.get_count())