package project

import grails.transaction.Transactional

@Transactional
class LinkService {

    def saveMethod(params,String username) {
        String url=params.url
        String description=params.description
        String topicname=params.topicname
        println "}}}}}}}}}}}}}}}}${topicname}"
        Topic topic=Topic.findByName(topicname)
        println "}}}}}}}}}}}}}}}}${topic}"
        Users user=Users.findByUsername(username)
        LinkResource lr=new LinkResource(link: url , description:description )
        List userlist=Subscription.createCriteria().list{
            eq('topic.id',topic.id)
            ne('user.id',user.id)
        }.collect{it.user}



        Reading_Item r1=new Reading_Item(resource: lr,user:user,isRead:true)
        user.addToResources1(lr)
        topic.addToResources2(lr)
        user.addToReadItems1(r1)
        user.save()
        topic.save()
        lr.save()
        r1.save(flush:true,failOnError:true)
        userlist.each{user1->
            Reading_Item r=new Reading_Item(resource: lr,user:user1,isRead:false)
            r.save(flush:true)
            user1.save(flush:true)
        }
    }
}
