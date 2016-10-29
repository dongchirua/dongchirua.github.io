---
layout: post
title: Install MongoDB with Replication on Docker
categories: [Engineering]
tags: [note, tutorial, setup, MongoDB, Docker]
fullview: true
comments: true
---
One of my previous works was to set up an infrastructure with MongoDB. If you asked me why MongoDB, I would say it was due to sort of legacy. The thing was, I had been struggling for replication installation until I found a way to complete. In this post, I share my steps to achieve with some references.

Foremost, a replica set means there are several database nodes maintaining the same data set. In reality, my application will connect to these nodes, Mongo itself will allow writing onto its primary node while secondary will clone data after a short particular period time. When primary has a problem, the cluster will vote to differentiate primary and secondaries.

My problem was the incorrect configuration for my cluster, therefore, these nodes can not communicate. My configuration used IP information which will probably cause some communication problems when these addresses change. Anyway, my post just shows how it works. Bear in mind that I use Docker to install MongoDB so need to install Docker first.

***Steps***

**Install mongo nodes** [^docker]

The default port of mongo is `27017`, I installed **3 nodes on 1 machine** (suppose my real IP is `10.164.5.85`) so I have to open 3 ports for mapping to each mongo container, otherwise I will meet further issues. You can start from `27017` but I choose from `27018`. Three containers are `mongo1`, `mongo2` and `mongo3` respectively. Replica Set name is `rs0`.

{% highlight bash %}
sudo docker run \
-p 27018:27017 \
--name mongo1 \
--net curator-cluster \
mongo mongod --replSet rs0
{% endhighlight %}

{% highlight bash %}
sudo docker run  -it\
-p 27019:27017 \
--name mongo2 \
--net curator-cluster \
mongo mongod --replSet rs0
{% endhighlight %}

{% highlight bash %}
sudo docker run \
-p 27020:27017 \
--name mongo3 \
--net curator-cluster \
mongo mongod --replSet rs0
{% endhighlight %}

**My configuration**

If you make a incorrect configuration, these nodes can not find each other [^problem] or you can get MongoDB connection error [^error].

{% highlight json %}
config = {
  "_id" : "rs0",
  "members" : [
    {"_id" : 0, "host" : "10.164.5.85:27018"},
    {"_id" : 1, "host" : "10.164.5.85:27019"},
    {"_id" : 2, "host" : "10.164.5.85:27020"}
    ]
  }
rs.initiate(config)
{% endhighlight %}

**Verification**

To verify, You can use this command
{% highlight bash %}
mongo --host replicaSetName/host1[:porthost1],host2[:porthost1],host3[:porthost3] databaseToConnect
{% endhighlight %}
for instance:
{% highlight bash %}
mongo --host rs0/10.164.5.85:27018,10.164.5.85:27019,10.164.5.85:27020 schedulerinterface-staging
{% endhighlight %}

***References***

[^docker]: [http://www.sohamkamani.com/blog/2016/06/30/docker-mongo-replica-set/](http://www.sohamkamani.com/blog/2016/06/30/docker-mongo-replica-set/){:hreflang="en"}
[^problem]: [http://stackoverflow.com/questions/39656654/mongo-replica-set-cant-find-primary](http://stackoverflow.com/questions/39656654/mongo-replica-set-cant-find-primary){:hreflang="en"}
[^error]: [http://stackoverflow.com/questions/39572882/how-to-setup-a-valid-mongo-replicaset](http://stackoverflow.com/questions/39572882/how-to-setup-a-valid-mongo-replicaset){:hreflang="en"}
