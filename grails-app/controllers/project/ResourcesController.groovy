package project

class ResourcesController {

    def dashboardService
    def index() {
        List subs=dashboardService.subscriptions(session.name)
        List tids=subs.collect{it.topic.id}
        Users user=Users.findByEmail(session.name)
        Resources res=Resources.get(params.id)
        List<Integer> toptopicposts=dashboardService.toptopicposts()
        List<Integer> toptopicsubs=dashboardService.toptopicsubs()
        println "+++++++++++++++++++++++++++++++++++++++"
        List trending=dashboardService.toptopics()
        render(view : "viewpost" , model:[resource:res , trending:trending,userdata:user,tids:tids,toptopicsub:toptopicsubs,toptopicpost:toptopicposts])
    }
}
