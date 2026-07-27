import 'package:apk_scanner/feature/auth/domain/use_case/sign_up_use_case.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final  SignUpUseCase useCase;

  SignUpCubit({required this.useCase}) : super(SignUpInitial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    final result = await useCase.call(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
}