import 'package:apk_scanner/core/utils/service/api_service.dart';
import 'package:apk_scanner/core/utils/service/dio_consumer.dart';
import 'package:apk_scanner/feature/apk_scanner/data/remote_data_source/scan_remote_data_source.dart';
import 'package:apk_scanner/feature/apk_scanner/data/repo_impl/scan_repo_impl.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/repo/scan_repo.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/usecase/scan_use_case.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_cubit.dart';
import 'package:apk_scanner/feature/auth/data/remote_datasource/sign_up_remote_data_source.dart';
import 'package:apk_scanner/feature/auth/data/repo_impl/sign_up_repo_impl.dart';
import 'package:apk_scanner/feature/auth/domain/repo/sign_up_repo.dart';
import 'package:apk_scanner/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
   getIt.registerLazySingleton<Dio>(() => Dio());
getIt.registerLazySingleton<ApiService>(
    () => DioConsumer(dio: getIt<Dio>()));

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


 getIt.registerLazySingleton<ApkScannerRemoteDataSource>(
    () => ApkScannerRemoteDataSource(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ApkScannerRepository>(
    () =>
        ApkScannerRepositoryImpl( getIt<ApkScannerRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ScanApkUseCase>(
    () => ScanApkUseCase( getIt<ApkScannerRepository>()),
  );

  getIt.registerFactory<ApkScannerCubit>(
    () => ApkScannerCubit( getIt<ScanApkUseCase>()),
  );



}
