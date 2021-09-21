# Classes
1. AccountProcessor
    retrieve related contats with accounts, sum the total number of relations and assign it to Account.NumberField
2. DatabaseService
    insert using dabase
3. SchemaTools
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