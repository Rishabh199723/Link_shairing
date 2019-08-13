package project

import grails.converters.JSON

class ShowtrendingController {
    def dashboardService
    def springSecurityService
    def index() { }

    def showtrending(){

        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        if(!subs){
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts(toptopic)
            List<Integer> toptopicsubs=dashboardService.toptopicsubs(toptopic)
            String template= g.render( template:"/dashboard/topiccontent", model:[tids : [] ,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,toptopics:toptopic ])
            render (["toptopics" : template ] as JSON)
        }
        else{
            List tids=subs.collect{it.topic.id}
            List<Topic> toptopic=dashboardService.toptopics()
            List<Integer> toptopicposts=dashboardService.toptopicposts(toptopic)
            List<Integer> toptopicsubs=dashboardService.toptopicsubs(toptopic)
            String template= g.render( template:"/dashboard/topiccontent", model:[tids : tids ,toptopicpost:toptopicposts,toptopicsub:toptopicsubs,toptopics:toptopic ])
            render (["toptopics" : template ] as JSON)

        }



    }
}
