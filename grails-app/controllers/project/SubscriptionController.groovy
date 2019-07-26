package project

class SubscriptionController {
def subscriptionService
    def updateSerious() {
        subscriptionService.seriousness(params)
        redirect(controller:"Dashboard" ,action:"dashboard")
    }
}
