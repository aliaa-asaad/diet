import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/configurations/app_states.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/auth/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterAcceptTermsCheckbox extends StatelessWidget {
  const RegisterAcceptTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, AppState>(
      buildWhen: (previous, current) => current is CheckState,
      builder: (context, state) {
        return CheckboxListTile.adaptive(
          value: bloc.isChecked,
          onChanged: (bool? value) {
            bloc.add(CheckEvent());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.zero,
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.green,
          title: RichText(
            text: const TextSpan(
              text: 'I Accept the ',
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'terms & Conditions',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  /*  recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle terms & conditions tap
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Terms & Conditions'),
                                  content: const Text(
                                      'Display terms & conditions here.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }, */
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
