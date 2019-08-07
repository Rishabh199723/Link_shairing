package project

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])

class RatingController {
    def ratingService
    def save() {
        ratingService.saveMethod(params)
    }
}
