package project


class UserController {
    def RegisterService

    def index() {


    print "inside"
        def sign=RegisterService.serviceMethod(params)
        if(sign==1){
            render "success"
        }
        else{
            render (view:'index')
        }

    }

    def Signup(){
        println "inside"
        def login=RegisterService.loginMethod(params)
            if(login==1){
                render "Loggin in"
            }
            else
            {
                render "Incorrect"
            }

    }
}
