import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import assignDocToAccount from '@salesforce/apex/uploadFileCnt.assignDocToAccount'

export default class uploadFile extends LightningElement {
    @api recordId;
    fileData = {
        'filename': null,
        'base64': null,
        'recordId': null
    }; 
    objects;

    openFileUpload(event) {
        const file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = () => {
            var base64 = reader.result.split(',')[1];
            this.fileData = {
                'filename': file.name,
                'base64': base64,
                'recordId': this.recordId
            }
            console.log(this.fileData);
        }
        reader.readAsDataURL(file);
    }
    handleClick() {
        const {filename, base64, recordId} = this.fileData;
        assignDocToAccount({filename, base64, recordId})
        .then(result => {
            this.fileData = null;
            this.showToast(result.Title+' uploaded sucessfully');
        })
        .catch(error => {
            this.showToast('error: '+error);
        })
    }
    showToast(text) {
        const toastEvent = new ShowToastEvent({
            title: text,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}