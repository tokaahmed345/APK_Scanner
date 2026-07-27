import 'package:apk_scanner/core/utils/failure/failure.dart';
import 'package:apk_scanner/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:apk_scanner/feature/auth/domain/repo/sign_up_repo.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final SignUpRepo authRepository;

  SignUpUseCase({required this.authRepository});

   Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await authRepository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}