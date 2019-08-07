package project

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])

class ResourcesController {
    def ratingService
    def dashboardService
    def resourceService
    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        List tids=subs.collect{it.topic.id}
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
        Resources res=Resources.get(params.id)
        List trending=dashboardService.toptopics()
        def rating=ratingService.readMethod(user.username,res)
        //def topiclist= subs*.topic.collect{it.id}

        List<Integer> toptopicposts=dashboardService.toptopicposts(trending)

        println toptopicposts
        List<Integer> toptopicsubs=dashboardService.toptopicsubs(trending)


        render(view : "viewpost" , model:[subs:subs,rating:rating,resource:res , toptopics:trending,userdata:user,tids:tids,toptopicsub:toptopicsubs,toptopicpost:toptopicposts])
    }
    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def deletepost(){
        Resources res=Resources.findById(params.id)
        res.delete(flush:true)
        redirect(controller:'Dashboard',action:'dashboard')

    }
    @Secured(['ROLE_ADMIN'])
    def postlist(){
        List resources=Resources.list()
        render(view:'postlist',model:[list:resources])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def search(){

        List<Resources> resources=resourceService.searchMethod(params,springSecurityService.currentUser?.username)
        String template= g.render( template:"showunread", model:[resources : resources , value:params.value])
        render (["resources" : template ] as JSON)
    }
}
