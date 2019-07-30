package project

import grails.transaction.Transactional

@Transactional
class LinkService {

    def saveMethod(params,String username) {
        String url=params.url
        String description=params.description
        String topicname=params.topic
        Topic topic=Topic.findByName(topicname)
        Users user=Users.findByUsername(username)
        LinkResource lr=new LinkResource(link: url , description:description )
        Reading_Item r1=new Reading_Item(resource: lr,user:user,isRead:false)
        user.addToResources1(lr)
        topic.addToResources2(lr)
        user.addToReadItems1(r1)
        user.save()
        topic.save()
        lr.save()
        r1.save(flush:true,failOnError:true)

    }
}
