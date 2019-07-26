package project

import grails.transaction.Transactional

@Transactional
class UserListService {


    def serviceMethod() {
    def user=Users.list()
        return user
    }
}
