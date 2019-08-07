package project

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN','ROLE_USER'])
class ProfileController {
    def dashboardService
    def profileService
    def springSecurityService

    def editprofile() {
        Users user = Users.findByEmail(springSecurityService.currentUser?.email)
        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        Integer topcount=dashboardService.topicCountMethod(springSecurityService.currentUser?.email)
        Integer subcount=dashboardService.subscriptionCountMethod(springSecurityService.currentUser?.email)
        List tids=subs.collect{it.topic.id}
        def topiclist= subs*.topic
        List countofsub=dashboardService.subcount(topiclist)
        List countofpost=dashboardService.countposts(topiclist)
        render(view:'profileedit',model: [userdata:user,topcount:topcount,subcounts:subcount,subs:subs,countofsubs:countofsub,countofposts:countofpost])
    }

    def profile(params,request){
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
    def update=profileService.update(params,request,user)

        redirect(controller:'Profile',action:'editprofile')

    }

    def password(){
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
        def updatepass=profileService.updatepass(params,user)
        redirect(controller:'Profile',action:'editprofile')
    }
}
