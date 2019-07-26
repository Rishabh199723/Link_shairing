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
}
