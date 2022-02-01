/**
    @author : Yan Nascimento
    @description : comparable interface to sort a list by the age
    @log : 01/02/2022: creation
 */

public with sharing class InterfaceComparable implements Comparable {
    public Integer age;
    public String name;

    //Constructor
    public InterfaceComparable(Integer agePar, String namePar) {
        age = agePar;
        name = namePar;
    }

    public Integer compareTo(Object compareTo) {
        InterfaceComparable ageCt = (InterfaceComparable)compareTo;
        if (age == ageCt.age) return 0;
        if (age > ageCt.age) return 1;
        return -1;
    }
}
