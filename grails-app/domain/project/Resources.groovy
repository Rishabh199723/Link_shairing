package project

class Resources {
    String description
    Users createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic,createdBy:Users]
    static hasMany = [readingItems:Reading_Item,resourcerate:Resource_Rating]
    static constraints = {
        description nullable:true,size:0..100
    }
}
