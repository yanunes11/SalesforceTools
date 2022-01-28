/**
    @author : Yan Nascimento
    @description : get a url, brake the last / to get the Id at the end
    @log : 21/01/2021 : creation
 */

public with sharing class StringTools {
    public static Id getIdOnaURL(String url) {
        String objId = url.substring(url.lastIndexOf('/')+1);
        return (Id) objId;
    }
}
