package org.hrn;

import java.util.*;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    static void main() {
        /*********************************   Array     *************************************/
        Person[] arrayPerson = {new Person("hrn",36),new Person("csk",37)};

        /*********************************   list     *************************************/

        //List<Person> personList = Arrays.asList(arrayPerson);
        // Ici personList est immutable
        //List<Person> personList = List.of(new Person("hrn",36),new Person("csk",37));
        List<Person> personList= new ArrayList<>(Arrays.asList(new Person("hrn",36),new Person("csk",37)));
        //personList.add(new Person("Jean",36));
        for (Person person : personList) {
            System.out.println(person.getName());
        }

        //Iterator (Obligatoire pour supprimer)
        Iterator<Person> iteratorList = personList.iterator();
        while (iteratorList.hasNext()) {
            Person person = iteratorList.next();
            if(person.getName().equals("hrn")){
                iteratorList.remove();
            }
        }
        /**
         * personList.removeIf(element -> element.getName().equals("hrn"));
         */


        /*********************************   Set     *************************************/

        /**
         * Set<String> set = new HashSet<>();
         * set.add("Harouna");
         */
        /**
         *  Set<String> set = Set.of("hrn","csk","harouna");
         */

        Set<String> set = new HashSet<>(Set.of("hrn","csk","harouna"));
        for (String s : set) {
            System.out.println(s);
        }

        //Iterator (Pour supprimer des éléments)
        Iterator<String> iteratorSet = set.iterator();

        while (iteratorSet.hasNext()) {
            String s = iteratorSet.next();
            if("harouna".equals(s)){
                iteratorSet.remove();
            }
        }
        // Supprime "harouna" de manière compacte
        set.removeIf(s -> "harouna".equals(s));

        /*********************************   Map     *************************************/

        //Map<String, Integer> map = Map.of("Java", 21, "Python", 3, "C++", 20);
        Map<String, Integer> map = new HashMap<>(Map.of("Java", 21, "Python", 3, "C++", 20));
        /**
         * Map<String, Integer> map = new HashMap<>();
         * map.put("Java", 21);
         * map.put("Python", 3);
         */
        map.forEach((cle, valeur) -> {
            System.out.println("Clé : " + cle + ", Valeur : " + valeur);
        });

        // La boucle For-Each sur entrySet()
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            System.out.println("Clé : " + entry.getKey() + ", Valeur : " + entry.getValue());
        }

        //Parcourir uniquement les Clés ou uniquement les Valeurs
        // Uniquement les clés
        for (String cle : map.keySet()) {
            System.out.println("Clé : " + cle);
        }

        // Uniquement les valeurs
        for (Integer valeur : map.values()) {
            System.out.println("Valeur : " + valeur);
        }


        //Iterator (Obligatoire pour supprimer)
        Iterator<Map.Entry<String, Integer>> iteratorMap = map.entrySet().iterator();
        while (iteratorMap.hasNext()) {
            Map.Entry<String, Integer> entry = iteratorMap.next();
            if (entry.getKey().equals("Python")) {
                iteratorMap.remove(); // Supprime l'entrée de la Map en toute sécurité
            }
        }

        // Supprime l'entrée si la clé est "Python"
        map.entrySet().removeIf(entry -> entry.getKey().equals("Python"));
    }
}
