@isTest
public class AccountProcessorTest {
    @isTest static void countContactsTest(){
        Account a = new Account(Name='TestAccount');
        insert a;
        Contact c = new Contact(LastName='TestContact', accountId=a.id);
        insert c;
        List<Id> accIds = new List<Id>();
        accIds.add(a.id);

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        Account acc = [SELECT id, Number_Of_Contacts__c FROM account WHERE id = :a.id];
        
        System.assertEquals(acc.Number_Of_Contacts__c, 1);
    }
}
