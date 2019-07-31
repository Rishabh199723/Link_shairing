package project

import grails.transaction.Transactional

@Transactional
class RatingService {

    def saveMethod(params) {

        println "+++++++++++++++++"
        println params
        int rating=Integer.parseInt(params.value)
        Users user=Users.findByUsername(params.username)
        Long resourceId= Long.parseLong(params.resourceId)
        Resources res=Resources.get(resourceId)
        Resource_Rating resRate=Resource_Rating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            resRate.score=rating
            resRate.save()
        }
        else{
            Resource_Rating resourceRate = new Resource_Rating(rating:rating)
            user.addToResourcerated(resourceRate)
            res.addToResourcerate(resourceRate)
            user.save(flush:true,failOnError: true)
            res.save(flush:true,failOnError: true)
            resourceRate.save(flush:true,failOnError: true)}


    }


    def readMethod(username , Resources res)
    {
        Users user=Users.findByUsername(username)
        Resource_Rating resRate=Resource_Rating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            return resRate.score
        }
        else
            return 0

    }
}
