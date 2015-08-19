## ApexLimitMonitor
Apex Utility to monitor governor limits


##Usage: 

In both static and instance use cases, you will pass in a process name (String) when you are ready to insert the limit details record. 

1. Static Limits Snapshot
    

ApexLimitMonitor.recordLimits('DocParent__c trigger static');
    



2. Instance Limits Capture

    
ApexLimitMonitor monitor = ApexLimitMonitor.initialize();

... all kinds of apex ...

monitor.recordLimitsInstance('DocParent__c trigger instance');



