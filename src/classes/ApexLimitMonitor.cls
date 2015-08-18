public with sharing class ApexLimitMonitor {

	public static Boolean isEnabled() {
		Apex_Limit_Detail_Config__c config = Apex_Limit_Detail_Config__c.getInstance();
		return config.enabled__c;
	}

	public static void recordLimits(String processName) {
		if (!ApexLimitMonitor.isEnabled()) {
			return;
		}

		Limit_Detail__c limitDetail = new Limit_Detail__c();
		limitDetail.process_Name__c = processName;
		limitDetail.User__c = UserInfo.getUserId();

		limitDetail.Count_aggregate_Queries__c = Limits.getAggregateQueries();
		limitDetail.Limit_Aggregate_Queries__c = Limits.getLimitAggregateQueries();
		
		limitDetail.Count_Callouts__c = Limits.getCallouts();
		limitDetail.Limit_Callouts__c = Limits.getLimitCallouts();
		
		limitDetail.Count_DML_Rows__c = Limits.getDMLRows();
		limitDetail.Limit_DML_Rows__c = Limits.getLimitDMLRows();
		
		limitDetail.Count_DML_Statements__c = Limits.getDMLStatements();
		limitDetail.Limit_DML_Statements__c = Limits.getLimitDMLStatements();
		
		limitDetail.Count_Email_Invocations__c = Limits.getEmailInvocations();
		limitDetail.Limit_Email_Invocations__c = Limits.getLimitEmailInvocations();
		
		limitDetail.Count_Future_Calls__c = Limits.getFutureCalls();
		limitDetail.Limit_Future_Calls__c = Limits.getLimitFutureCalls();
		
		limitDetail.Count_Heap_Size__c = Limits.getHeapSize();
		limitDetail.Limit_Heap_Size__c = Limits.getLimitHeapSize();
		
		limitDetail.Count_Queries__c = Limits.getQueries();
		limitDetail.Limit_Queries__c = Limits.getLimitQueries();
		limitDetail.Count_Query_Rows__c = Limits.getQueryRows();
		limitDetail.Limit_Query_Rows__c = Limits.getLimitQueryRows();
		
		limitDetail.Count_Queueable_Jobs__c = Limits.getQueueableJobs();
		limitDetail.Limit_Queueable_Jobs__c = Limits.getLimitQueueableJobs();
		
		limitDetail.Count_Sosl_Queries__c = Limits.getSoslQueries();
		limitDetail.Limit_Sosl_Queries__c = Limits.getLimitSoslQueries();
		insert limitDetail;
	}

}