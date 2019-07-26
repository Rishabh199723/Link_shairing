package project

class TopicController {
    static defaultAction = "topics"
    def topicService
    def topiclistService

    def index() {}

    def topics() {
        topicService.serviceMethod(session.name, params)
        redirect(controller: "Dashboard", action: "dashboard")
    }

    def topiclist() {
        List topiclist = topiclistService.serviceMethod()

        render(view: 'topiclist', model: [topiclists: topiclist])
    }

    def updatevisibility() {
        topicService.visibility(params)
        redirect(controller: "Dashboard", action: "dashboard")
    }

    def topicshow() {
        Users user=Users.findByEmail(session.name)

        Long id = Long.parseLong(params.id)
        Subscription sub = Subscription.get(id)
        Topic t = sub.topic
        Long tid = t.id


        Long subscount = Subscription.createCriteria().count {
            eq("topic.id", tid)
        }
        int postcount = Resources.createCriteria().count {
            eq('topic.id', tid)
        }

        List<Subscription> subscription = Subscription.createCriteria().list {
            eq("topic.id", tid)
        }
        List<Users> users = subscription*.user
        List<Long> userslist = users.collect { it.id }


        List subscriptioncount = topicService.subscriptioncount(userslist)

        List postscount = topicService.topiccount(userslist)

        List<Resources> resource = Resources.createCriteria().list {
            eq("topic.id", tid)
        }
        println "------------------------"
        render(view:"topicshow" ,model : [user:user,subs:sub , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource])
    }
}