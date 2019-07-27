package project

class LinkController {
def linkService
    def save() {
        linkService.saveMethod(params,session.uname)
        redirect(controller:"Dashboard" , action:"dashboard")

    }
}
