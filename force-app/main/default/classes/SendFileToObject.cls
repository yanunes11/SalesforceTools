public with sharing class SendFileToObject {
    @AuraEnabled(cacheable=true)
    public static void sendFileToAccount(String uploadedFiles, String myRecordId) {
        System.debug('myRecordId: ');
        System.debug(myRecordId);
        Object uploadedFilesDeserialized = (Object) JSON.deserializeUntyped(uploadedFiles);
        System.debug('uploadedFilesDeserialized: '+uploadedFilesDeserialized);
    }
}
