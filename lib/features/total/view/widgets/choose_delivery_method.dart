import 'package:diet/core/theme/assets/images.dart';
import 'package:diet/core/theme/colors.dart';
import 'package:diet/features/total/bloc/total_bloc.dart';
import 'package:diet/features/total/view/widgets/total_deliver_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDeliveryMethod extends StatefulWidget {
  const ChooseDeliveryMethod({super.key});

  @override
  State<ChooseDeliveryMethod> createState() => _ChooseDeliveryMethodState();
}

class _ChooseDeliveryMethodState extends State<ChooseDeliveryMethod> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TotalBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose the method',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TotalDeliveryMethodCard(
              onTap: () {
                setState(() {
                  cubit.selectedMethod = 1;
                });
              },
              image: AppImages.delivery,
              border: Border.all(
                  width: 1,style: BorderStyle.solid,
                  color: cubit.selectedMethod == 1
                      ? Colors.transparent
                      : AppColors.grey),
              background: cubit.selectedMethod == 1
                  ? AppColors.lightGreen
                  : AppColors.white,
              title: 'Delivery',
              width: cubit.selectedMethod == 1 ? 10 : 0,
            ),
            const SizedBox(
              width: 16,
            ),
            TotalDeliveryMethodCard(
              onTap: () {
                setState(() {
                  cubit.selectedMethod = 0;
                });
              },
              image: AppImages.pickup,
              border: Border.all(
                  width: 1,
                  color: cubit.selectedMethod == 0
                      ? Colors.transparent
                      : AppColors.grey),
              background: cubit.selectedMethod == 0
                  ? AppColors.lightGreen
                  : AppColors.white,
              title: 'Pickup',
              width: cubit.selectedMethod == 0 ? 10 : 0,
            ),
          ],
        )
      ],
    );
  }
}
