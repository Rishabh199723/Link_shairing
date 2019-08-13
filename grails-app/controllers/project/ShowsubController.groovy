package project

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ShowsubController {
def dashboardService
    def springSecurityService
    def index() { }

    def showsub(){
        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        Users user = Users.findByEmail(springSecurityService.currentUser?.email)
        if(!subs){
            String template= g.render( template:"/dashboard/subcontent", model:[subs : [] , userdata:user,countofsubs:[],countofposts:[]])
            render (["subscriptions" : template ] as JSON)
        }else
        {
            def topiclist= subs*.topic
            List countofsub=dashboardService.subcount(topiclist)
            List countofpost=dashboardService.countposts(topiclist)
            String template= g.render( template:"/dashboard/subcontent", model:[subs : subs , userdata:user,countofsubs:countofsub,countofposts:countofpost])

            render (["subscriptions" : template ] as JSON)

        }
    }
}
