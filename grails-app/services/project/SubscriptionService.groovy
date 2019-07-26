package project

import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def seriousness(params) {
        Subscription s=Subscription.get(params.sid)
        s.seriousness=params.seriousness
        s.save(flush:true)
    }
}
