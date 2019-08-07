package project

class BootStrap {
    def springSecurityService

    def init = { servletContext ->

        def adminRole=Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def userRole=Role.findOrSaveWhere(authority: 'ROLE_USER')

        def u1=Users.findOrSaveWhere(username : 'nitin' , fName :'nitin'  , lName : 'nepalia' , password : 'nitin' , admin : false , active : true , email : 'nitin.nepalia@gmail.com',photo:'nitin.jpg')
        def u4=Users.findOrSaveWhere(username : 'rishabh' , fName :'rishabh'  , lName : 'gupta' , password : 'rishabh' , admin : true , active : true , email : 'rishabhgupta199723@gmail.com',photo: 'rishabh.jpg')
        def u2=Users.findOrSaveWhere(username : 'saurabh' , fName :'saurabh'  , lName : 'kumar' , password : 'saurabh' , admin : false , active : true , email : 'saurabh@gmail.com')
        def u3=Users.findOrSaveWhere(username : 'aman' , fName :'aman'  , lName : 'aggarwal' , password : 'aman' , admin : false , active : true , email : 'aman@gmail.com',photo:'default.jpg')


        if(!u4.authorities.contains(adminRole)){
            UsersRole.create(u4,adminRole,true)
            println "inside"
        }
        if(!u1.authorities.contains(userRole)){
            UsersRole.create(u1,userRole,true)
        }
        if(!u2.authorities.contains(userRole)){
            UsersRole.create(u2,userRole,true)
        }
        if(!u3.authorities.contains(userRole)){
            UsersRole.create(u3,userRole,true)
        }





        //Users1 u1=new Users1(username : 'nitin' , fName :'nitin'  , lName : 'nepalia' , password : 'nitin' , admin : false , active : true , email : 'nitin.nepalia@gmail.com',photo:'nitin.jpg' )
        //Users u2=new Users(username : 'saurabh' , fName :'saurabh'  , lName : 'kumar' , password : 'saurabh' , admin : false , active : true , email : 'saurabh@gmail.com')
        //Users u3=new Users(username : 'aman' , fName :'aman'  , lName : 'aggarwal' , password : 'aman' , admin : false , active : true , email : 'aman@gmail.com',photo:'default.jpg')
        //Users1 u4=new Users1(username : 'rishabh' , fName :'rishabh'  , lName : 'gupta' , password : 'rishabh' , admin : true , active : true , email : 'rishabhgupta199723@gmail.com',photo: 'rishabh.jpg')

        //u1.save(flush:true,failOnError:true)
        Topic topic1 = new Topic(name:"html",visibility: "PUBLIC")
        Topic topic2 = new Topic(name:"css",visibility: "PUBLIC")
        Topic topic3 = new Topic(name:"javascript",visibility: "PUBLIC")
        Topic topic11 = new Topic(name:"groovy",visibility: "PRIVATE")
        Topic topic12 = new Topic(name:"grails",visibility: "PRIVATE")
        u4.addToTopics1(topic1)
        u4.addToTopics1(topic2)
        u4.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)
        u3.addToTopics1(topic3)
        u3.addToTopics1(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)
        u2.addToTopics1(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)
        //u4.save()
        LinkResource resource1 = new LinkResource(description:"This is first Post",topic:topic1,link:'')
        LinkResource resource2 = new LinkResource(description:"This is second Post",topic:topic1,link:'')
        LinkResource resource3 = new LinkResource(description:"This is third Post",topic:topic2,link:'')
        LinkResource resource4 = new LinkResource(description:"This is fourth Post",topic:topic3,link:'')
        u4.addToResources1(resource1)
        u4.addToResources1(resource2)
        u4.addToResources1(resource3)
        u4.save(flush:true,failOnError: true)
        u3.addToResources1(resource4)
        u3.save(flush:true,failOnError: true)
        topic1.addToResources2(resource1)
        topic1.addToResources2(resource2)
        topic1.save(flush:true,failOnError: true)
        topic2.addToResources2(resource3)
        topic2.save(flush:true,failOnError: true)
        topic3.addToResources2(resource4)
        topic3.save(flush:true,failOnError: true)
        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)
        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
        Subscription subs=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription sub=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription su=new Subscription(seriousness: "CASUAL" , topic :topic2)
        u4.addToSubscribed(s1)
        u4.addToSubscribed(s2)
        u4.addToSubscribed(su)
        u4.addToSubscribed(subs)
        u3.addToSubscribed(s3)
        u3.addToSubscribed(s4)
        u2.addToSubscribed(su)
        u2.addToSubscribed(s5)
        u1.addToSubscribed(sub)
        u1.addToSubscribed(su)
        topic1.addToSubscriptions1(s1)
        topic1.addToSubscriptions1(sub)
        topic2.addToSubscriptions1(su)
        topic2.addToSubscriptions1(s2)
        topic3.addToSubscriptions1(s3)
        topic11.addToSubscriptions1(s4)
        topic11.addToSubscriptions1(subs)
        topic12.addToSubscriptions1(s5)

        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        subs.save(flush:true,failOnError:true)
        sub.save(flush:true,failOnError:true)
        su.save(flush:true,failOnError:true)

        Reading_Item r1=new Reading_Item(resource: resource1,user:u4,isRead: true)
        Reading_Item r2=new Reading_Item(resource: resource1,user:u1,isRead: false)
        Reading_Item r3=new Reading_Item(resource: resource2,user:u4,isRead:true )
        Reading_Item r4=new Reading_Item(resource: resource2,user:u1,isRead:false )
        Reading_Item r5=new Reading_Item(resource: resource3,user:u4,isRead: true)
        Reading_Item r6=new Reading_Item(resource: resource3,user:u2,isRead:false )
        Reading_Item r7=new Reading_Item(resource: resource3,user:u1,isRead:false )
        Reading_Item r8=new Reading_Item(resource: resource4,user:u3,isRead:true )

        r1.save(flush:true,failOnError:true)
        r2.save(flush:true,failOnError:true)
        r3.save(flush:true,failOnError:true)
        r4.save(flush:true,failOnError:true)
        r5.save(flush:true,failOnError:true)
        r6.save(flush:true,failOnError:true)
        r7.save(flush:true,failOnError:true)
        r8.save(flush:true,failOnError:true)


    }
    def destroy = {
    }
}
