package project
import grails.transaction.Transactional

@Transactional
class ReadingService {
    def displayunread(String username) {
        Long id = Users.findByUsername(username).id
        List<Long> Verys = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.VERY_SERIOUS)
        }.collect{it.id}

        List<Long> Ser = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.SERIOUS)
        }.collect{it.id}


        List<Long> Cas = Subscription.createCriteria().list {
            projections {
                property("topic")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.CASUAL)
        }.collect{it.id}
        List<Resources> Veryserious
        List<Resources> Serious
        List<Resources> Casual
        if(Verys){
            Veryserious=Reading_Item.createCriteria().list{
                projections{
                    property("resource")
                }
                'resource' {
                    inList("topic.id" , Verys)
                }
                eq("user.id", id)
                eq("isRead",false)
            }}
        if(Ser){
            Serious= Reading_Item.createCriteria().list{
                projections{
                    property("resource")
                }
                eq("user.id", id)
                'resource' {
                    inList("topic.id" , Ser)
                }

                eq("isRead",false)
            }}
        if(Cas){
            Casual=Reading_Item.createCriteria().list {
                projections {
                    property("resource")
                }
                'resource' {
                    inList("topic.id", Cas)
                }
                eq("user.id", id)
                eq("isRead", false)
            }}


        ArrayList<Resources> resources=new ArrayList()
        Veryserious.each{
            resources.add(it)
        }
        Serious.each{
            resources.add(it)
        }
        Casual.each{
            resources.add(it)
        }
        print resources
        return resources

    }

    def editreadMethod(params,String username)
    {
        Users user=Users.findByUsername(username)
        Long id=Long.parseLong(params.id)
        Reading_Item ri=Reading_Item.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        ri.isRead=true
        ri.save()

    }
    def deleteMethod(params)
    {
        Resources res= Resources.get(Long.parseLong(params.id))
        res.delete()
    }




}
