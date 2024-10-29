import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/features/auth/login/bloc/login_bloc.dart';
import 'package:diet/features/auth/login/view/widgets/login_button.dart';
import 'package:diet/features/auth/login/view/widgets/login_dont_have_an_account.dart';
import 'package:diet/features/auth/login/view/widgets/login_forget_password_button.dart';
import 'package:diet/features/auth/login/view/widgets/login_form_fields.dart';
import 'package:diet/features/auth/widgets/custom_app_bar.dart';
import 'package:diet/features/auth/widgets/custom_auth_description.dart';
import 'package:diet/features/auth/widgets/custom_auth_title.dart';
import 'package:diet/features/auth/widgets/or_divider.dart';
import 'package:diet/features/auth/widgets/social_media_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => LoginBloc(),
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
                    CustomAuthTitle(title: "Welcome Back!"),
                    CustomAuthDescription(
                      description: "Have a healthy & Tasty day ahead",
                    ),
                    SizedBox(height: 24),
                    SocialMediaAuth(),
                    SizedBox(height: 35),
                    OrDivider(),
                    SizedBox(height: 34),
                    LoginFormFields(),
                    SizedBox(height: 8),
                    LoginForgetPasswordButton(),
                    SizedBox(height: 24),
                    LoginButton(),
                    SizedBox(height: 24),
                    LoginDontHaveAnAccount(),
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
