package project

class ProfileController {
    def dashboardService
    def profileService
    def editprofile() {
        Users user = Users.findByEmail(session.name)
        List subs=dashboardService.subscriptions(session.name)
        Integer topcount=dashboardService.topicCountMethod(session.name)
        Integer subcount=dashboardService.subscriptionCountMethod(session.name)
        List tids=subs.collect{it.topic.id}
        def topiclist= subs*.topic
        List countofsub=dashboardService.subcount(topiclist)
        List countofpost=dashboardService.countposts(topiclist)
        render(view:'profileedit',model: [userdata:user,topcount:topcount,subcounts:subcount,subs:subs,countofsubs:countofsub,countofposts:countofpost])
    }

    def profile(params,request){
        Users user=Users.findByEmail(session.name)
    def update=profileService.update(params,request,user)

        redirect(controller:'Profile',action:'editprofile')

    }

    def password(){
        Users user=Users.findByEmail(session.name)
        def updatepass=profileService.updatepass(params,user)
        redirect(controller:'Profile',action:'editprofile')
    }
}
