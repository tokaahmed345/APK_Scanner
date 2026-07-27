import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:apk_scanner/feature/auth/presentation/cubit/sign_up_cubit/sign_up_state.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/login_redirect_text.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_form_field.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onCreateAccountPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpCubit>().registerUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Account created successfully! Welcome ${state.user.name ?? ''}',
              ),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).push(RoutesName.mainNavigation);
          // TODO: انقلي المستخدم للـ Home screen هنا (مثلاً Navigator / GoRouter)
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.darkBackground,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('APK Scan', style: AppStyle.authLogo),
                    const SizedBox(height: 24),
                    const RegisterTitleSection(),
                    const SizedBox(height: 24),
                    RegisterFormFields(
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                    const SizedBox(height: 24),
                    state is SignUpLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : CustomElevatedButton(
                            text: 'CREATE ACCOUNT',
                            onPressed: _onCreateAccountPressed,
                            width: double.infinity,
                            height: 52,
                            radius: 12,
                            backgroundColor: AppColors.primary,
                            textStyle: AppStyle.authButtonText,
                          ),
                    const SizedBox(height: 16),
                    const LoginRedirectText(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
