<!--  usedin: [ _legacy_docker/Tutorials/2015-09-26-memory-usage-issues-v1.md, _maestro/Tutorials/2015-09-26-memory-usage-issues-v1.md, _node/tutorials/2015-09-26-memory-usage-issues-v1.md, _rails/Tutorials/2015-09-26-memory-usage-issues-v1.md] -->


If you're experiencing memory usage issues, such as high memory usage, use the following steps to troubleshoot.

[SSH into your server](http://help.cloud66.com/managing-your-stack/ssh-to-your-server) and install htop:

{%include _inlines/Tutorials/common/2015-09-26-memory-usage-issues/code_2015-09-26-memory-usage-issues_if-youre-experiencing--v1.md  product = include.product %}

Once it's installed, run it with _htop_:

![htop](http://assets.cloud66.com/help/images/htop.png)

The screen above will show you lots of statistics on memory and CPU usage, but we'll make two changes to make potential issues more visible:

1.  Hit _F2_ (setup), _Display options_, and enable _Hide userland threads_ by hitting the spacebar once selected. Hit _q_ to exit this screen.
2.  On the home screen, hit _F6_ (sort by), and select _MEM%_, which will sort your processes by memory usage.

Once done, this view should give you a good idea of which processes are using the most memory.