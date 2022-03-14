public with sharing class ageContact implements Comparable {
    public Integer age;
    public String name;

    //Constructor
    public ageContact(Integer agePar, String namePar) {
        age = agePar;
        name = namePar;
    }

    public Integer compareTo(Object compareTo) {
        ageContact ageCt = (ageContact)compareTo;
        if (age == ageCt.age) return 0;
        if (age > ageCt.age) return 1;
        return -1;
    }
}
