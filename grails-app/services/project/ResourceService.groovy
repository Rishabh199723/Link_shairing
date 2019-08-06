package project

import grails.transaction.Transactional

@Transactional
class ResourceService {
def readingService
    def searchMethod(params,String username) {
        String key=params.value
        List<Resources> resources=readingService.displayunread(username).collect{it.id}
        List<Resources> resourceResults = Resources.createCriteria().list{
            ilike("description","%${key}%")
            inList("id" , resources)
        }
        return resourceResults

    }
}
