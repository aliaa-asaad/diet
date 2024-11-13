import 'package:diet/core/configurations/validations.dart';
import 'package:diet/core/shared/widgets/custom_form_field.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';
import 'package:diet/features/auth/register/view/widgets/custom_phone_form_field.dart';
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
            validator: Validations.validateEmail,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomPhoneFormField(bloc: bloc),
          /*  CustomFormField(
            controller: bloc.phoneNumberController,
            hintText: '',
            prefixIcon: Image.asset(
              AppImages.flag,
            ),
          ), */
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.passwordController,
            hintText: 'Password',
            validator: Validations.validatePassword,
            textInputType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          CustomFormField(
            controller: bloc.confirmPasswordController,
            hintText: 'Confirm Password',
            validator: (value) {
              Validations.validateConfirmPassword(value!, bloc.passwordController.text);
              return null;
            },
            textInputType: TextInputType.visiblePassword,
            isPassword: true,
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
