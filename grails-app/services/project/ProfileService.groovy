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
            File file=new File( "/home/rishabh/Desktop/linkpics/${params.username}.jpg")
            dec.transferTo(file)
        }
        String photo1 = "/home/rishabh/Desktop/linkpics/${params.username}.jpg"
        user.photo=photo1
        return 1
    }

    def updatepass(params,user){
        user.password=params.password
    return 1
    }
}
