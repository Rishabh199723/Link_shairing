package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DashboardController {
    def dashboardService
    def springSecurityService
    def readingService
    def index() {}

    def dashboard() {
        Users user = Users.findByEmail(springSecurityService.currentUser?.email)
        Integer topcount=dashboardService.topicCountMethod(springSecurityService.currentUser?.email)
        Integer subcount=dashboardService.subscriptionCountMethod(springSecurityService.currentUser?.email)
        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        if(!subs){
            render(view: 'dashboard',model: [subs:[],userdata:user,topcount:topcount,subcounts: subcount,resources: []])
        }
        else{
            List resources=readingService.displayunread(springSecurityService.currentUser?.username)
            render(view: 'dashboard',model: [subs:subs,userdata:user,topcount:topcount,subcounts: subcount,resources: resources])
        }
        /*List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        if(!subs){
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts(toptopic)
            List<Integer> toptopicsubs=dashboardService.toptopicsubs(toptopic)
            render(view: 'dashboard',model: [userdata:user,tids:[],topcount:topcount,subcounts:subcount,subs:[],countofsubs:[],countofposts:[],toptopics:toptopic,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,resources:[]])
        }
        else{
            List tids=subs.collect{it.topic.id}
            def topiclist= subs*.topic
            List countofsub=dashboardService.subcount(topiclist)
            List countofpost=dashboardService.countposts(topiclist)
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts(toptopic)
            List<Integer> toptopicsubs=dashboardService.toptopicsubs(toptopic)
            List resources=readingService.displayunread(springSecurityService.currentUser?.username)
            render(view: 'dashboard',model: [userdata:user,tids:tids,topcount:topcount,subcounts:subcount,subs:subs,countofsubs:countofsub,countofposts:countofpost,toptopics:toptopic,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,resources:resources])


        }*/
       }

    def viewprofile() {

        if (!springSecurityService.currentUser?.email) {
            render("please login first")
        } else {
            Users user = Users.findByUsername(springSecurityService.currentUser?.username)
            Integer topcount=dashboardService.topicCountMethod(springSecurityService.currentUser?.email)
            Integer subcount=dashboardService.subscriptionCountMethod(springSecurityService.currentUser?.email)
            List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
            List tids=subs.collect{it.topic.id}

            //List subslist=subs.collect{it.id}
            def topiclist= subs*.topic
            List countofsub=dashboardService.subcount(topiclist)
            List countofpost=dashboardService.countposts(topiclist)

            List resource=Resources.createCriteria().list{
            eq('createdBy.id',user.id)
            }

            render(view: 'profile',model: [user:user,resources:resource,topcounts:topcount,subcounts:subcount,subscriptions:subs,countofsubs:countofsub,countofposts:countofpost])

        }
    }


}