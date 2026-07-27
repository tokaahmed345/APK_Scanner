import 'package:apk_scanner/core/utils/service_locator/service_locator.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SignUpCubit>(),
        child: const RegisterViewBody(),
      ),
    );
  }
}
