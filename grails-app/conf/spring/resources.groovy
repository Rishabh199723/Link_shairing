import project.UsersPasswordEncoderListener
beans = {
    usersPasswordEncoderListener(UsersPasswordEncoderListener, ref('hibernateDatastore'))
}
