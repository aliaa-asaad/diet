import 'package:diet/core/configurations/app_events.dart';
import 'package:diet/core/shared/widgets/custom_button.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalButtons extends StatelessWidget {
  const TotalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: AppColors.lightGreen,
            textColor: AppColors.primaryColor,
            title: 'Add more items',
            height: 52,
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            height: 52,
            title: 'Checkout',
            onPressed: () {
              context.read<TotalBloc>().add(UpdateEvent());
            },
          ),
        ),
      ],
    );
  }
}
