import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import sendFileToAccount from '@salesforce/apex/SendFileToObject.sendFileToAccount';

export default class uploadFile extends LightningElement {
    @api
    myRecordId;

    get acceptedFormats() {
        return ['.pdf', '.txt', '.docx'];
    }

    handleUploadFinished(event) {
        // Get the list of uploaded files
        const uploadedFiles = event.detail.files;
        alert('No. of files uploaded : ' + JSON.stringify(uploadedFiles));
        sendFileToAccount(
            {
                uploadedFiles:  JSON.stringify(uploadedFiles),
                myRecordId: this.myRecordId,
            }
        );
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: uploadedFiles.length + ' File(s) Updated Sucessfully: ',
                variant: 'success',
            }),
        );
    }
}