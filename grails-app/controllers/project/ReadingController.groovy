package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])

class ReadingController {

    def readingService
    def springSecurityService

    def editread()
    {
        if(!springSecurityService.currentUser?.username)
        {
            render("please login first")
        }
        else{
            readingService.editreadMethod(params,springSecurityService.currentUser?.username)
            redirect(controller : "Dashboard" ,action : "dashboard")
        }}
    def delete()
    {
        readingService.deleteMethod(params)
        redirect(controller : "Dashboard" , action : "dashboard")
    }
}