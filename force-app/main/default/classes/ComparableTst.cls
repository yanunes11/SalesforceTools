@isTest
public with sharing class ageContactTst {
    @isTest
    public static void ageContactTst() {
        List<ageContact> ageCt = new List<ageContact>();
        ageCt.add(new ageContact(12, 'Uilame'));
        ageCt.add(new ageContact(56, 'Creidissom'));
        ageCt.add(new ageContact(34, 'Swarovizka'));
        ageCt.add(new ageContact(1, 'facebooksson'));

        ageCt.sort();

        System.debug(ageCt);

        System.assertEquals('facebooksson', ageCt[0].name);
        System.assertEquals('Uilame', ageCt[1].name);
        System.assertEquals('Swarovizka', ageCt[2].name);
        System.assertEquals('Creidissom', ageCt[3].name);
    }
}
