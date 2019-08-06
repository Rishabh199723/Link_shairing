import project.UserPasswordEncoderListener
//import demo.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
//    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))

}
