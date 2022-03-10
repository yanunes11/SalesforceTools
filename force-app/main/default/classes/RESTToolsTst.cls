@isTest
public with sharing class RESTToolsTst {
    @isTest
    public static void getCEPTest() {
        Test.setMock(HttpCalloutMock.class, new RESTToolsMock());
        Map<String, Object> addressFields = RESTTools.getCEP(01001000);
        System.assertEquals('Praça da Sé', (String)addressFields.get('logradouro'));
    }
}
