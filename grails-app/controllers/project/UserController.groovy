package project


class UserController {
    def registerService

    def index() {



        def sign=registerService.serviceMethod(params,request)
        if(sign==1){
            render "success"
        }
        else{
            render (view:'index')
        }

    }

    def signup(){

        def login=registerService.loginMethod(params)
            if(login==1){
                session.name=params.email
                Users u=Users.findByEmail(session.name)
                session.uname=u.username
                redirect(controller:"Dashboard", action:"dashboard")
            }
            else
            {
                flash.message="Invalid credentials"
                redirect(url:"/")
            }

    }

    def logout(){
        session.invalidate()
        redirect(url:'/')
    }




    def passreset(){
        render "Reset password"
    }
}
