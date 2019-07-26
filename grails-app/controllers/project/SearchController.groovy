package project

class SearchController {
    def searchService
    def index() {
        render params
        //searchService.search(params)
    }
}
