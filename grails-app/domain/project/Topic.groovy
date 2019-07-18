package project

class Topic {
    String name
    Users createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static belongsTo = [createdBy: Users]
    static hasMany = [resources2: Resources, subscriptions1: Subscription]


    static constraints = {

    }
}