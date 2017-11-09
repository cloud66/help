


### External Servers

If you would like to use an external server for an application (like using your own MySQL or AWS RDS for example), you can define that server as external.

External server definitions specify that the application is hosted on a server external to Cloud 66. This is not a valid target for your main application (ie. Rails) but may be appropriate for another application type (ie. MongoDB):



{%include _inlines/Deployment/common/building-a-manifest-file/code_building-a-manifest-file_external-servers-oduction-v1.md  product = include.product %}






