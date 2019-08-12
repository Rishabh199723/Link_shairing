package project

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod(String name,params) {
        Users user=Users.findByEmail(name)
        Topic t1=new Topic(name:params.tname,visibility: params.visibility)
        Subscription sub=new Subscription(seriousness: 'VERY_SERIOUS',topic:t1)
        user.addToTopics1(t1)
        user.save(flush:true,failOnError:true)
        t1.save(flush:true,failOnError:true)
        user.addToSubscribed(sub)
        sub.save(flush:true,failOnError:true)
    }

    def visibility(params){
    Topic t=Topic.get(params.id)
        t.visibility=params.visibility
        t.save(flush:true)
    }

    def subscriptioncount(List userslist)
    {
        List counts=[]
        List users=[]
        userslist.each{
            def u=Users.get(it)
            users.add(u)
        }
        users.each{
            def subcount=it.subscribed.size()
            counts.add(subcount)
        }
        return counts
        /*def usercounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')
                        // countDistinct('topic.id')
                    }
                    'user'{
                        inList('id',userslist)
                    }
                }
        List <Integer> counts=userslist.collect{ x ->
            usercounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{it.getAt(0)}
        return counts*/
    }

    def topiccount(List userslist)
    {
        List topiccount=[]
        List users=[]
        userslist.each{
            def u=Users.get(it)
            users.add(u)
        }
        users.each{
            def subcount=it.topics1.size()
            topiccount.add(subcount)
        }
        return topiccount
        /*def topcounts=Topic.createCriteria().list()
                {
                    projections{
                        count('createdBy.id')
                        groupProperty('createdBy.id')
                        // countDistinct('topic.id')
                    }
                    'createdBy'{
                        inList('id',userslist)
                    }
                }

        List <Integer> topiccount=userslist.collect{ x ->
            topcounts.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}

        return topiccount*/

    }




}
