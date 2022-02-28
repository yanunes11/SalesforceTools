@isTest
public with sharing class InterfaceComparableTst {
    @isTest
    public static void InterfaceComparableTst() {
        List<InterfaceComparable> ageCt = new List<InterfaceComparable>();
        ageCt.add(new InterfaceComparable(12, 'Uilame'));
        ageCt.add(new InterfaceComparable(56, 'Creidissom'));
        ageCt.add(new InterfaceComparable(34, 'Swarovizka'));
        ageCt.add(new InterfaceComparable(1, 'facebooksson'));

        ageCt.sort();

        System.debug(ageCt);

        System.assertEquals('facebooksson', ageCt[0].name);
        System.assertEquals('Uilame', ageCt[1].name);
        System.assertEquals('Swarovizka', ageCt[2].name);
        System.assertEquals('Creidissom', ageCt[3].name);
    }
}
