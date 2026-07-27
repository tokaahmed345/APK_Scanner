import 'package:apk_scanner/feature/auth/data/remote_datasource/sign_up_remote_data_source.dart';
import 'package:apk_scanner/feature/auth/data/repo_impl/sign_up_repo_impl.dart';
import 'package:apk_scanner/feature/auth/domain/repo/sign_up_repo.dart';
import 'package:apk_scanner/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSource(firebaseAuth: getIt<FirebaseAuth>()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () =>
        SignUpRepositoryImpl(remoteDataSource: getIt<SignUpRemoteDataSource>()),
  );

  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(authRepository: getIt<SignUpRepo>()),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(useCase: getIt<SignUpUseCase>()),
  );
}
