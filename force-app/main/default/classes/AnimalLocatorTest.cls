@IsTest
public with sharing class AnimalLocatorTest {
    @isTest
    static void AnimalLocatorMock1() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = 'chicken';
        System.debug('result: '+result+ ' == expectedResult: '+expectedResult);
        System.assertEquals(expectedResult, result);
    }
}
