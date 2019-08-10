package project

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='id', includeNames=true, includePackage=false)
class Users implements Serializable {

	private static final long serialVersionUID = 1
	String email
	String username
	String password
	String fName
	String lName
	String photo
	Boolean admin
	Boolean active
	String token
	Date dateCreated
	Date lastUpdated
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [subscribed:Subscription, topics1:Topic, resources1:Resources, readItems1:Reading_Item, resourcerated:Resource_Rating]


	Set<Role> getAuthorities() {
		(UsersRole.findAllByUsers(this) as List<UsersRole>)*.role as Set<Role>
	}

	static constraints = {
		email(unique:true,email:true)
		username(unique:true)
		photo(nullable:true)
		token(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}
}
