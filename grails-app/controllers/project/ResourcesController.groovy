package project

class ResourcesController {
    def ratingService
    def dashboardService
    def index() {
        List subs=dashboardService.subscriptions(session.name)
        List tids=subs.collect{it.topic.id}
        Users user=Users.findByEmail(session.name)
        Resources res=Resources.get(params.id)
        List trending=dashboardService.toptopics()
        def rating=ratingService.readMethod(user.username,res)
        //def topiclist= subs*.topic.collect{it.id}

        List<Integer> toptopicposts=dashboardService.toptopicposts(trending)

        println toptopicposts
        List<Integer> toptopicsubs=dashboardService.toptopicsubs(trending)


        render(view : "viewpost" , model:[rating:rating,resource:res , trending:trending,userdata:user,tids:tids,toptopicsub:toptopicsubs,toptopicpost:toptopicposts])
    }

    def deletepost(){
        Resources res=Resources.findById(params.id)
        res.delete(flush:true)
        redirect(controller:'Dashboard',action:'dashboard')

    }

    def postlist(){
        List resources=Resources.list()
        render(view:'postlist',model:[list:resources])
    }
}
