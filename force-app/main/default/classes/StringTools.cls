/**
    @author : Yan Nascimento
    @description : Queueabe apex to assign contacts to related accounts using clone
    @log : 21/01/2021 : creation
 */

public with sharing class StringTools {
    public static Id getIdOnaURL(String url) {
        String objId = url.substring(url.lastIndexOf('/')+1);
        return (Id) objId;
    }
}
