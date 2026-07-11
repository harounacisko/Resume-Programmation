#class Person:
#    def __init__(self,nom,age,adresse):
#        self.__nom = nom        # .__ private
#        self._age = age         #  ._ protected
#        self.adresse = adresse  # . public
     
#    def get_name(self):  # Méthode publique
#        return self.__nom
    
#    def _get_name(self): # Méthode protégée
#        return self.__nom
    
#    def __get_name(self): # Méthode privée
#        return self.__nom
#
#
class Person:
    
    #def __init__(self):
    #    pass # pass indique que le block est vide
    
    def __init__(self,name ,age):
        self.__name=name 
        self.__age=age 
    #Le décorateur @property en Python est un outil puissant qui permet de transformer une méthode (une fonction) 
    #pour qu'elle s'utilise comme une simple variable (un attribut).
    
    @property   
    def name(self):
        return self.__name
    
    #Il sert spécifiquement à intercepter le moment où quelqu'un essaie de modifier la valeur d'un attribut 
    #en utilisant le signe égal (=).
    @name.setter
    def name(self,name):
        self.__name=name
    
    @property
    def age(self):
        return self.__age
    
    @age.setter
    def age(self,age):
        self.__age = age
    
