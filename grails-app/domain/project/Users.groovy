package project

class Users {
    String email
    String username
    String password
    String fName
    String lName
    Byte photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscribed:Subscription, topics1:Topic, resources1:Resources, readItems1:Reading_Item, resourcerated:Resource_Rating]

    static constraints = {
        email(unique:true,email:true)
        username(unique:true)
        password(size:6..15, matches:"[a-zA-Z0-9]+")
        photo(nullable:true)
    }
}

