package project

class DashboardController {
    def dashboardService
    def readingService
    def index() {}

    def dashboard() {
        Users user = Users.findByEmail(session.name)
        Integer topcount=dashboardService.topicCountMethod(session.name)
        Integer subcount=dashboardService.subscriptionCountMethod(session.name)
        List subs=dashboardService.subscriptions(session.name)
        if(!subs){
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts()
            List<Integer> toptopicsubs=dashboardService.toptopicsubs()
            render(view: 'dashboard',model: [userdata:user,tids:[],topcount:topcount,subcounts:subcount,subs:[],countofsubs:[],countofposts:[],toptopics:toptopic,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,resources:[]])

        }
        else{
            List tids=subs.collect{it.topic.id}
            def topiclist= subs*.topic.collect{it.id}
            List countofsub=dashboardService.subcount(topiclist)
            List countofpost=dashboardService.countposts(topiclist)
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts()
            List<Integer> toptopicsubs=dashboardService.toptopicsubs()
            List resources=readingService.displayunread(session.uname)
            render(view: 'dashboard',model: [userdata:user,tids:tids,topcount:topcount,subcounts:subcount,subs:subs,countofsubs:countofsub,countofposts:countofpost,toptopics:toptopic,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,resources:resources])


        }
       }

    def viewprofile() {

        if (!session.uname) {
            render("please login first")
        } else {
            Users user = Users.findByUsername(session.uname)
            Integer topcount=dashboardService.topicCountMethod(session.name)
            Integer subcount=dashboardService.subscriptionCountMethod(session.name)
            List subs=dashboardService.subscriptions(session.name)
            List tids=subs.collect{it.topic.id}

            //List subslist=subs.collect{it.id}
            def topiclist= subs*.topic.collect{it.id}
            List countofsub=dashboardService.subcount(topiclist)
            List countofpost=dashboardService.countposts(topiclist)

            List resource=Resources.createCriteria().list{
            eq('createdBy.id',user.id)
            }

            render(view: 'profile',model: [user:user,resources:resource,topcounts:topcount,subcounts:subcount,subscriptions:subs,countofsubs:countofsub,countofposts:countofpost])

        }
    }


}