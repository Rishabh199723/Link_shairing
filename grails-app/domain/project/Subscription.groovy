package project

class Subscription {
    Topic topic
    Users user
    Seriousness seriousness
    Date dateCreated

    static belongsTo = [user:Users, topic:Topic]

    static constraints = {

    }
}
