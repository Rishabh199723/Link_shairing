package project

class LinkResource extends Resources {
String link
    static constraints = {
        link(blank:false,url:true,nullable: true)
    }
}
