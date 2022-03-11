@isTest
public with sharing class WrapperCepTst {
    @isTest
    public static void WrapperCepTst() {
        Test.setMock(HttpCalloutMock.class, new RESTToolsMock());
        WrapperCep wc = new WrapperCep(01001000);
        System.debug(wc.objCep.logradouro);
        System.assertEquals('Praça da Sé', wc.objCep.logradouro);
    }
}
