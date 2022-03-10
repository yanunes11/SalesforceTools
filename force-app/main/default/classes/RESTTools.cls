/**
     @author : Yan Nascimento
     @description : retrieve values from a inserted cep
     @log : 31/01/2022 - created
 */

public with sharing class RESTTools {
    public static Map<String, Object> getCEP(Integer cep) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+cep+'/json/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, Object> results = new Map<String, Object>();
        if(response.getStatusCode() == 200) {
            results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        } else {
            System.debug('wrong response: '+response);
        }
        return results;
    }
}