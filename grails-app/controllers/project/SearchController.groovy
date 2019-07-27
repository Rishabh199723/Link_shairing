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

    def send()
    {
        String name = params.res
        Topic topic = Topic.findByName(name)
        Long topicId = topic.id
        //println topicId
        List<Long> subId = Subscription.createCriteria().list{
            eq('topic.id',topicId)
        }.collect{it.id}
        Long sid = subId.getAt(0)
        String subid = sid.toString()
        //  println subid
        redirect controller:'topic',action:'topicshow',params:[id:subid]
    }
}
