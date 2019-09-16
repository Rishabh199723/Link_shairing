package project

import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN','ROLE_USER'])
@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class UserController {
    def registerService
    def mailService


    def index() {

        def sign = registerService.serviceMethod(params,request)
      /*  if (sign == 1) {
            redirect(url:"/")
        } else {
            flash.message2="Username already taken"
            redirect(url:s "/")
        }*/

    }

  /*  def signup() {
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



    }*/

   /* def logout() {
        session.invalidate()
        redirect(url: '/')
    }
*/

    def passreset() {
        println params.email
        Users user=Users.findByEmail(params.email)
        def num=Math.random()
        def num1=num*1000000
        def token=(int)num1
        user.token=token.toString()
        user.save(flush:true)
        String link=createLink(controller:'User' ,action:'resetpass' ,params:[email:user.email],absolute: true)
         mailService.sendMail( {
            to "${user.email}"
            subject "Hello ${user.username} .Change password link "
            text link+"    .Your otp is${token}."
        })
    }

    def resetpass(){

        render(view:'password',model:[email:params.email])
    }

    def changepassword(){
        Users user=Users.findByEmail(params.email)

        if((params.otp.toString()).equals(user.token)==true){
            user.password=params.password
            user.save(flush:true)
            flash.message="Password changed "
            redirect(url:"/")
        }
        else{
            flash.message="Wrong Otp entered"
            redirect(url:"/")
        }

    }
}