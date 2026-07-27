import 'package:firebase_auth/firebase_auth.dart';

class SignUpRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  SignUpRemoteDataSource({required this.firebaseAuth});

  Future<UserCredential> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await credential.user?.updateDisplayName(name);

    return credential;
  }
}
