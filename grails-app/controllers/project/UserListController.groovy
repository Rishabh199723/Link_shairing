package project

class UserListController {
    static defaultAction = "userlist"
    def UserListService
    def userlist() {
    def list=UserListService.serviceMethod()
        render(view:"userlist",model:[lists:list])
    }
}
