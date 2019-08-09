package project

import grails.transaction.Transactional


@Transactional
class RegisterService {
    def springSecurityService

    def serviceMethod(params,request) {

        println params

        if(params.confirm_password.equals(params.password)==true){
            String email = params.email
            String username = params.username
            def dec = request.getFile('photo')
            def ph=dec.getOriginalFilename()

            if(ph){
                File file=new File( "/home/rishabh/project/grails-app/assets/images/${username}.jpg")
                dec.transferTo(file)
            }

            String password = params.password
            String firstname = params.firstname
            String lastname = params.lastname
            String confirm = params.confirm_password
            String photo1=""
            if(ph){
                 photo1 = "${username}.jpg"

            }
            else
            {
                 photo1="default.jpg"
            }
            def userRole=Role.findOrSaveWhere(authority: 'ROLE_USER')
            def user = Users.findOrSaveWhere(email: email, username: username, password: password, fName: firstname, lName: lastname, admin: false, active: true,photo:photo1)
            if(!user.authorities.contains(userRole)){
                UsersRole.create(user,userRole,true)
                println "inside"
            }

            if(user.validate()){
                user.save(flush: true, failOnError: true, validate: false)
                return 1
            }
            else
            {
                return 0
            }

        }
        else{
            return 0
        }

    }

    def loginMethod(params){
        String email=params.email
        String password = params.password
        def user=Users.findByEmail(email)
        //println user
        if(user==null){
            return null
        }
        else {
            def pass=user.password
            if(password.equals(pass)==false){
                return null
            }
            else{
                return user
            }

        }

    }
}
