import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';
import 'package:diet/features/auth/register/view/widgets/register_accept_terms_checkbox.dart';
import 'package:diet/features/auth/register/view/widgets/register_already_have_an_account.dart';
import 'package:diet/features/auth/register/view/widgets/register_button.dart';
import 'package:diet/features/auth/register/view/widgets/register_form_fields.dart';
import 'package:diet/features/auth/widgets/custom_app_bar.dart';
import 'package:diet/features/auth/widgets/custom_auth_description.dart';
import 'package:diet/features/auth/widgets/custom_auth_title.dart';
import 'package:diet/features/auth/widgets/or_divider.dart';
import 'package:diet/features/auth/widgets/social_media_auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAppBar(),

              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAuthTitle(title: "Create New Account"),
                    CustomAuthDescription(
                      description: "Have a healthy & Tasty day ahead",
                    ),
                    SizedBox(height: 24),
                    SocialMediaAuth(),
                    SizedBox(height: 35),
                    OrDivider(),
                    SizedBox(height: 34),
                    RegisterFormFields(),
                    SizedBox(height: 8),
                    RegisterAcceptTermsCheckbox(),
                    SizedBox(height: 24),
                    RegisterButton(),
                    SizedBox(height: 24),
                    RegisterAlreadyHaveAnAccount(),
                  ],
                ),
              ), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
