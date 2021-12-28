/**
    @author : Yan Nascimento
    @date : 20/12/2021
    @description : batch apex that merge duplicated contacts
    @log : 20/12/2021 : creation
 */

public with sharing class BatchDuplicatedContacts implements Database.Batchable<sObject>, Database.Stateful {
    private Integer recordsProcessed = 0;
    public String query;
    public String preQuery;
<<<<<<< HEAD
    public Set<String> emails;
=======
    Set<String> emails;
>>>>>>> master
    public List<Contact> allContacts;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        preQuery = 'SELECT COUNT(Id) qty, Email FROM Contact WHERE Email != NULL GROUP BY Email HAVING COUNT(Id) > 1';
        emails = new Set<String>();
        for (AggregateResult ag : Database.query(preQuery)) {
            emails.add((String)ag.get('Email'));
        }
        query = 'SELECT Email FROM Contact WHERE Email IN :emails';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        Map<String, List<Contact>> contactMap = new Map<String, List<Contact>>();
        for (Contact sp : scope) {
            List<Contact> ctList = contactMap.containsKey(sp.Email) ? contactMap.get(sp.Email) : new List<Contact>();
            if (ctList.size() <= 4) {
                ctList.add(sp);
                contactMap.put(sp.Email, ctList);
                recordsProcessed += 1;
            }
        }
        allContacts = [SELECT Id, Email FROM Contact WHERE Email IN :contactMap.keySet() AND Id NOT IN :scope];
        for (Contact ct : allContacts) {
            List<Contact> ctList = contactMap.containsKey(ct.Email) ? contactMap.get(ct.Email) : new List<Contact>();
            if (ctList.size() <= 4) {
                ctList.add(ct);
                contactMap.put(ct.Email, ctList);
            }
        }
        allContacts = [SELECT Id, Email FROM Contact WHERE Email In :contactMap.keySet() AND Id NOT IN :scope];
        for (Contact ct : allContacts) {
            List<Contact> ctList = contactMap.containsKey(ct.Email) ? contactMap.get(ct.Email) : new List<Contact>();
            if (ctList.size() <= 4) {
                ctList.add(ct);
                contactMap.put(ct.Email, ctList);
            }
        }
        for (String ls : contactMap.keySet()) {
            List<Contact> ctList = contactMap.get(ls);
            if (ctList.size() > 1) {
                for (Integer i = 1; i < ctList.size(); i++) {
                    if (ctList[0].Id != ctList[i].Id) {
                        Database.merge(ctList[0], ctList[i].Id, false);
                    }
                }
            }
        }
    }

    public void finish(Database.BatchableContext bc) {
        AsyncApexjob job = [
            SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()
        ];
        System.debug('recordsProcessed: '+this.recordsProcessed);
        System.debug('Job Information: '+job);
    }
}
