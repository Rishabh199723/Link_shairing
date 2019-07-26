package project

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def seriousness(params) {
        Subscription s=Subscription.get(params.sid)
        println "-----------------inside seriousness"
        println params.seriousness
        s.seriousness=params.seriousness

        s.save(flush:true)
    }
}
