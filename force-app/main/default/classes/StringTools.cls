/**
    @author : Yan Nascimento
    @description : get a url, brake the last / to get the Id at the end
    @log : 21/01/2021 : creation
    03/03/2022 : forceInputJsonToMap
 */

public with sharing class StringTools {
    public static Id getIdOnAnURL(String url) {
        String objId = url.substring(url.lastIndexOf('/')+1);
        return (Id) objId;
    }

    public static Map<String, Object> forceInputJsonToMap(String inputJson) {
        String formattedStr = inputJson.removeStart('[{').removeEnd('}]').remove('\"').remove('{').deleteWhitespace();
        List<String> objList = formattedStr.split('},');
        Map<String, Object> objMap = new Map<String, Object>();
        for (String d : objList) {
            Map<String, String> listMap = new Map<String, String>();
            List<String> listStr = d.split(',');
            for (String s : listStr) {
                listMap.put(s.split(':')[0], s.split(':')[1]);
            }
            objMap.put(listMap.get('documentId'), listMap);
        }
        return objMap;
    }
}
