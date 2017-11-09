


## How to run background processes

A typical Procfile may look something like this:



{%include _inlines/Deployment/common/proc-files/code_proc-files_how-to-run-background-processes-rkerrakere.-v1.md  product = include.product %}




The commands above would run 
rake resque:work QUEUE=*
 and 
rake resque:scheduler
 and monitor them. Cloud 66 will attempt to bring processes that go down or crash up again. Processes are also instructed to start when your server is booted. An overall view of your processes is available in your stack detail page.

You can reference your stack environment variables with a `$` before the name. This will be replaced by the actual value in the command executed. As an example, `$RAILS_ENV` will be evaluated as `production` if you are in the production environment.
