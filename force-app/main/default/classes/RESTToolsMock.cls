@isTest
public with sharing class RESTToolsMock implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"cep": "01001-000","logradouro": "Praça da Sé","complemento": "lado ímpar","bairro": "Sé","localidade": "São Paulo","uf": "SP","ibge": "3550308","gia": "1004","ddd": "11","siafi": "7107"}');
        response.setStatusCode(200);
        return response;
    }
}
