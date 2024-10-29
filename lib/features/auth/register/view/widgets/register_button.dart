import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/core/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return BlocConsumer<RegisterBloc, AppState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        else if (state is LoadedState) {
          Navigator.pushNamed(context, AppRoutes.navBar);
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
              : const Text('Register',
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
