package project

import grails.transaction.Transactional

@Transactional
class ProfileService {

    def update(params,request,user) {

        user.fName=params.fname
        user.lName=params.lname
        user.username=params.username
        def dec = request.getFile('photo')
        if(dec){
            File file=new File( "/home/rishabh/project/grails-app/assets/images/${params.username}.jpg")
            dec.transferTo(file)
        }
        else{
            String photo1="default.jpg"
        }
        String photo1 = "${params.username}.jpg"
        user.photo=photo1
        user.save(flush:true)
        return 1
    }

    def updatepass(params,user){
        user.password=params.password
        user.save(flush:true)
    return 1
    }
}
