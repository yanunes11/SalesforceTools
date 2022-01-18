@isTest
public with sharing class AnimalLocatorTest {
    @isTest 
    static void getAnimalNameByIdTest() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String response = AnimalLocator.getAnimalNameById(1);
        String expectedValue = 'fluffy bunny';
        System.assertEquals(expectedValue, response);
    }
}
