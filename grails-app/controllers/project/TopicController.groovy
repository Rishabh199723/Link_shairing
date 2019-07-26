package project

class TopicController {
    static defaultAction = "topics"
    def topicService
    def topiclistService
    def index() { }

    def topics(){
        topicService.serviceMethod(session.name,params)
        redirect(controller:"Dashboard" ,action:"dashboard")
    }

    def topiclist(){
    List stopiclist=topiclistService.serviceMethod()

        render(view:'topiclist',model:[topiclists:topiclist])
    }
    def updatevisibility(){
        topicService.visibility(params)
        redirect(controller:"Dashboard" ,action:"dashboard")
    }

    def topicshow(){

    }
}
