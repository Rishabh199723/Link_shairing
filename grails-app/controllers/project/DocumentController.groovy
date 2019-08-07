package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DocumentController {
    def documentService
    def springSecurityService

    def download()
    {

        Long id=Long.parseLong(params.id)
        DocumentResource dr = (DocumentResource) Resources.get(id)
        //Users user = session.user
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
        def file=new File("/home/rishabh/Downloads/${user}.txt")
        def temp = new File("/home/rishabh/project/grails-app/assets/documents/"+dr.documentpath)
        if (temp.exists()) {
            file = temp
        } else {
            file = null
        }



        response.setHeader("Content-disposition", "attachment;filename=\"${dr.documentpath}\"")
        response.outputStream << file.bytes

      /*  println "============above redirect"
        redirect(controller:"Topic" ,action:"topicshow", params:[id:params.tid])*/
    }


    def save()
    {
        documentService.saveMethod(params,springSecurityService.currentUser?.username,request)
        redirect(controller:"Dashboard" , action:"dashboard")
    }


    def updatedocument(params,request){

        def file=request.getFile('doc')
        Long id=Long.parseLong(params.id)
        String filename=file.getOriginalFilename()
        Users user=Users.findByEmail(springSecurityService.currentUser?.email)
        Topic topic=Resources.get(id).topic
        String path='/home/rishabh/project/grails-app/assets/documents/'+filename
        def file1=new File(path)
        file.transferTo(file1)
        DocumentResource d=DocumentResource.get(id)
        d.documentpath=filename
        d.description=params.description
        d.save(flush:true)
        Reading_Item r1=Reading_Item.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        r1.isRead=true
        r1.save(flush:true)
        List users=Subscription.createCriteria().list{
            eq('topic.id',topic.id)
            ne('user.id',user.id)
        }.collect{it.user}
        users.each{ user1->
            Reading_Item r=Reading_Item.createCriteria().get{
                eq('resource.id',id)
                eq('user.id',user1.id)
            }
            r.isRead=false
            r.save(flush:true)
        }
        redirect (controller: 'dashboard' ,action:'dashboard')

    }
}
