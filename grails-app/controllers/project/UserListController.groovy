package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])

class UserListController {
    static defaultAction = "userlist"
    def userListService
    def springSecurityService
    def userlist() {
        Users u=Users.findByEmail(springSecurityService.currentUser?.email)
        if(u.admin==false){
            redirect(controller: 'Dashboard',action: 'dashboard')
        }
        else{
            def list=UserListService.serviceMethod()
            render(view:"userlist",model:[lists:list])
        }

    }

    def changePermission()
    {

        Long userId = Long.parseLong(params.id)
        //println(userId)
        userListService.updatePermission(userId)
        redirect controller: 'UserList', action: 'userlist'
    }
    def changeAdmin()
    {
        Long userId = Long.parseLong(params.id)
        userListService.updateAdmin(userId)
        redirect controller:'UserList' ,action:'userlist'
    }
}
