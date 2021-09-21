/*
    * @author : Yan Nascimento
    * @Date : 18/09/2021
    * @Description : use schema methods
    * @log : 18/09/2021 - created
*/

public class testSchemaMode {
    //display the object name and its fields
    public static void basicSchema() {
        List<schema.SObjectType> gd = schema.getGlobalDescribe().values();
        for (schema.SObjectType ob : gd) {
            system.debug('Object name is: ' +ob.getDescribe().getName()+ ' fields are' +ob.getDescribe().fields.getMap().values());
        }
    }
    //show all the fields a specific object.you just need to replace the account with the other object
    public static void showAllFieldsOfObject() {
        schema.DescribeSObjectResult a_desc = Account.sObjectType.getDescribe();
        Map<string, schema.SObjectField> a_field = a_desc.fields.getMap();
        for (schema.SObjectField fld : a_field.values()) {
            system.debug(fld);
        }
    }
    //retrieve the picklist values and send them to a visualforce page
    public List<SelectOption> getPicknames() {
        List<SelectOption> options = new List<SelectOption>();
        schema.DescribeFieldResult cityOpp = schema.SObjectType.Opportunity.fields.StageName.getsObjectField().getDescribe();
        //if you want to retreive account insta of opportunity
        schema.DescribeFieldResult cityAcc = schema.SObjectType.Account.fields.Ownership.getsObjectField().getDescribe();
        //create the None option in the VF page
        options.add(new SelectOption('--None--', '--None--'));
        for (PicklistEntry ent : cityOpp.getPicklistValues()) {
            options.add(new SelectOption(ent.getValue(), ent.getLabel()));
        }
        Return options;
        /*<!--Visual force that displays the fields-->
			<apex:page controller="testSchemaMode">
                <apex:form>
                    <apex:outputLabel value="Stage"/>
                    <apex:selectList size="1">
                        <apex:selectOptions value="{!pickNames}"></apex:selectOptions>
                    </apex:selectList>
                </apex:form>
            </apex:page>
		*/
    }
    //get child  relationship from an object
    public static void findChildRelationship() {
        schema.DescribeSObjectResult describeResult = Opportunity.sObjectType.getDescribe();
        //it gives Account  object properties or describe results;
        List<schema.ChildRelationship> listChildRelationships = describeResult.getChildRelationShips();
        //It gives you all the childrelationships associated with the account.To get relationship names from the above
        for (schema.ChildRElationship relName : listChildRElationships) {
            system.debug('Relationship Name: '+relName.getRelationshipName());
        }
    }
    //Get tab set describes for each app
    public static void getTabsOfApp() {
        List<schema.DescribeTabSetResult> tabSecDesc = schema.describeTabs();
        //just run to see all the tabs
        system.debug('tabsecDEsc: '+tabSecDesc);
        
        // Iterate through each tab set describe for each app and display the info
        for (DescribeTabSetResult tsr : tabSecDesc) {
            String appLabel = tsr.getLabel();
            if (appLabel == 'Service') {
                List<schema.DescribeTabResult> tabDesc = tsr.getTabs();
                system.debug('--tab Information for the sales app--');
                for (schema.DescribeTabResult tr : tabDesc) {
                    system.debug('Label: '+tr.getLabel());
                }
            }
        }
    }
    //retrieve object list and show the in a Sleect options VF page
    public List<SelectOption> getObjNames() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--None--','--None--'));
        List<schema.SObjectType> globalDesc = schema.getGlobalDescribe().values();
        for (schema.SObjectType objType : globalDesc) {
            options.add(new SelectOption(objType.getDescribe().getName(), objType.getDescribe().getName()));
        }
        Return options;
        /*the VF Page to display the Objects
            <apex:page controller="ObjectRetrieveData">
                <apex:form>
                    <apex:outputLabel value="All Objects"/>
                    <apex:selectList size="1">
                        <apex:selectOptions value="{!objNames}"></apex:selectOptions>
                    </apex:selectList>
                </apex:form>
            </apex:page>
        */
    }
    //Fetch only the Required fields
    public static void metadataObjectView() {
        //See all the Objects, but desorganized
        Map<string, schema.SObjectType> allObjects = schema.getGlobalDescribe();
        system.debug('All the objects: '+allObjects);

        //See one especific Object metadata - ONE WAY
        schema.SObjectType oneObject = allObjects.get('Account');
        system.debug('Account: '+OneObject.getDescribe());
        //See one especific Object metadata - SECOND WAY
        schema.DescribeSObjectResult objectDescription = oneObject.getDescribe();
        system.debug('Describe for Account: ' +objectDescription);

        //See the Object Fields metadata
        Map<string, schema.SObjectField> objectFields = objectDescription.fields.getMap();
        system.debug('Fields of the Object: '+objectFields);

        //Find out only the required fields
        List<string> requiredFieldsList = new List<string>();
        for (string f : objectFields.KeySet()) {
            schema.DescribeFieldResult describeField = objectFields.get(f).getDescribe();
            if (describeField.isCreateable() && !describeField.isNillable() && !describeField.isDefaultedOnCreate()) {
                requiredFieldsList.add(f);
            }
        }
        system.debug('Required Fields: '+requiredFieldsList);
    }
}