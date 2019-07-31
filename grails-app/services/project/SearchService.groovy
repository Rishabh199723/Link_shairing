package project

import grails.transaction.Transactional

@Transactional
class SearchService {

    def showSearch(String searchKey)
    {
        println "inside service with ${searchKey}"
        String entry = searchKey
        if (entry==null)
            return null


        List<String> topicResults = Topic.createCriteria().list{

            ilike("name","%${entry}%")
            eq('visibility',Visibility.PUBLIC)

        }.collect{it.name}
        List<String> resourceResults = Resources.createCriteria().list{

            ilike("description","%${entry}%")
        }.collect{it.description}
        println ">>>>>>>>>>>>>${topicResults}"
        println ">>>>>>>>>>>>>${resourceResults}"
        List<String> resultSet = topicResults+resourceResults

        return resultSet
    }
}
