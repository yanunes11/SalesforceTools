/**
    @author : Yan Nascimento
    @date : 11/10/2021
    @description : It is a base for creating an apex accessible by the Process Builder Tool
    @log : 11/10/2021 : creation
 */

public with sharing class ProcessBuilderAction {
    //label will show up on user screen when it it was choosen on 'Action Type/Apex' on the Process Builder
    @InvocableMethod (label='Action Name')
    public static void action() {
        System.debug('ProcessBuilderAction.action apex class invoked by a Process Builder');
    }
}
