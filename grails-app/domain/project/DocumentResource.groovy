package project

class DocumentResource extends Resources {
String documentpath
    static constraints = {
        documentpath nullable: true,blank:false
    }
}
