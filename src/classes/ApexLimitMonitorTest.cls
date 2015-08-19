@isTest
private class ApexLimitMonitorTest
{
	@isTest
	static void testStatic()
	{
		Apex_Limit_Detail_Config__c config = new Apex_Limit_Detail_Config__c();
		config.enabled__c = true;
		insert config;
		List<User> ul = [select id from User];
		ApexLimitMonitor.recordLimits('ApexLimitMonitorTest');
		List<Limit_Detail__c> ldl = [select id from Limit_Detail__c];
		System.assert(ldl.size() > 0);
	}

	@isTest
	static void testInstance() {
		Apex_Limit_Detail_Config__c config = new Apex_Limit_Detail_Config__c();
		config.enabled__c = true;
		insert config;
		ApexLimitMonitor monitor = ApexLimitMonitor.initialize();
		System.assert(monitor != null);
		List<User> ul = [select id from User];
		monitor.recordLimitsInstance('ApexLimitMonitorTest');
		List<Limit_Detail__c> ldl = [select id from Limit_Detail__c];
		System.assert(ldl.size() > 0);

	}
}