/**
     @name : insertTaskInAccount
     @author : Yan Nascimento
     @date : 06/08/2021
     @description : insert a new task in an account when Rating field is updated
     @log : 06/08/2021 - Yan Nascimento
 */

public with sharing class insertTaskInAccount {
    public static void insertTaskInAccount(List<Account> Accountlist) {
        List<Task> tk = new List<Task>();
        for (Account acct : Accountlist) {
            if (acct.Rating == 'Hot') {
                Task taskList = new Task();
                taskList.WhatId = acct.Id;
                taskList.Subject = 'By trigger' + acct.Name;
                taskList.Status = 'In Progress';
                taskList.Priority = 'High';
                tk.add(taskList);
            }
        }
        if (tk.size() > 0) {
            INSERT tk;
        }
    }
}