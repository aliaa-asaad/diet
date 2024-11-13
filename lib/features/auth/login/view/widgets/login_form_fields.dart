import 'package:diet/core/configurations/validations.dart';
import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/features/auth/login/bloc/login_bloc.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginBloc>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomFormField(
            controller: cubit.emailController,
            hintText: 'Email Address',
            validator: Validations.validateEmail,
            textInputType: TextInputType.emailAddress,

          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: cubit.passwordController,
            hintText: 'Password',
            validator: Validations.validatePassword,
            textInputType: TextInputType.visiblePassword,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
