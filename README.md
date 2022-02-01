# Classes
1. AccountProcessor: retrieve related contats with accounts, sum the total number of relations and assign it to Account.NumberField
2. BatchDuplicatedContacts : batch apex that merge duplicated contacts
3. BatchLeadProcessor: batch apex that updates a field on Lead Object
4. ContactTgrHnd : trigger handler
5. ConvertLead
6. CreatingRecords: Create real samples for testing
7. DatabaseQueries: Query tools
8. DatabaseService: insert using dabase
9. InboundEmailService: retrieve email information to create a task
10. InsertingTaskInAccount: insert a new task in an account when Rating field is updated
11. InterfaceComparable: comparable interface to sort a list by the age
12. ProcessBuilderAction: It is a base for creating an apex accessible by the Process Builder Tool
13. QueueableAddPrimaryContact: Queueabe apex to assign contacts to related accounts using clone
14. QueueableCounter: queueable method that increments a Counter Field on the contact when an email is changed
15. ScheduleDailyLeadProcessor: schedule job that change lead field value
16. ScheduleDailyDuplicateContacts: schedule job that invokes the class BatchDuplicatedContacts
17. SchemaTools
18. SendEmail: different ways to send email
19. StringTools: tools to use in a string
20. createVatANDNationalID
21. creatingRecords: tool to create records
22. mapTools: tool to use with a map
