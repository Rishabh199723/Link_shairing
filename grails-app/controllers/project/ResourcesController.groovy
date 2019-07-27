package project

class ResourcesController {

    def dashboardService
    def index() {
        Resources res=Resources.get(params.id)
        println "+++++++++++++++++++++++++++++++++++++++"
        List trending=dashboardService.toptopics()
        render(view : "viewpost" , model:[resource:res , trending:trending])
    }
}
