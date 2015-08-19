## ApexLimitMonitor
Apex Utility to monitor governor limits


##Usage: 

In both static and instance use cases, you will pass in a process name (String) when you are ready to insert the limit details record. 

###Static Limits Snapshot

````
ApexLimitMonitor.recordLimits('DocParent__c trigger static');
````



###Instance Limits Capture

````
ApexLimitMonitor monitor = ApexLimitMonitor.initialize();

... all kinds of apex ...

monitor.recordLimitsInstance('DocParent__c trigger instance');
````

##Administration

The included custom setting Apex Limit Detail Config is used to control the execution of the monitoring. The SFDC Admin should be aware of which users are enabled for monitoring. The SFDC Admin should also be aware of the rate that Limit Detail records are generated, and plan for occasional purging of stale Limit Detail records.