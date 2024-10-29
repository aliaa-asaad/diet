import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/features/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:diet/features/auth/forget_password/view/widgets/forget_password_button.dart';
import 'package:diet/features/auth/forget_password/view/widgets/forget_password_form_field.dart';
import 'package:diet/features/auth/widgets/custom_app_bar.dart';
import 'package:diet/features/auth/widgets/custom_auth_description.dart';
import 'package:diet/features/auth/widgets/custom_auth_title.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
          icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordBloc(),
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
                    CustomAuthTitle(title: "Forget Password"),
                    CustomAuthDescription(
                      description:
                          "We'll send an the link to the email you'll provide below",
                    ),
                    SizedBox(height: 24),
                    ForgetPasswordFormFields(),
                    SizedBox(height: 24),
                    ForgetPasswordButton(),
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
