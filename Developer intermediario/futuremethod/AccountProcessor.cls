public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<sObject> contagem = [SELECT accountId, count(id) c FROM contact WHERE accountId IN :accountIds GROUP BY accountId];
        List<Account> accounts = new List<Account>();
        for(sObject obj: contagem){
            accounts.add(new Account(id=(Id)obj.get('accountId'), Number_Of_Contacts__c=(Integer)obj.get('c')));
        }
        
        update accounts;
    }
}