opsworks-cookbooks
==================
I forked this project because I found the original project wasn't set up properly to be dropped into Amazon Opsworks without modification. The most recent version of the redisio cookbook was added as a submodule, as well as the ulimit cookbook (which redisio is dependent on).

#Using this custom Chef repository#
Either use this git repo as your custom Chef cookbook, or fork it and point the Repository URL field to whichever you have chosen. In the recipes field under layer settings, you can input the name of tasks defined by the redisio cookbook, such as: 

redisio::install

redisio::enable