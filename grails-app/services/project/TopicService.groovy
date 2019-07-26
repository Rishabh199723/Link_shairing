package project

import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod(String name,params) {
        Users user=Users.findByEmail(name)
        Topic t1=new Topic(name:params.topicName,visibility: params.visibility)
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
}
