package project

import grails.transaction.Transactional

@Transactional
class DocumentService {


    def saveMethod(params,username,request) {
        String topicname=params.topic
        String description=params.description
        println"-------++++++++++++++++++++++"
        def f = request.getFile($/doc/$)
        String filename=f.getOriginalFilename()
        String loc='/home/rishabh/project/grails-app/assets/documents/' + username + filename
        File des = new File(loc)
        Topic topic=Topic.findByName(topicname)
        Users user=Users.findByUsername(username)
        f.transferTo(des)
        String url=username+filename
        DocumentResource dr=new DocumentResource(documentpath: url , description:description)
        List userlist=Subscription.createCriteria().list{
            eq('topic.id',topic.id)
            ne('user.id',user.id)
        }.collect{it.user}
        Reading_Item r1=new Reading_Item(resource: dr,user:user,isRead:true)
        user.addToResources1(dr)
        topic.addToResources2(dr)
        user.save()
        topic.save()
        dr.save()
        r1.save(flush:true,failOnError:true)
        userlist.each{user1->
            Reading_Item r=new Reading_Item(resource: dr,user:user1,isRead:false)
            r.save(flush:true)
            user1.save(flush:true)
        }





    }
}
