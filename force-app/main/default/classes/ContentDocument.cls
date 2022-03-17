/**
     * @author: Yan Nascimento
     * @description: invoked by the uploadFile lwc to assign the the document uploaded to the account
     * @log: 09/03/2022
 */

public with sharing class ContentDocument {
    @AuraEnabled
    public static ContentVersion assignDocToAccount(String filename, String base64, String recordId) {
        ContentVersion cv = new ContentVersion();
        cv.title = fileName;
        cv.pathOnClient = fileName;
        cv.versionData = EncodingUtil.base64Decode(base64);
        insert cv;
        ContentVersion conDocId = [
            SELECT Id, ContentDocumentId 
            FROM ContentVersion 
            WHERE Id = :cv.Id
            LIMIT 1
        ];

        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.linkedEntityId = recordId;
        cdl.ContentDocumentId = condocId.ContentDocumentId;
        cdl.shareType = 'v';
        insert cdl;

        Account parentAccount = [SELECT Id, ParentId FROM Account WHERE Id = :recordId];
        if (String.isNotBlank(parentAccount.ParentId)) {
            ContentDocumentLink cdlParent = new ContentDocumentLink();
            cdlParent.ContentDocumentId = conDocId.ContentDocumentId;
            cdlParent.LinkedEntityId = parentAccount.ParentId;
            cdlParent.ShareType = 'v';
            insert cdlParent;
        }
        return cv;
    }
}
