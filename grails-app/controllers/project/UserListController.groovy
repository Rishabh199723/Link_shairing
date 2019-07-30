package project

class UserListController {
    static defaultAction = "userlist"
    def UserListService
    def userlist() {
    def list=UserListService.serviceMethod()
        render(view:"userlist",model:[lists:list])
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
