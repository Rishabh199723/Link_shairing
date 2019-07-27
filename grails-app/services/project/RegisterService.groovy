package project

import grails.transaction.Transactional


@Transactional
class RegisterService {

    def serviceMethod(params,request) {

        if(params.confirm_password.equals(params.password)==true){
            String email = params.email
            String username = params.username
            def dec = request.getFile('photo')
            if(dec){
                File file=new File( "/home/rishabh/Desktop/linkpics/${username}.jpg")
                dec.transferTo(file)
            }

            String password = params.password
            String firstname = params.firstname
            String lastname = params.lastname
            String confirm = params.confirm_password
            String photo1 = "/home/rishabh/Desktop/linkpics/${username}.jpg"
            Users user = new Users(email: email, username: username, password: password, fName: firstname, lName: lastname, admin: true, active: true,photo:photo1)
            user.save(flush: true, failOnError: true, validate: false)
            return 1
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
            return 0
        }
        else {
            def pass=user.password
            if(password.equals(pass)==false){
                return 0
            }
            else{
                return 1
            }

        }

    }
}
