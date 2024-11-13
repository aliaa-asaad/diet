import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/shared/widgets/custom_button.dart';
import 'package:diet/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return BlocConsumer<LoginBloc, AppState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
         if (state is LoadedState) {
          
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.navBar,
              (route) => false);
        }
      },

      listenWhen: (previous, current) =>
          current is ErrorState ||
          current is LoadedState ||
          current is LoadingState,
      buildWhen: (previous, current) =>
          current is LoadingState ||
          current is ErrorState ||
          current is LoadedState,
      builder: (context, state) {
        return CustomButton(
          child: (state is LoadingState)
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text('Login',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
          onPressed: () {
            if (bloc.formKey.currentState!.validate()) {
              bloc.add(ClickEvent());
            }
          },
        );
      },
    );
  }
}
