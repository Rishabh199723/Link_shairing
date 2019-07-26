package project

class SearchController {
    def searchService
    def index() {
        println">>>>>>>>>>> with ${params}"
        List<String> resultSet = searchService.showSearch(params.search)
        println ">>>>>>>>>>>>>>>>>>>>>>>>"
        println resultSet
        if(resultSet)
            render view:'search',model:[result:resultSet]
        else
            redirect url:"/Dashboard/dashboard"
    }
}
