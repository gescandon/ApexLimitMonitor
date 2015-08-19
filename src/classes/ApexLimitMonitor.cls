// 
// (c) 2012 Appirio, Inc.
//
// Apex Limit Monitor utility
//
//
public with sharing class ApexLimitMonitor {

	private Limit_Detail__c initLimitDetail; // initialized limit details

    private static ApexLimitMonitor instance;

    public static ApexLimitMonitor initialize(){
		if (!ApexLimitMonitor.isEnabled()) {
			return null;
		}

        if(instance == null){
            instance = new ApexLimitMonitor();
        }
        return instance;
    }

    private ApexLimitMonitor(){
    	initLimitDetail = ApexLimitMonitor.getLimits();
    }

	public static Boolean isEnabled() {
		Apex_Limit_Detail_Config__c config = Apex_Limit_Detail_Config__c.getInstance();
		return config.enabled__c;
	}

	public Limit_Detail__c getDiffLimits() {
		Limit_Detail__c limitDetail = new Limit_Detail__c();

		limitDetail.Count_aggregate_Queries__c = Limits.getAggregateQueries() - initLimitDetail.Count_aggregate_Queries__c;
		limitDetail.Limit_Aggregate_Queries__c = initLimitDetail.Limit_Aggregate_Queries__c;
		
		limitDetail.Count_Callouts__c = Limits.getCallouts() - initLimitDetail.Count_Callouts__c;
		limitDetail.Limit_Callouts__c = initLimitDetail.Limit_Callouts__c;
		
		limitDetail.Count_DML_Rows__c = Limits.getDMLRows() - initLimitDetail.Count_DML_Rows__c;
		limitDetail.Limit_DML_Rows__c = initLimitDetail.Limit_DML_Rows__c;
		
		limitDetail.Count_DML_Statements__c = Limits.getDMLStatements() - initLimitDetail.Count_DML_Statements__c;
		limitDetail.Limit_DML_Statements__c = initLimitDetail.Limit_DML_Statements__c;
		
		limitDetail.Count_Email_Invocations__c = Limits.getEmailInvocations() - initLimitDetail.Count_Email_Invocations__c;
		limitDetail.Limit_Email_Invocations__c = initLimitDetail.Limit_Email_Invocations__c;
		
		limitDetail.Count_Future_Calls__c = Limits.getFutureCalls() - initLimitDetail.Count_Future_Calls__c;
		limitDetail.Limit_Future_Calls__c = initLimitDetail.Limit_Future_Calls__c;
		
		limitDetail.Count_Heap_Size__c = Limits.getHeapSize() - initLimitDetail.Count_Heap_Size__c;
		limitDetail.Limit_Heap_Size__c = initLimitDetail.Limit_Heap_Size__c;
		
		limitDetail.Count_Queries__c = Limits.getQueries() - initLimitDetail.Count_Queries__c;
		limitDetail.Limit_Queries__c = initLimitDetail.Limit_Queries__c;
		limitDetail.Count_Query_Rows__c = Limits.getQueryRows() - initLimitDetail.Count_Query_Rows__c;
		limitDetail.Limit_Query_Rows__c = initLimitDetail.Limit_Query_Rows__c;
		
		limitDetail.Count_Queueable_Jobs__c = Limits.getQueueableJobs() - initLimitDetail.Count_Queueable_Jobs__c;
		limitDetail.Limit_Queueable_Jobs__c = initLimitDetail.Limit_Queueable_Jobs__c;
		
		limitDetail.Count_Sosl_Queries__c = Limits.getSoslQueries() - initLimitDetail.Count_Sosl_Queries__c;
		limitDetail.Limit_Sosl_Queries__c = initLimitDetail.Limit_Sosl_Queries__c;
		return limitDetail;

	}

	public void recordLimitsInstance(String processName) {
		if (!ApexLimitMonitor.isEnabled()) {
			return;
		}
		Limit_Detail__c limitDetail = getDiffLimits();
		limitDetail.process_Name__c = processName;
		limitDetail.User__c = UserInfo.getUserId();
		insert limitDetail;
	}

	public static void recordLimits(String processName) {
		if (!ApexLimitMonitor.isEnabled()) {
			return;
		}
		Limit_Detail__c limitDetail = ApexLimitMonitor.getLimits();
		limitDetail.process_Name__c = processName;
		limitDetail.User__c = UserInfo.getUserId();
		insert limitDetail;
	}
	public static Limit_Detail__c getLimits() {
		if (!ApexLimitMonitor.isEnabled()) {
			return null;
		}

		Limit_Detail__c limitDetail = new Limit_Detail__c();

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
		return limitDetail;
	}

}