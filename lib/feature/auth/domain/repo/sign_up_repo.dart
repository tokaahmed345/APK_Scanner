import 'package:apk_scanner/core/utils/failure/failure.dart';
import 'package:apk_scanner/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
