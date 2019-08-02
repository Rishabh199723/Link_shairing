package project

class SubscriptionController {
def subscriptionService
    def updateSerious() {

        subscriptionService.seriousness(params)

        if(params.page=="dashboard"){
            redirect(controller:"Dashboard" ,action:"dashboard")
        }
        else if(params.page=="topic"){
            redirect(controller:"Topic" ,action:"topicshow",params:[id:params.sid])
        }

    }


    def unsubscribe(params){

        println params.id
        Long sid = 0.0
        Users user=Users.findByEmail(session.name)
        Subscription su=Subscription.findById(params.id)
        if(su instanceof project.Subscription) {
             sid = Long.parseLong(params.id)
        }
        else
        {
            Long topid = Long.parseLong(params.id)

            println topid
            Subscription sub = Subscription.createCriteria().get {
                eq('topic.id', topid)
                eq('user.id', user.id)
            }
            println sub
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
            Topic t=Topic.get(topid)
            Subscription s=Subscription.findByTopicAndUser(t,user)
            if(s==null){
            s=new Subscription(seriousness: "CASUAL" ,topic :t)
            user.addToSubscribed(s)
            s.save(flush:true,failOnError:true)
            user.save(flush:true,failOnError:true)
        }
        else{
            flash.message1="Already subscribed"
        }

            redirect(controller:"Dashboard" ,action:"dashboard")



    }
}
