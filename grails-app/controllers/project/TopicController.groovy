package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class TopicController {
    static defaultAction = "topics"
    def topicService
    def topiclistService
    def dashboardService
    def springSecurityService


    def sendInvite()
    {
        println params
        Users user = Users.findByEmail(params.email)
        Topic topic = Topic.findByName(params.topic)
        Long topicId = topic.id
        String link = createLink(controller: 'Subscription', action: 'subscribe',params:[id:topicId], absolute: true)
        sendMail {
            to "${user.email}"
            subject "Hello ${user.fName} You have been invited to join this topic at LinkSharing!!!"
            text link
        }
        redirect controller: 'dashboard',action:'dashboard'
    }

    def deletetopic(){
        Topic t=Topic.get(params.id)
        t.delete(flush:true)
        redirect controller: 'Dashboard',action: 'dashboard'

    }
    def index() {}

    def topics() {
        println "IN TOPIC ==============================="

        Topic t=Topic.findByName(params.topicName)
        if(t){
            flash.message3="Topic already created"
            redirect(controller: "Dashboard", action: "dashboard")
        }
        else {
            topicService.serviceMethod(springSecurityService.currentUser?.email, params)
            redirect(controller: "Dashboard", action: "dashboard")

        }




    }

    def topiclist() {
        List topiclist = topiclistService.serviceMethod()

        render(view: 'topiclist', model: [topiclists: topiclist])
    }

    def updatevisibility() {
        topicService.visibility(params)
        redirect(controller: "Dashboard", action: "dashboard")
    }

    def topicshow() {
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
        List subs=dashboardService.subscriptions(springSecurityService.currentUser?.email)
        List tids=subs.collect{it.topic.id}
        Long tid=0.0
        Long id = Long.parseLong(params.id)
        Subscription sub = Subscription.get(id)

        if(sub==null){
          subs=Subscription.createCriteria().list{
              eq('topic.id',id)
              /*eq('user.id',user.id)*/
          }
            sub=subs.getAt(0)

        }

        tid=sub.topic.id

        Long subscount = Subscription.createCriteria().count {
            eq("topic.id", tid)
        }
        int postcount = Resources.createCriteria().count {
            eq('topic.id', tid)
        }

        List<Subscription> subscription = Subscription.createCriteria().list {
            eq("topic.id", tid)
        }
        List<Users> users = subscription*.user
        List<Long> userslist = users.collect { it.id }


        List subscriptioncount = topicService.subscriptioncount(userslist)

        List postscount = topicService.topiccount(userslist)

        List<Resources> resource = Resources.createCriteria().list {
            eq("topic.id", tid)
        }

        List resourcelist=resource.collect{it.id}
        if(!resourcelist){
            render(view:"topicshow" ,model : [read:[],userdata:user,tids:tids,subs:sub , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource])

        }
        else{
            List read=Reading_Item.createCriteria().list{
                inList("resource.id",resourcelist)
                eq("user.id",user.id)
            }
            println "------------------------"

            render(view:"topicshow" ,model : [read:read,userdata:user,tids:tids,subs:sub , subscount:subscount , postcount : postcount , subscription:subscription,subscriptioncount:subscriptioncount , postscount:postscount,resources:resource])

        }

    }
}