package project

    class Resource_Rating {
        Resources resource
        Users user
        Integer score

        static belongsTo = [user:Users]

        static constraints = {
            score range:0..5,nullable:true
        }
    }

