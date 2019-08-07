package project

import grails.plugin.springsecurity.annotation.Secured



class UserListController {
    static defaultAction = "userlist"
    def userListService
    def springSecurityService
    @Secured(['ROLE_ADMIN'])
    def userlist() {
        Users u=Users.findByEmail(springSecurityService.currentUser?.email)
        if(u.admin==false){
            redirect(controller: 'Dashboard',action: 'dashboard')
        }
        else{
            List list=userListService.getuserlist()
            render(view:'userlist',model:[lists:list])
        }

    }
    @Secured(['ROLE_ADMIN'])
    def changePermission()
    {
        Long userId = Long.parseLong(params.id)
        userListService.updatePermission(userId)
        redirect controller: 'UserList', action: 'userlist'
    }
    @Secured(['ROLE_ADMIN'])
    def changeAdmin()
    {
        Long userId = Long.parseLong(params.id)
        userListService.updateAdmin(userId)
        redirect controller:'UserList' ,action:'userlist'
    }
}
