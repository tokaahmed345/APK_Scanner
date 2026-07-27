import 'package:apk_scanner/core/utils/failure/failure.dart';
import 'package:apk_scanner/feature/auth/data/models/sign_up_model.dart';
import 'package:apk_scanner/feature/auth/data/remote_datasource/sign_up_remote_data_source.dart';
import 'package:apk_scanner/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:apk_scanner/feature/auth/domain/repo/sign_up_repo.dart';
import 'package:dartz/dartz.dart';

class SignUpRepositoryImpl implements SignUpRepo {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final userModel = UserModel.fromFirebaseUser(
          userCredential.user!,
          name: name,
        );
        return Right(userModel);
      } else {
        return Left(Failure('User creation failed. Please try again.'));
      }
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
