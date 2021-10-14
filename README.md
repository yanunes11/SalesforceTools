# Classes
1. AccountProcessor
    retrieve related contats with accounts, sum the total number of relations and assign it to Account.NumberField
2. BatchLeadProcessor
    batch apex that updates a field on Lead Object
3. ConvertLead
4. CreatingRecords
    Create real samples for testing
5. DatabaseQueries
    Query tools
6. DatabaseService
    insert using dabase
7. InsertingTaskInAccount
    insert a new task in an account when Rating field is updated
8. ProcessBuilderAction
    It is a base for creating an apex accessible by the Process Builder Tool
9. QueueableAddPrimaryContact
    Queueabe apex to assign contacts to related accounts using clone
10. ScheduleDailyLeadProcessor
    schedule job that change lead field value
11. SchemaTools
    1. display the object name and its fields
    2. show all the fields of an specific object
    3. retrieve the picklist values and send them to a visualforce page
    4. get child relationship from an object
    5. Get tab set describes for each app
    6. retrieve object list and show the in a Sleect options VF page
    7. Fetch only the Required fields

# Triggers
1. erroMessageBeforeDelete
    add a message erro BEFORE DELETE an object and do not allow the user to delete it
2. useBeforeInsert
    BEFORE INSERT that allows us to create a new account only if some fields have specific values