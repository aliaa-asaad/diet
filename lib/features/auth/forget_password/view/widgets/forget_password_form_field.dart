import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/features/auth/forget_password/bloc/forget_password_bloc.dart';

class ForgetPasswordFormFields extends StatelessWidget {
  const ForgetPasswordFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordBloc>();
    return Form(
      key: cubit.formKey,
      child: CustomFormField(
        controller: cubit.emailController,
        hintText: 'Email Address',
      ),
    );
  }
}
