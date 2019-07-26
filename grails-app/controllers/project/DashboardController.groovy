package project

class DashboardController {
    def dashboardService
    def index() {}

    def dashboard() {
        Users user = Users.findByEmail(session.name)
        Integer topcount=dashboardService.topicCountMethod(session.name)
        Integer subcount=dashboardService.subscriptionCountMethod(session.name)
        List subs=dashboardService.subscriptions(session.name)
        //List subslist=subs.collect{it.id}
        def topiclist= subs*.topic.collect{it.id}
        List countofsub=dashboardService.subcount(topiclist)
        List countofpost=dashboardService.countposts(topiclist)
        List<Topic> toptopic=dashboardService.toptopics()
        List<Integer> toptopicposts=dashboardService.toptopicposts()
        List<Integer> toptopicsubs=dashboardService.toptopicsubs()
        render(view: 'dashboard',model: [userdata:user,topcount:topcount,subcounts:subcount,subs:subs,countofsubs:countofsub,countofposts:countofpost,toptopics:toptopic,toptopicpost:toptopicposts,toptopicsub:toptopicsubs])
    }


}