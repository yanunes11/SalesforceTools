/*
    * @author : Yan Nascimento
    * @Description : use schema methods
    * @log : 18/09/2021 - created
    * @log : 12/01/2021 - update (insertIntoCustomObject created)
*/

public class SchemaTools {
    //display the object name and its fields
    public static void basicSchema() {
        List<schema.SObjectType> gd = schema.getGlobalDescribe().values();
        for (schema.SObjectType ob : gd) {
            system.debug('Object name is: ' +ob.getDescribe().getName()+ ' fields are' +ob.getDescribe().fields.getMap().values());
        }
    }
    //retrieve the field names of an Object
    public static void retrieveFieldName() {
        List<String> addrLayout = new List<String>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get('OpportunityServiceItem__c');
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        for (String fieldName: fieldMap.keySet()) {  
            addrLayout.add(fieldMap.get(fieldName).getDescribe().getLabel());
        }
        system.debug(addrLayout);
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
    //retrieve object list and show the in a Selected options VF page
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
    //Create values to all writeable fields accordingly to the field type
    public static void insertIntoCustomObject(string customObjectName) {
        Map<String, Object> fieldvalues = new Map<String, Object>();
        fieldValues.put(String.valueOf(Schema.DisplayType.STRING), 'nascilead');
        fieldValues.put(String.valueOf(Schema.DisplayType.EMAIL), 'yanlead@gmail.com');
        fieldValues.put(String.valueOf(Schema.DisplayType.INTEGER), 0);
        fieldValues.put(String.valueOf(Schema.DisplayType.PHONE), '+5585994568345');
        fieldValues.put(String.valueOf(Schema.DisplayType.DATE), Date.today());
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(customObjectName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        Sobject anySObject = Schema.getGlobalDescribe().get(customObjectName).getDescribe().getSObjectType().newSObject();
        //system.debug('leadSchema: '+fieldMap);
        for (String fieldName: fieldMap.keySet()) {
            //get all the picklist fields label for Lead Object
            String fieldLabel = fieldMap.get(fieldName).getDescribe().getName();
            //system.debug('>>>fieldValueName: '+fieldLabel); show field label
            List<Schema.PicklistEntry> fieldValue = fieldMap.get(fieldName).getDescribe().getPicklistValues();
            List<String> strList = new List<String>();
            if (String.valueOf(fieldMap.get(fieldName).getDescribe().getType()) == 'PICKLIST') {
                for (Schema.PicklistEntry pe : fieldValue) {
                    if (fieldValue.size() > 0) {
                        //system.debug('fieldValue: '+pe.getValue()); //show the field values
                        strList.add(pe.getValue());
                    }
                }
            }
            if (strList.size() > 0) {
                anySObject.put(fieldLabel, strList[0]);
            }
        }
        //show all the key and values:
        // for (String key : fieldValues.KeySet()) {
        //     system.debug('key: '+key.toUpperCase()+ ' value: '+fieldValues.get(key));
        // }
        Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(customObjectName).getDescribe().fields.getMap();
        
        for (String key: objectFields.keySet()) {
            Schema.SObjectField field = objectFields.get(key);
            Schema.DescribeFieldResult dfr = field.getDescribe();
            Object fieldValue = fieldvalues.get(String.valueOf(dfr.getType()));
            if (fieldValue != null && dfr.isCreateable()) {
                anySObject.put(field, fieldValue);
            }
        }
        system.debug('SObject' + anySObject);
        
        //Database.insert(anySObject);
    }
}
