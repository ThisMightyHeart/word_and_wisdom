import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> githubSignInFunc() async {
  GithubAuthProvider githubProvider = GithubAuthProvider();

  return await FirebaseAuth.instance.signInWithPopup(githubProvider);
}
