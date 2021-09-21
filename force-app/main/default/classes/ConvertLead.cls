/**
    @author : Yan Nascimento
    @date : 14/01/2021
    @description : convert lead
    @log : 14/01/2021 : creation
 */
public class ConvertLead {
    public static void toConvert(Id LeadId) {
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(LeadID);
          
        LeadStatus convertStatus = [
            SELECT Id, MasterLabel 
            FROM LeadStatus 
            WHERE IsConverted=true 
            LIMIT 1
        ];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        if (lcr.isSuccess()) {
      	    System.assert(lcr.isSuccess());
            system.debug('It worked');
        }
        else {
            system.debug('Didnt worked');
        }
    }
}