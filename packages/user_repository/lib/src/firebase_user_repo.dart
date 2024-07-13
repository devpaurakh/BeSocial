import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/web.dart';
import 'package:user_repository/src/models/my_user_models.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepo {
  final FirebaseAuth _firebaseAuth;
  Logger logger = Logger();

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<MyUserModels> signUp(MyUserModels myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);

      myUser = myUser.copyWith(id: user.user!.uid);

      return myUser;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> reSetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
