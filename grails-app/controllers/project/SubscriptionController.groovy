package project

class SubscriptionController {
def subscriptionService
    def updateSerious() {
        println"+++++++++++++++++++++++++++++++++++++++++"
        println params
        subscriptionService.seriousness(params)

        if(params.page=="dashboard"){
            redirect(controller:"Dashboard" ,action:"dashboard")
        }
        else if(params.page=="topic"){
            redirect(controller:"Topic" ,action:"topicshow",params:[id:params.sid])
        }

    }


    def unsubscribe(params){
        println"======================"
        println params.id
        Long sid = 0.0
        Users user=Users.findByEmail(session.name)
        if(params.id instanceof project.Subscription) {
             sid = Long.parseLong(params.id)
        }
        else
        {
            Long topid = Long.parseLong(params.id)

            Subscription sub = Subscription.createCriteria().get {
                eq('topic.id', topid)
                eq('user.id', user.id)
            }
            sid = sub.id
        }
        Subscription s=Subscription.findById(sid)
        s.delete(flush:true)

        if(params.page=="dashboard"){
            redirect(controller:"Dashboard" ,action:"dashboard")
        }
        else if(params.page=="topic"){
            redirect(controller:"Topic" ,action:"topicshow",params:[id:params.id])
        }
    }

    def subscribe(params){
        Users user=Users.findByEmail(session.name)
        Long topid = Long.parseLong(params.id)

        Subscription sub = Subscription.createCriteria().get {
            eq('topic.id', topid)
            eq('user.id', user.id)
        }
        sid = sub.id
        
    }
}
