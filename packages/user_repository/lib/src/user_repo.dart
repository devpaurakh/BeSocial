

import 'package:user_repository/user_repository.dart';

abstract class UserRepo{


  Future<void> signIn(String email, String password);

  Future<void> signOut();

  Future<MyUserModels> signUp(MyUserModels myUser, String password);


  Future<void> reSetPassword(String email);

  
}