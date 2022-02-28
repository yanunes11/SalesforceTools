<<<<<<< HEAD
# Purpose
A lot of different usual tools to work on Salesforce developments

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
=======
# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
>>>>>>> 1a1447dbd92d159ec0fbc44dbe46a79778cd2a76
