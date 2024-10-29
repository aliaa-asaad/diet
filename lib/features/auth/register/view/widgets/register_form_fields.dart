import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:diet/core/theme/assets/images.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          CustomFormField(
              hintText: 'Full Name', controller: bloc.fullNameController),
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.emailController,
            hintText: 'Email Address',
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.phoneNumberController,
            hintText: '',
            prefixIcon: Image.asset(
              AppImages.flag,
            ),
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.passwordController,
            hintText: 'Password',
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.confirmPasswordController,
            hintText: 'Confirm Password',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            controller: bloc.referralCodeController,
            hintText: 'Enter referral code (Optional)',
          ),
        ],
      ),
    );
  }
}
