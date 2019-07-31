package project

import grails.transaction.Transactional

@Transactional
class DashboardService {

    def topicCountMethod(String name) {
    Users user=Users.findByEmail(name)
        Integer topcount= user.topics1.size()
        return topcount
    }

    def subscriptionCountMethod(String name){
        Users user=Users.findByEmail(name)
        Integer subcount=user.subscribed.size()

        return subcount
    }

    def subscriptions(String name){

        Users user = Users.findByEmail(name)
        List<Topic> subscriptionList = Subscription.createCriteria().list {
            eq("user.id",user.id)
        }

        subscriptionList.sort{b,a ->a.topic.lastUpdated <=> b.topic.lastUpdated}
        return subscriptionList
    }

    def subcount(List<Topic> topicList){
        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                    'topic' {
                        inList('id', topicList)
                    }
                }
        List<Integer> counts = topicList.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect { it.getAt(0) }
        return counts
    }


    def countposts(List<Topic> topicList){
        def topiccounts = Resources.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                    'topic' {
                        inList('id', topicList)
                    }
                }
        List<Integer> counts = topicList.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {
            if(!it)
                return 0
            else
                it.getAt(0)
        }
        return counts
    }




    def toptopics(){

        List <Long> topicsid=Topic.list().collect{
            it.id
        }
        //print topicsid
        List abcd=Resources.createCriteria().list(max:5)
                {
                    projections{
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    //order()
                }
        println abcd
        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}
        println"abcd"+ abcd
        List xyz=abcd.collect{ x ->
            topicsid.find{
                if (x.getAt(1)==it)
                    return x.getAt(1)
                else
                    return 0
            }
        }
        println"xyz"+ xyz
        xyz.removeAll{it==0}
        List bbb= xyz+(topicsid-xyz)
        println"bbb"+ bbb
        List<Topic> topicList=[]
        def i
        for(i=0;i<5;i++)
            topicList.add(Topic.get(bbb[i]))
        println "trend"+topicList
        return topicList


       /* List <Long> topicsid=Topic.list().collect{
            it.id
        }

        List abcd=Resources.createCriteria().list(max:5)
                {
                    projections{
                        groupProperty('topic.id')
                        count('topic.id')

                    }

                }

        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}
        List <Integer> xyz=topicsid.collect{ x ->
            abcd.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
                else
                    return 0
            }
        }.collect{if(!it)
            return 0
        else
            it.getAt(1)}

        xyz.removeAll{it==0}

        List bbb= xyz+(topicsid-xyz)
        List<Topic> topicList1 = []
        bbb.each{
            topicList1.add(Topic.get(it))
        }
        List<Topic> topicList=[]

        def i
        for(i=0;i<5;i++)
            topicList.add(topicList1[i])

        return topicList*/
    }

    def toptopicposts(trending){
        List abcd = Resources.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                        // countDistinct('topic.id')
                    }
                    //order()
                }
        println "abcd"+abcd
        abcd.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        println "abcd is this>>>>>>>>>>>>>>>>>>>>>>>"+abcd
        println "trending is this>>>>>>>>>>>>>>>>>>>"+trending
        List xyz = trending.collect { x ->
            abcd.find {
                if (it.getAt(1) == x.id)
                    return it.getAt(0)
                else
                    return 0
            }
        }
        List resultCount = xyz.collect{if(!it)
            return 0
        else
            it.getAt(0)
        }
        println "top posts"+resultCount
        return resultCount
    }

    def toptopicsubs(trending){
        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topic.id')
                        groupProperty('topic.id')
                    }
                }
        topiccounts.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        println topiccounts
        List xyz = trending.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x.id)
                    return it.getAt(0)
                else
                    return 0
            }
        }
        List resultCount = xyz.collect{if(!it)
            return 0
        else
            it.getAt(0)
        }
        println "println topsubs"+resultCount
        return resultCount
    }







}
