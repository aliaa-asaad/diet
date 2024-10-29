import 'package:diet/core/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/features/auth/forget_password/bloc/forget_password_bloc.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ForgetPasswordBloc>();
    return BlocBuilder<ForgetPasswordBloc, AppState>(
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
              : const Text('Send the reset link',
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
