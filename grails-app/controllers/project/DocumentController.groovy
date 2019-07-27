package project

class DocumentController {
def documentService

    def download()
    {

        Long id=Long.parseLong(params.id)
        DocumentResource dr = (DocumentResource) Resources.get(id)
        //Users user = session.user
        Users user=Users.findByEmail(session.name)
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
        documentService.saveMethod(params,session.uname,request)
        redirect(controller:"Dashboard" , action:"dashboard")


    }
}
