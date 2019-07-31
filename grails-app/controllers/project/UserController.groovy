package project


class UserController {
    def registerService

    def index() {


        def sign = registerService.serviceMethod(params, request)
        if (sign == 1) {
            redirect(url: "/")
        } else {
            render(view: 'index')
        }

    }

    def signup() {
        def login = registerService.loginMethod(params)


            if (login) {
                if(login.active==true){
                    session.name = params.email
                    session.uname = login.username
                    redirect(controller: "Dashboard", action: "dashboard")

                }
                else{
                    flash.message="User Deactivated"
                    redirect(url: "/")
                }

            } else {

                flash.message = "Invalid credentials"
                redirect(url: "/")
            }



    }

    def logout() {
        session.invalidate()
        redirect(url: '/')
    }


    def passreset() {
        render "Reset password"
    }



}