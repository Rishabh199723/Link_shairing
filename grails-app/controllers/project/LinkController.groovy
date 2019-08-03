package project

class LinkController {
def linkService
    def save() {
        linkService.saveMethod(params,session.uname)
        redirect(controller:"Dashboard" , action:"dashboard")

    }
    def updatelink(){
    def link=params.url
        def description=params.description
        Long id=Long.parseLong(params.id)
        LinkResource lr=LinkResource.get(id)
        Users user=Users.findByEmail(session.name)
        lr.link=link
        lr.description=description
        lr.save(flush:true)
        Topic topic=Resources.get(id).topic
        List users=Subscription.createCriteria().list{
            eq('topic.id',topic.id)
            ne('user.id',user.id)
        }.collect{it.user}
        Reading_Item r=Reading_Item.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        r.isRead=true
        r.save(flush:true)
        users.each{user1->
           Reading_Item r1= Reading_Item.createCriteria().get{
                eq('resource.id',id)
                eq('user.id',user1.id)
            }
            r1.isRead=false
            r1.save(flush:true)
        }
        redirect(controller: 'dashboard',action: 'dashboard')
    }

}
