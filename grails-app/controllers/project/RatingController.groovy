package project

class RatingController {
    def ratingService
    def save() {
        ratingService.saveMethod(params)
    }
}
