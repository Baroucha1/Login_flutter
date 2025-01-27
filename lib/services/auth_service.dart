import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  // Google Sign In
  signInWithGoogle() async{
    // begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obrain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // reate new credential from user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}