package project

import grails.transaction.Transactional

@Transactional
class UserListService {


    def getuserlist() {
    List user=Users.list()
        return user
    }

    def updatePermission(Long userId)
    {
        Users user = Users.get(userId)
        user.active = !user.active
        user.save(flush: true,failOnError: true)
    }
    def updateAdmin(Long userId)
    {
        Users user = Users.get(userId)
        user.admin = !user.admin
        user.save(flush: true,failOnError: true)
    }
}
