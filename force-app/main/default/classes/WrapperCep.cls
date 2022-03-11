/**
     @author : Yan Nascimento
     @description : creates a wrapper class
     @log : 31/01/2022 - created
 */

public with sharing class WrapperCep {
    public WrapperAddress objCep {get;set;}

    public WrapperCep(Integer cepValue) {
        Map<String, Object> addressValues = RESTTools.getCEP(cepValue);
        objCep = new WrapperAddress();
        objCep.cep = (String)addressValues.get('cep');
        objCep.logradouro = (String)addressValues.get('logradouro');
        objCep.bairro = (String)addressValues.get('bairro');
        objCep.localidade = (String)addressValues.get('localidade');
        objCep.uf = (String)addressValues.get('uf');
    }
    
    public class WrapperAddress {
        public String cep {get;set;}
        public String logradouro {get;set;}
        public String bairro {get;set;}
        public String localidade {get;set;}
        public String uf {get;set;}
    }
}
