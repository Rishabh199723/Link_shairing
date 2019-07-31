package project

class TopicController {
    static defaultAction = "topics"
    def topicService
    def topiclistService
    def dashboardService
    def index() {}

    def topics() {
        println "IN TOPIC ==============================="
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
        List subs=dashboardService.subscriptions(session.name)
        List tids=subs.collect{it.topic.id}
        Long tid=0.0
        Long id = Long.parseLong(params.id)
        Subscription sub = Subscription.get(id)

        if(sub==null){
          sub=Subscription.createCriteria().get{
              eq('topic.id',id)
              eq('user.id',user.id)
          }

        }

        tid=sub.topic.id

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

        List resourcelist=resource.collect{it.id}
        List read=Reading_Item.createCriteria().list{
            inList("resource.id",resourcelist)
            eq("user.id",user.id)
        }
        println "------------------------"

        render(view:"topicshow" ,model : [user:user,tids:tids,subs:sub , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource])
    }
}