import 'package:apk_scanner/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    super.name,
  });

  factory UserModel.fromFirebaseUser(User user, {String? name}) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: name ?? user.displayName,
    );
  }
}