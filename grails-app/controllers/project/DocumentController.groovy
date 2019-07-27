package project

class DocumentController {
def documentService
    def save()
    {
        println "================================="
        println params
        documentService.saveMethod(params,session.uname,request)
        redirect(controller:"Dashboard" , action:"dashboard")


    }
}
