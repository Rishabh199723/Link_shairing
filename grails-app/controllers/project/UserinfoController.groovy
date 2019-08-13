package project

import grails.converters.JSON

class UserinfoController {
    def dashboardService
    def springSecurityService
    def index() { }

    def showuserinfo(){
        Users user = Users.findByEmail(springSecurityService.currentUser?.email)
        Integer topcount=dashboardService.topicCountMethod(springSecurityService.currentUser?.email)
        Integer subcount=dashboardService.subscriptionCountMethod(springSecurityService.currentUser?.email)
        String template= g.render( template:"/dashboard/usercontent", model:[userdata:user ,topcount:topcount,subcounts:subcount ])
        render (["userinfo" : template ] as JSON)
    }
}
